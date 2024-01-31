
�vroot"_tf_keras_network*�v{"name": "model_268", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": false, "class_name": "Functional", "config": {"name": "model_268", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_269"}, "name": "input_269", "inbound_nodes": []}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_268", "trainable": true, "dtype": "float32", "factor": [-0.0619877656621364, 0.0619877656621364], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_268", "inbound_nodes": [[["input_269", 0, 0, {}]]]}, {"class_name": "RandomFlip", "config": {"name": "random_flip_268", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_268", "inbound_nodes": [[["random_brightness_268", 0, 0, {}]]]}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_268", "trainable": true, "dtype": "float32", "height_factor": 0.016021697541208354, "width_factor": 0.016021697541208354, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_268", "inbound_nodes": [[["random_flip_268", 0, 0, {}]]]}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_268", "trainable": true, "dtype": "float32", "stddev": 0.014624452273793788, "seed": null}, "name": "gaussian_noise_268", "inbound_nodes": [[["random_translation_268", 0, 0, {}]]]}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_175", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_175", "inbound_nodes": [[["gaussian_noise_268", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_849", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_849", "inbound_nodes": [[["depthwise_conv2d_175", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_674", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_674", "inbound_nodes": [[["activation_849", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_850", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_850", "inbound_nodes": [[["conv2d_674", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_675", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_675", "inbound_nodes": [[["activation_850", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_851", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_851", "inbound_nodes": [[["conv2d_675", 0, 0, {}]]]}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_176", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_176", "inbound_nodes": [[["activation_851", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_852", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_852", "inbound_nodes": [[["depthwise_conv2d_176", 0, 0, {}]]]}, {"class_name": "Flatten", "config": {"name": "flatten_268", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_268", "inbound_nodes": [[["activation_852", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_268", "trainable": true, "dtype": "float32", "rate": 0.5141618531117372, "noise_shape": null, "seed": null}, "name": "dropout_268", "inbound_nodes": [[["flatten_268", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_268", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_268", "inbound_nodes": [[["dropout_268", 0, 0, {}]]]}], "input_layers": [["input_269", 0, 0]], "output_layers": [["dense_268", 0, 0]]}, "shared_object_id": 28, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "is_graph_network": true, "full_save_spec": {"class_name": "__tuple__", "items": [[{"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_269"]}], {}]}, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_269"]}, "keras_version": "2.15.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model_268", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_269"}, "name": "input_269", "inbound_nodes": [], "shared_object_id": 0}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_268", "trainable": true, "dtype": "float32", "factor": [-0.0619877656621364, 0.0619877656621364], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_268", "inbound_nodes": [[["input_269", 0, 0, {}]]], "shared_object_id": 1}, {"class_name": "RandomFlip", "config": {"name": "random_flip_268", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_268", "inbound_nodes": [[["random_brightness_268", 0, 0, {}]]], "shared_object_id": 2}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_268", "trainable": true, "dtype": "float32", "height_factor": 0.016021697541208354, "width_factor": 0.016021697541208354, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_268", "inbound_nodes": [[["random_flip_268", 0, 0, {}]]], "shared_object_id": 3}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_268", "trainable": true, "dtype": "float32", "stddev": 0.014624452273793788, "seed": null}, "name": "gaussian_noise_268", "inbound_nodes": [[["random_translation_268", 0, 0, {}]]], "shared_object_id": 4}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_175", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_175", "inbound_nodes": [[["gaussian_noise_268", 0, 0, {}]]], "shared_object_id": 8}, {"class_name": "Activation", "config": {"name": "activation_849", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_849", "inbound_nodes": [[["depthwise_conv2d_175", 0, 0, {}]]], "shared_object_id": 9}, {"class_name": "Conv2D", "config": {"name": "conv2d_674", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 10}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 11}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_674", "inbound_nodes": [[["activation_849", 0, 0, {}]]], "shared_object_id": 12}, {"class_name": "Activation", "config": {"name": "activation_850", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_850", "inbound_nodes": [[["conv2d_674", 0, 0, {}]]], "shared_object_id": 13}, {"class_name": "Conv2D", "config": {"name": "conv2d_675", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 14}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 15}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_675", "inbound_nodes": [[["activation_850", 0, 0, {}]]], "shared_object_id": 16}, {"class_name": "Activation", "config": {"name": "activation_851", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_851", "inbound_nodes": [[["conv2d_675", 0, 0, {}]]], "shared_object_id": 17}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_176", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 19}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 20}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_176", "inbound_nodes": [[["activation_851", 0, 0, {}]]], "shared_object_id": 21}, {"class_name": "Activation", "config": {"name": "activation_852", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_852", "inbound_nodes": [[["depthwise_conv2d_176", 0, 0, {}]]], "shared_object_id": 22}, {"class_name": "Flatten", "config": {"name": "flatten_268", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_268", "inbound_nodes": [[["activation_852", 0, 0, {}]]], "shared_object_id": 23}, {"class_name": "Dropout", "config": {"name": "dropout_268", "trainable": true, "dtype": "float32", "rate": 0.5141618531117372, "noise_shape": null, "seed": null}, "name": "dropout_268", "inbound_nodes": [[["flatten_268", 0, 0, {}]]], "shared_object_id": 24}, {"class_name": "Dense", "config": {"name": "dense_268", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 25}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 26}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_268", "inbound_nodes": [[["dropout_268", 0, 0, {}]]], "shared_object_id": 27}], "input_layers": [["input_269", 0, 0]], "output_layers": [["dense_268", 0, 0]]}}, "training_config": {"loss": "categorical_crossentropy", "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 30}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Custom>Adam", "config": {"name": "Adam", "weight_decay": null, "clipnorm": null, "global_clipnorm": null, "clipvalue": null, "use_ema": false, "ema_momentum": 0.99, "ema_overwrite_frequency": null, "jit_compile": true, "is_legacy_optimizer": false, "learning_rate": 0.001255031325854361, "beta_1": 0.9, "beta_2": 0.999, "epsilon": 1e-07, "amsgrad": false}}}}2
�root.layer-0"_tf_keras_input_layer*�{"class_name": "InputLayer", "name": "input_269", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_269"}}2
�root.layer-1"_tf_keras_layer*�{"name": "random_brightness_268", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomBrightness", "config": {"name": "random_brightness_268", "trainable": true, "dtype": "float32", "factor": [-0.0619877656621364, 0.0619877656621364], "value_range": [0, 1.0], "seed": null}, "inbound_nodes": [[["input_269", 0, 0, {}]]], "shared_object_id": 1, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-2"_tf_keras_layer*�{"name": "random_flip_268", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomFlip", "config": {"name": "random_flip_268", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "inbound_nodes": [[["random_brightness_268", 0, 0, {}]]], "shared_object_id": 2, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-3"_tf_keras_layer*�{"name": "random_translation_268", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomTranslation", "config": {"name": "random_translation_268", "trainable": true, "dtype": "float32", "height_factor": 0.016021697541208354, "width_factor": 0.016021697541208354, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "inbound_nodes": [[["random_flip_268", 0, 0, {}]]], "shared_object_id": 3, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-4"_tf_keras_layer*�{"name": "gaussian_noise_268", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "GaussianNoise", "config": {"name": "gaussian_noise_268", "trainable": true, "dtype": "float32", "stddev": 0.014624452273793788, "seed": null}, "inbound_nodes": [[["random_translation_268", 0, 0, {}]]], "shared_object_id": 4, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�
root.layer_with_weights-0"_tf_keras_layer*�
{"name": "depthwise_conv2d_175", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_175", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "depthwise_regularizer": null, "depthwise_constraint": null}, "inbound_nodes": [[["gaussian_noise_268", 0, 0, {}]]], "shared_object_id": 8, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 3}}, "shared_object_id": 31}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-6"_tf_keras_layer*�{"name": "activation_849", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_849", "trainable": true, "dtype": "float32", "activation": "relu"}, "inbound_nodes": [[["depthwise_conv2d_175", 0, 0, {}]]], "shared_object_id": 9, "build_input_shape": {"class_name": "TensorShape", "items": [null, 85, 85, 3]}}2
�
root.layer_with_weights-1"_tf_keras_layer*�
{"name": "conv2d_674", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_674", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 10}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 11}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_849", 0, 0, {}]]], "shared_object_id": 12, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 3}}, "shared_object_id": 32}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 85, 85, 3]}}2
�	root.layer-8"_tf_keras_layer*�{"name": "activation_850", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_850", "trainable": true, "dtype": "float32", "activation": "relu"}, "inbound_nodes": [[["conv2d_674", 0, 0, {}]]], "shared_object_id": 13, "build_input_shape": {"class_name": "TensorShape", "items": [null, 82, 82, 16]}}2
�

root.layer_with_weights-2"_tf_keras_layer*�
{"name": "conv2d_675", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_675", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 14}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 15}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_850", 0, 0, {}]]], "shared_object_id": 16, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 16}}, "shared_object_id": 33}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 82, 82, 16]}}2
�
�
root.layer_with_weights-3"_tf_keras_layer*�
{"name": "depthwise_conv2d_176", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_176", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 19}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 20}, "depthwise_regularizer": null, "depthwise_constraint": null}, "inbound_nodes": [[["activation_851", 0, 0, {}]]], "shared_object_id": 21, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 20}}, "shared_object_id": 34}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 41, 41, 20]}}2
�
�
�
�root.layer_with_weights-4"_tf_keras_layer*�{"name": "dense_268", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Dense", "config": {"name": "dense_268", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 25}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 26}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["dropout_268", 0, 0, {}]]], "shared_object_id": 27, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 2000}}, "shared_object_id": 36}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 2000]}}2
��root.keras_api.metrics.0"_tf_keras_metric*�{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 37}2
��root.keras_api.metrics.1"_tf_keras_metric*�{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 30}2