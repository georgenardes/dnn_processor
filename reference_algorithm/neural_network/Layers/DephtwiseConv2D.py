from Layers.BaseLayer import Layer
import numpy as np


def convolution(inputs, filters, bias):
    ib, ih, iw, ic = inputs.shape
    fm, fh, fw, fc = filters.shape

    print("not implemented...")
    return inputs


class DephtwiseConv2D(Layer):
    def __init__(self, name="DephtwiseConv2D", activation=None):
        super().__init__(name)
        self.weights = None
        self.bias = None
        self.activation = activation

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("DephtwiseConv2D trainin not implemented")
        else:
            outputs = convolution(inputs, self.weights, self.bias)

        if self.activation is not None:
            outputs = self.activation(outputs, training)

        return outputs

    def get_config(self):
        return {"name": self.name}

    def get_weights(self):
        return [self.weights, self.bias]

    def load_weights(self, weight_path, bias_path):
        self.weights = np.load(weight_path)
        self.bias = np.load(bias_path)
