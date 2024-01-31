
�uroot"_tf_keras_network*�u{"name": "model_51", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": false, "class_name": "Functional", "config": {"name": "model_51", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_52"}, "name": "input_52", "inbound_nodes": []}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_51", "trainable": true, "dtype": "float32", "factor": [-0.13525715054801005, 0.13525715054801005], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_51", "inbound_nodes": [[["input_52", 0, 0, {}]]]}, {"class_name": "RandomFlip", "config": {"name": "random_flip_51", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_51", "inbound_nodes": [[["random_brightness_51", 0, 0, {}]]]}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_51", "trainable": true, "dtype": "float32", "height_factor": 0.027100818776958496, "width_factor": 0.027100818776958496, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_51", "inbound_nodes": [[["random_flip_51", 0, 0, {}]]]}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_51", "trainable": true, "dtype": "float32", "stddev": 0.019788680881333374, "seed": null}, "name": "gaussian_noise_51", "inbound_nodes": [[["random_translation_51", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_124", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_124", "inbound_nodes": [[["gaussian_noise_51", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_169", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_169", "inbound_nodes": [[["conv2d_124", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_125", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_125", "inbound_nodes": [[["activation_169", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_170", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_170", "inbound_nodes": [[["conv2d_125", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_126", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_126", "inbound_nodes": [[["activation_170", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_171", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_171", "inbound_nodes": [[["conv2d_126", 0, 0, {}]]]}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_45", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_45", "inbound_nodes": [[["activation_171", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_172", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_172", "inbound_nodes": [[["depthwise_conv2d_45", 0, 0, {}]]]}, {"class_name": "Flatten", "config": {"name": "flatten_51", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_51", "inbound_nodes": [[["activation_172", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_51", "trainable": true, "dtype": "float32", "rate": 0.5724164072715415, "noise_shape": null, "seed": null}, "name": "dropout_51", "inbound_nodes": [[["flatten_51", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_51", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_51", "inbound_nodes": [[["dropout_51", 0, 0, {}]]]}], "input_layers": [["input_52", 0, 0]], "output_layers": [["dense_51", 0, 0]]}, "shared_object_id": 27, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "is_graph_network": true, "full_save_spec": {"class_name": "__tuple__", "items": [[{"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_52"]}], {}]}, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_52"]}, "keras_version": "2.15.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model_51", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_52"}, "name": "input_52", "inbound_nodes": [], "shared_object_id": 0}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_51", "trainable": true, "dtype": "float32", "factor": [-0.13525715054801005, 0.13525715054801005], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_51", "inbound_nodes": [[["input_52", 0, 0, {}]]], "shared_object_id": 1}, {"class_name": "RandomFlip", "config": {"name": "random_flip_51", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_51", "inbound_nodes": [[["random_brightness_51", 0, 0, {}]]], "shared_object_id": 2}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_51", "trainable": true, "dtype": "float32", "height_factor": 0.027100818776958496, "width_factor": 0.027100818776958496, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_51", "inbound_nodes": [[["random_flip_51", 0, 0, {}]]], "shared_object_id": 3}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_51", "trainable": true, "dtype": "float32", "stddev": 0.019788680881333374, "seed": null}, "name": "gaussian_noise_51", "inbound_nodes": [[["random_translation_51", 0, 0, {}]]], "shared_object_id": 4}, {"class_name": "Conv2D", "config": {"name": "conv2d_124", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_124", "inbound_nodes": [[["gaussian_noise_51", 0, 0, {}]]], "shared_object_id": 7}, {"class_name": "Activation", "config": {"name": "activation_169", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_169", "inbound_nodes": [[["conv2d_124", 0, 0, {}]]], "shared_object_id": 8}, {"class_name": "Conv2D", "config": {"name": "conv2d_125", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 9}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 10}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_125", "inbound_nodes": [[["activation_169", 0, 0, {}]]], "shared_object_id": 11}, {"class_name": "Activation", "config": {"name": "activation_170", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_170", "inbound_nodes": [[["conv2d_125", 0, 0, {}]]], "shared_object_id": 12}, {"class_name": "Conv2D", "config": {"name": "conv2d_126", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_126", "inbound_nodes": [[["activation_170", 0, 0, {}]]], "shared_object_id": 15}, {"class_name": "Activation", "config": {"name": "activation_171", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_171", "inbound_nodes": [[["conv2d_126", 0, 0, {}]]], "shared_object_id": 16}, {"class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_45", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 18}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 19}, "depthwise_regularizer": null, "depthwise_constraint": null}, "name": "depthwise_conv2d_45", "inbound_nodes": [[["activation_171", 0, 0, {}]]], "shared_object_id": 20}, {"class_name": "Activation", "config": {"name": "activation_172", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_172", "inbound_nodes": [[["depthwise_conv2d_45", 0, 0, {}]]], "shared_object_id": 21}, {"class_name": "Flatten", "config": {"name": "flatten_51", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_51", "inbound_nodes": [[["activation_172", 0, 0, {}]]], "shared_object_id": 22}, {"class_name": "Dropout", "config": {"name": "dropout_51", "trainable": true, "dtype": "float32", "rate": 0.5724164072715415, "noise_shape": null, "seed": null}, "name": "dropout_51", "inbound_nodes": [[["flatten_51", 0, 0, {}]]], "shared_object_id": 23}, {"class_name": "Dense", "config": {"name": "dense_51", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 24}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 25}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_51", "inbound_nodes": [[["dropout_51", 0, 0, {}]]], "shared_object_id": 26}], "input_layers": [["input_52", 0, 0]], "output_layers": [["dense_51", 0, 0]]}}, "training_config": {"loss": "categorical_crossentropy", "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 29}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Custom>Adam", "config": {"name": "Adam", "weight_decay": null, "clipnorm": null, "global_clipnorm": null, "clipvalue": null, "use_ema": false, "ema_momentum": 0.99, "ema_overwrite_frequency": null, "jit_compile": true, "is_legacy_optimizer": false, "learning_rate": 0.0006681245868094265, "beta_1": 0.9, "beta_2": 0.999, "epsilon": 1e-07, "amsgrad": false}}}}2
�root.layer-0"_tf_keras_input_layer*�{"class_name": "InputLayer", "name": "input_52", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_52"}}2
�root.layer-1"_tf_keras_layer*�{"name": "random_brightness_51", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomBrightness", "config": {"name": "random_brightness_51", "trainable": true, "dtype": "float32", "factor": [-0.13525715054801005, 0.13525715054801005], "value_range": [0, 1.0], "seed": null}, "inbound_nodes": [[["input_52", 0, 0, {}]]], "shared_object_id": 1, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-2"_tf_keras_layer*�{"name": "random_flip_51", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomFlip", "config": {"name": "random_flip_51", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "inbound_nodes": [[["random_brightness_51", 0, 0, {}]]], "shared_object_id": 2, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-3"_tf_keras_layer*�{"name": "random_translation_51", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomTranslation", "config": {"name": "random_translation_51", "trainable": true, "dtype": "float32", "height_factor": 0.027100818776958496, "width_factor": 0.027100818776958496, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "inbound_nodes": [[["random_flip_51", 0, 0, {}]]], "shared_object_id": 3, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-4"_tf_keras_layer*�{"name": "gaussian_noise_51", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "GaussianNoise", "config": {"name": "gaussian_noise_51", "trainable": true, "dtype": "float32", "stddev": 0.019788680881333374, "seed": null}, "inbound_nodes": [[["random_translation_51", 0, 0, {}]]], "shared_object_id": 4, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�
root.layer_with_weights-0"_tf_keras_layer*�
{"name": "conv2d_124", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_124", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [4, 4]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["gaussian_noise_51", 0, 0, {}]]], "shared_object_id": 7, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 3}}, "shared_object_id": 30}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-6"_tf_keras_layer*�{"name": "activation_169", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_169", "trainable": true, "dtype": "float32", "activation": "linear"}, "inbound_nodes": [[["conv2d_124", 0, 0, {}]]], "shared_object_id": 8, "build_input_shape": {"class_name": "TensorShape", "items": [null, 253, 253, 8]}}2
�
root.layer_with_weights-1"_tf_keras_layer*�
{"name": "conv2d_125", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_125", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 9}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 10}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_169", 0, 0, {}]]], "shared_object_id": 11, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 8}}, "shared_object_id": 31}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 253, 253, 8]}}2
�	root.layer-8"_tf_keras_layer*�{"name": "activation_170", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_170", "trainable": true, "dtype": "float32", "activation": "relu"}, "inbound_nodes": [[["conv2d_125", 0, 0, {}]]], "shared_object_id": 12, "build_input_shape": {"class_name": "TensorShape", "items": [null, 127, 127, 20]}}2
�

