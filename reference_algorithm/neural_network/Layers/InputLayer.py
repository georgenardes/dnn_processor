from Layers.BaseLayer import Layer
import numpy as np


class InputLayer(Layer):
    def __init__(self, name="InputLayer"):
        super().__init__(name)

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("InputLayer trainin not implemented")
        else:
            outputs = inputs

        return outputs

    def get_config(self):
        return {"name": self.name}
