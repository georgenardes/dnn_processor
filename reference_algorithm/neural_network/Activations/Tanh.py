from Layers.BaseLayer import Layer
import numpy as np


class Tanh(Layer):
    def __init__(self, name="Tanh"):
        super().__init__(name)

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("Tanh trainin not implemented")
        else:
            outputs = np.tanh(inputs)

        return outputs

    def get_config(self):
        return {"name": self.name}
