from typing import Any
from Layers.BaseLayer import Layer
import numpy as np


class ActivationLayer(Layer):
    def __init__(self, name="ActivationLayer", activation=None):
        super().__init__(name)
        self.activation = activation

    def __call__(self, inputs, training: bool, engine_name="numpy"):
        outputs = None

        if training:
            raise NotImplementedError("ActivationLayer trainin not implemented")
        else:
            if self.activation is not None:
                outputs = self.activation(inputs, training)

        return outputs

    def get_config(self):
        return {"name": self.name}

    def get_weights(self):
        return []

    def load_weights(self, weight_path, bias_path):
        pass
