from Layers.BaseLayer import Layer
import numpy as np


class Flatten(Layer):
    def __init__(self, name="Flatten"):
        super().__init__(name)

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("Flatten trainin not implemented")
        else:
            outputs = inputs

        if self.activation is not None:
            outputs = self.activation(outputs, training)

        return outputs

    def get_config(self):
        return {"name": self.name}
