"""
Some of the functions used here came from: https://keras.io/examples/vision/object_detection_using_vision_transformer/

George
"""


import tensorflow as tf
from tensorflow import keras
from keras import layers

@keras.utils.register_keras_serializable(package="ViTModels")
class CustomPatches(layers.Layer):
    """ 

    This layer implements the patche extractor usefull for processing the image in regions.
    The results of this function should be the same of the original function implemented 
    by tensorflow: tf.image.extract_patches.

    patches = tf.image.extract_patches(
            images=images,
            sizes=[1, self.patch_size, self.patch_size, 1],
            strides=[1, self.patch_size, self.patch_size, 1],
            rates=[1, 1, 1, 1],
            padding="VALID",
        )

    We implement it from scratch to enable ViT exporting for TFJS...

    """

    def __init__(self, patch_size_h, patch_size_w, num_patches_h, num_patches_w, image_size_h,
                 image_size_w, image_channels, name="patch", trainable=False, dtype=tf.float32):
        super().__init__(trainable, name, dtype)
        self.patch_size_h = patch_size_h
        self.patch_size_w = patch_size_w
        self.num_patches_h = num_patches_h
        self.num_patches_w = num_patches_w
        self.image_size_h = image_size_h
        self.image_size_w = image_size_w
        self.image_channels = image_channels
        self.flatten_patch_size = self.patch_size_h * \
            self.patch_size_w*self.image_channels
        self.flatten_num_patches = self.num_patches_h*self.num_patches_w

    def call(self, images):
        splith = tf.split(images, self.num_patches_h, axis=1)
        stackh = tf.stack(splith, axis=1)
        splitw = tf.split(stackh, self.num_patches_w, axis=-2)
        stackw = tf.stack(splitw, axis=2)
        patches = tf.reshape(
            stackw, [-1, self.flatten_num_patches, self.flatten_patch_size])
        # esse -1 pode levar ao erro... mas é usado por conta do batch size
        return patches

    def get_config(self):
        config = super().get_config()
        config.update({
            "patch_size_h": self.patch_size_h,
            "patch_size_w": self.patch_size_w,
            "num_patches_h": self.num_patches_h,
            "num_patches_w": self.num_patches_w,
            "image_size_h": self.image_size_h,
            "image_size_w": self.image_size_w,
            "image_channels": self.image_channels,

        })
        return config

@keras.utils.register_keras_serializable(package="ViTModels")
class PatchEncoder(layers.Layer):
    """
    This layer linearly transforms a patch by projecting it into a vector of size projection_dim.
    It also adds a learnable position embedding to the projected vector.

    """

    def __init__(self, num_patches: int, projection_dim=0, name="patchencoder", trainable=True, dtype=tf.float32):
        super().__init__(trainable, name, dtype)
        self.num_patches = num_patches
        self.projection_dim = projection_dim
        self.projection = layers.Dense(units=self.projection_dim)
        self.position_embedding = layers.Embedding(
            input_dim=self.num_patches, output_dim=self.projection_dim
        )

    def call(self, patch):
        # TODO:
        # this ref use start from 1 when config.classifier=token 
        # https://github.com/sayakpaul/probing-vits/blob/main/vit/layers/pos_embed.py
        # how does this affect the model?        
        positions = tf.range(start=0, limit=self.num_patches, delta=1) 
        encoded = self.projection(patch) + self.position_embedding(positions)
        return encoded

    def get_config(self):
        config = super().get_config()
        config.update({
            "num_patches": self.num_patches,
            "projection_dim": self.projection_dim
        })
        return config


def mlp(x, hidden_units, dropout_rate=0.0, gaussian_noise_factor=0.05, activation='relu', name=None):
    """
    This function creates hidden units for transformer blocks and others 

    """
    for i, units in enumerate(hidden_units):
        x = layers.Dense(units, activation=activation,
                         name=f"{name}.dense.{i}")(x)

        if gaussian_noise_factor > 0:
            x = keras.layers.GaussianNoise(
                gaussian_noise_factor, name=f"{name}.gauss_noise.{i}")(x)
        if dropout_rate != 0.0:
            x = layers.Dropout(dropout_rate, name=f"{name}.dropout.{i}")(x)
    return x


def transformer_block(encoded_patches, num_heads, projection_dim, transformer_units: list,
                      mha_dropout: float = 0.1, units_dropout: float = 0.1, return_attention_scores=False):
    
    # Create a multi-head attention layer.    
    attention_output, attention_scores = layers.MultiHeadAttention(num_heads=num_heads, key_dim=projection_dim, dropout=mha_dropout)(
        encoded_patches, encoded_patches, return_attention_scores=True)
    
    # Skip connection 1.
    x = layers.Add()([attention_output, encoded_patches])
    # Layer normalization 1.
    x1 = layers.LayerNormalization(epsilon=1e-6)(x)
    # MLP.
    x2 = mlp(x1, hidden_units=transformer_units,
             dropout_rate=units_dropout, name="transformer_block")
    # Skip connection 2.
    x = layers.Add()([x2, x1])
    # Layer normalization 2.
    encoded_patches = layers.LayerNormalization(epsilon=1e-6)(x)
    
    if return_attention_scores:
        return encoded_patches, attention_scores    
    
    return encoded_patches