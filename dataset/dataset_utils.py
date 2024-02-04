import tensorflow as tf


IMAGE_SIZE = 128


def read_image(image_path):
    image = tf.io.read_file(image_path)
    image = tf.image.decode_jpeg(image, channels=3)
    image.set_shape([IMAGE_SIZE, IMAGE_SIZE, 3])
    return image


def load_data_for_autoencoder(image_list):
    image = read_image(image_list)
    image = tf.cast(image, tf.float16) / 256
    return image, image


def load_data_for_classifier(image_list, label_list, oh_depth):
    image = read_image(image_list)
    image = tf.cast(image, tf.float16) / 256
    label = tf.one_hot(label_list, oh_depth, 1.0, 0.0)
    label.set_shape([5])
    return image, label


def autoencoder_data_generator(image_list, batch_size, drop_remainder=True):
    dataset = tf.data.Dataset.from_tensor_slices((image_list))
    dataset = dataset.shuffle(2048)
    dataset = dataset.map(
        load_data_for_autoencoder, num_parallel_calls=tf.data.AUTOTUNE
    )
    dataset = dataset.batch(
        batch_size, drop_remainder=drop_remainder, num_parallel_calls=tf.data.AUTOTUNE
    )
    return dataset


def classifier_data_generator(
    image_list, labels_list, oh_depth, batch_size, drop_remainder=True
):
    dataset = tf.data.Dataset.from_tensor_slices((image_list, labels_list, oh_depth))
    dataset = dataset.shuffle(2048)
    dataset = dataset.map(load_data_for_classifier, num_parallel_calls=tf.data.AUTOTUNE)
    dataset = dataset.batch(
        batch_size, drop_remainder=drop_remainder, num_parallel_calls=tf.data.AUTOTUNE
    )
    return dataset
