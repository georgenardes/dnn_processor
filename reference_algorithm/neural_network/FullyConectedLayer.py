from BaseLayer import Layer
import numpy as np


class FullyConnectedLayer(Layer):
    def __init__(self, name="FullyConnectedLayer", activation=None):
        super().__init__(name)
        self.weights = None
        self.bias = None
        self.activation = activation

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("FC trainin not implemented")
        else:
            outputs = np.matmul(inputs, self.weights) + self.bias

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
