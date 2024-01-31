
�troot"_tf_keras_network*�s{"name": "model_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": false, "class_name": "Functional", "config": {"name": "model_26", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_27"}, "name": "input_27", "inbound_nodes": []}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_26", "trainable": true, "dtype": "float32", "factor": [-0.18801794612799747, 0.18801794612799747], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_26", "inbound_nodes": [[["input_27", 0, 0, {}]]]}, {"class_name": "RandomFlip", "config": {"name": "random_flip_26", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_26", "inbound_nodes": [[["random_brightness_26", 0, 0, {}]]]}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_26", "trainable": true, "dtype": "float32", "height_factor": 0.011562829319208741, "width_factor": 0.011562829319208741, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_26", "inbound_nodes": [[["random_flip_26", 0, 0, {}]]]}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_26", "trainable": true, "dtype": "float32", "stddev": 0.044653957412486164, "seed": null}, "name": "gaussian_noise_26", "inbound_nodes": [[["random_translation_26", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_61", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_61", "inbound_nodes": [[["gaussian_noise_26", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_84", "trainable": true, "dtype": "float32", "activation": "tanh"}, "name": "activation_84", "inbound_nodes": [[["conv2d_61", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_62", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_62", "inbound_nodes": [[["activation_84", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_85", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_85", "inbound_nodes": [[["conv2d_62", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_63", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_63", "inbound_nodes": [[["activation_85", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_86", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_86", "inbound_nodes": [[["conv2d_63", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "conv2d_64", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_64", "inbound_nodes": [[["activation_86", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_87", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_87", "inbound_nodes": [[["conv2d_64", 0, 0, {}]]]}, {"class_name": "Flatten", "config": {"name": "flatten_26", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_26", "inbound_nodes": [[["activation_87", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_26", "trainable": true, "dtype": "float32", "rate": 0.5631794543354152, "noise_shape": null, "seed": null}, "name": "dropout_26", "inbound_nodes": [[["flatten_26", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_26", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_26", "inbound_nodes": [[["dropout_26", 0, 0, {}]]]}], "input_layers": [["input_27", 0, 0]], "output_layers": [["dense_26", 0, 0]]}, "shared_object_id": 26, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "is_graph_network": true, "full_save_spec": {"class_name": "__tuple__", "items": [[{"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_27"]}], {}]}, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, 256, 256, 3]}, "float32", "input_27"]}, "keras_version": "2.15.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model_26", "trainable": true, "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_27"}, "name": "input_27", "inbound_nodes": [], "shared_object_id": 0}, {"class_name": "RandomBrightness", "config": {"name": "random_brightness_26", "trainable": true, "dtype": "float32", "factor": [-0.18801794612799747, 0.18801794612799747], "value_range": [0, 1.0], "seed": null}, "name": "random_brightness_26", "inbound_nodes": [[["input_27", 0, 0, {}]]], "shared_object_id": 1}, {"class_name": "RandomFlip", "config": {"name": "random_flip_26", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "name": "random_flip_26", "inbound_nodes": [[["random_brightness_26", 0, 0, {}]]], "shared_object_id": 2}, {"class_name": "RandomTranslation", "config": {"name": "random_translation_26", "trainable": true, "dtype": "float32", "height_factor": 0.011562829319208741, "width_factor": 0.011562829319208741, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "name": "random_translation_26", "inbound_nodes": [[["random_flip_26", 0, 0, {}]]], "shared_object_id": 3}, {"class_name": "GaussianNoise", "config": {"name": "gaussian_noise_26", "trainable": true, "dtype": "float32", "stddev": 0.044653957412486164, "seed": null}, "name": "gaussian_noise_26", "inbound_nodes": [[["random_translation_26", 0, 0, {}]]], "shared_object_id": 4}, {"class_name": "Conv2D", "config": {"name": "conv2d_61", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_61", "inbound_nodes": [[["gaussian_noise_26", 0, 0, {}]]], "shared_object_id": 7}, {"class_name": "Activation", "config": {"name": "activation_84", "trainable": true, "dtype": "float32", "activation": "tanh"}, "name": "activation_84", "inbound_nodes": [[["conv2d_61", 0, 0, {}]]], "shared_object_id": 8}, {"class_name": "Conv2D", "config": {"name": "conv2d_62", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 9}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 10}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_62", "inbound_nodes": [[["activation_84", 0, 0, {}]]], "shared_object_id": 11}, {"class_name": "Activation", "config": {"name": "activation_85", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_85", "inbound_nodes": [[["conv2d_62", 0, 0, {}]]], "shared_object_id": 12}, {"class_name": "Conv2D", "config": {"name": "conv2d_63", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_63", "inbound_nodes": [[["activation_85", 0, 0, {}]]], "shared_object_id": 15}, {"class_name": "Activation", "config": {"name": "activation_86", "trainable": true, "dtype": "float32", "activation": "linear"}, "name": "activation_86", "inbound_nodes": [[["conv2d_63", 0, 0, {}]]], "shared_object_id": 16}, {"class_name": "Conv2D", "config": {"name": "conv2d_64", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 17}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 18}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "conv2d_64", "inbound_nodes": [[["activation_86", 0, 0, {}]]], "shared_object_id": 19}, {"class_name": "Activation", "config": {"name": "activation_87", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_87", "inbound_nodes": [[["conv2d_64", 0, 0, {}]]], "shared_object_id": 20}, {"class_name": "Flatten", "config": {"name": "flatten_26", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten_26", "inbound_nodes": [[["activation_87", 0, 0, {}]]], "shared_object_id": 21}, {"class_name": "Dropout", "config": {"name": "dropout_26", "trainable": true, "dtype": "float32", "rate": 0.5631794543354152, "noise_shape": null, "seed": null}, "name": "dropout_26", "inbound_nodes": [[["flatten_26", 0, 0, {}]]], "shared_object_id": 22}, {"class_name": "Dense", "config": {"name": "dense_26", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 23}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 24}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_26", "inbound_nodes": [[["dropout_26", 0, 0, {}]]], "shared_object_id": 25}], "input_layers": [["input_27", 0, 0]], "output_layers": [["dense_26", 0, 0]]}}, "training_config": {"loss": "categorical_crossentropy", "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 28}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Custom>Adam", "config": {"name": "Adam", "weight_decay": null, "clipnorm": null, "global_clipnorm": null, "clipvalue": null, "use_ema": false, "ema_momentum": 0.99, "ema_overwrite_frequency": null, "jit_compile": true, "is_legacy_optimizer": false, "learning_rate": 0.0001379746536258608, "beta_1": 0.9, "beta_2": 0.999, "epsilon": 1e-07, "amsgrad": false}}}}2
�root.layer-0"_tf_keras_input_layer*�{"class_name": "InputLayer", "name": "input_27", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 256, 256, 3]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_27"}}2
�root.layer-1"_tf_keras_layer*�{"name": "random_brightness_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomBrightness", "config": {"name": "random_brightness_26", "trainable": true, "dtype": "float32", "factor": [-0.18801794612799747, 0.18801794612799747], "value_range": [0, 1.0], "seed": null}, "inbound_nodes": [[["input_27", 0, 0, {}]]], "shared_object_id": 1, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-2"_tf_keras_layer*�{"name": "random_flip_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomFlip", "config": {"name": "random_flip_26", "trainable": true, "dtype": "float32", "mode": "horizontal_and_vertical", "seed": null}, "inbound_nodes": [[["random_brightness_26", 0, 0, {}]]], "shared_object_id": 2, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-3"_tf_keras_layer*�{"name": "random_translation_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "RandomTranslation", "config": {"name": "random_translation_26", "trainable": true, "dtype": "float32", "height_factor": 0.011562829319208741, "width_factor": 0.011562829319208741, "fill_mode": "reflect", "fill_value": 0.0, "interpolation": "bilinear", "seed": null}, "inbound_nodes": [[["random_flip_26", 0, 0, {}]]], "shared_object_id": 3, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-4"_tf_keras_layer*�{"name": "gaussian_noise_26", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "GaussianNoise", "config": {"name": "gaussian_noise_26", "trainable": true, "dtype": "float32", "stddev": 0.044653957412486164, "seed": null}, "inbound_nodes": [[["random_translation_26", 0, 0, {}]]], "shared_object_id": 4, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�
root.layer_with_weights-0"_tf_keras_layer*�
{"name": "conv2d_61", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_61", "trainable": true, "dtype": "float32", "filters": 20, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["gaussian_noise_26", 0, 0, {}]]], "shared_object_id": 7, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 3}}, "shared_object_id": 29}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 256, 256, 3]}}2
�root.layer-6"_tf_keras_layer*�{"name": "activation_84", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_84", "trainable": true, "dtype": "float32", "activation": "tanh"}, "inbound_nodes": [[["conv2d_61", 0, 0, {}]]], "shared_object_id": 8, "build_input_shape": {"class_name": "TensorShape", "items": [null, 121, 121, 20]}}2
�
root.layer_with_weights-1"_tf_keras_layer*�
{"name": "conv2d_62", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_62", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 9}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 10}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_84", 0, 0, {}]]], "shared_object_id": 11, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 20}}, "shared_object_id": 30}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 121, 121, 20]}}2
�	root.layer-8"_tf_keras_layer*�{"name": "activation_85", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Activation", "config": {"name": "activation_85", "trainable": true, "dtype": "float32", "activation": "relu"}, "inbound_nodes": [[["conv2d_62", 0, 0, {}]]], "shared_object_id": 12, "build_input_shape": {"class_name": "TensorShape", "items": [null, 60, 60, 28]}}2
�

