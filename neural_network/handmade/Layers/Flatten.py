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
            outputs = np.reshape(inputs, newshape=[inputs.shape[0], -1])

        return outputs

    def get_config(self):
        return {"name": self.name}
