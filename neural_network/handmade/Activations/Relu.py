from Layers.BaseLayer import Layer
import numpy as np


class Relu(Layer):
    def __init__(self, name="Relu"):
        super().__init__(name)

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("Relu trainin not implemented")
        else:
            outputs = np.maximum(inputs, 0)

        return outputs

    def get_config(self):
        return {"name": self.name}