root.layer_with_weights-2"_tf_keras_layer*�
{"name": "conv2d_63", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_63", "trainable": true, "dtype": "float32", "filters": 8, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_85", 0, 0, {}]]], "shared_object_id": 15, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 28}}, "shared_object_id": 31}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 60, 60, 28]}}2
�
�
root.layer_with_weights-3"_tf_keras_layer*�
{"name": "conv2d_64", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Conv2D", "config": {"name": "conv2d_64", "trainable": true, "dtype": "float32", "filters": 28, "kernel_size": {"class_name": "__tuple__", "items": [16, 16]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 17}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 18}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["activation_86", 0, 0, {}]]], "shared_object_id": 19, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 8}}, "shared_object_id": 32}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 45, 45, 8]}}2
�
�
�
�root.layer_with_weights-4"_tf_keras_layer*�{"name": "dense_26", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "preserve_input_structure_in_config": false, "autocast": true, "class_name": "Dense", "config": {"name": "dense_26", "trainable": true, "dtype": "float32", "units": 5, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 23}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 24}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "inbound_nodes": [[["dropout_26", 0, 0, {}]]], "shared_object_id": 25, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 25200}}, "shared_object_id": 34}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 25200]}}2
��root.keras_api.metrics.0"_tf_keras_metric*�{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 35}2
��root.keras_api.metrics.1"_tf_keras_metric*�{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}, "shared_object_id": 28}2