root.layer_with_weights-2"_tf_keras_layer*�
{"name": "conv2d_126", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_126", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [4, 4]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_170", 0, 0, {}]]], "shared_object_id": 15, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 20}}, "shared_object_id": 32}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 127, 127, 20]}}2
�
�
root.layer_with_weights-3"_tf_keras_layer*�
{"name": "depthwise_conv2d_45", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "DepthwiseConv2D", "config": {"name": "depthwise_conv2d_45", "trainable": true, "dtype": "float32", "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [3, 3]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 18}, "bias_regularizer": null, "activity_regularizer": null, "bias_constraint": null, "depth_multiplier": 1, "depthwise_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 19}, "depthwise_regularizer": null, "depthwise_constraint": null}, "inbound_nodes": [[["activation_171", 0, 0, {}]]], "shared_object_id": 20, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 32}}, "shared_object_id": 33}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 28, 28, 32]}}2
�
�
�
�root.layer_with_weights-4"_tf_keras_layer*�{"name": "dense_51", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Dense", "config": {"name": "dense_51", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 24}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 25}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["dropout_51", 0, 0, {}]]], "shared_object_id": 26, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 800}}, "shared_object_id": 35}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 800]}}2
��root.keras_api.metrics.0"_tf_keras_metric*�{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 36}2
��root.keras_api.metrics.1"_tf_keras_metric*�{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 29}2