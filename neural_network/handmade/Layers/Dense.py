from typing import Any
from Layers.BaseLayer import Layer
import numpy as np


class NumpyMatmul:
    def __call__(self, a, b):
        return np.matmul(a, b)


class CustomMatmul:
    def __init__(self, num_multipliers):
        self.num_multipliers = num_multipliers

    def __call__(self, a, b):
        a_shape = a.shape
        b_shape = b.shape
        o_shape = [a_shape[0], b_shape[1]]
        o = np.zeros(o_shape)
        num_chunks = a_shape[1] // self.num_multipliers

        a_reshaped = np.reshape(a, [-1, num_chunks, self.num_multipliers])
        b_reshaped = np.reshape(b, [num_chunks, self.num_multipliers, -1])

        for i in range(num_chunks):
            o += np.matmul(a_reshaped[:, i], b_reshaped[i])

        return o


def CreateEngine(engine_name):
    if engine_name == "numpy":
        return NumpyMatmul()
    elif engine_name == "custom":
        return CustomMatmul()
    else:
        raise ValueError(f"Engine {engine_name} unknown")


class Dense(Layer):
    def __init__(self, name="DenseLayer", activation=None, engine_name="numpy"):
        super().__init__(name)
        self.weights = None
        self.bias = None
        self.activation = activation
        self.current_engine = None
        self.matmul_fn = None
        self.set_engine(engine_name)

    def set_engine(self, engine_name):
        self.current_engine = engine_name
        self.matmul_fn = CreateEngine(engine_name)

    def check_engine(self, engine_name):
        if self.current_engine != engine_name:
            self.set_engine(engine_name)

    def __call__(self, inputs, training: bool, engine_name="numpy"):
        outputs = None

        self.check_engine(engine_name)

        if training:
            raise NotImplementedError("FC trainin not implemented")
        else:
            outputs = self.matmul_fn(inputs, self.weights) + self.bias

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
