from BaseLayer import Layer
import numpy as np


class Softmax(Layer):
    def __init__(self, name="Softmax"):
        super().__init__(name)

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("softmax trainin not implemented")
        else:
            ex = np.exp(inputs - np.max(inputs, axis=-1, keepdims=True))
            outputs = ex / np.sum(ex, axis=-1, keepdims=True)

        return outputs

    def get_config(self):
        return {"name": self.name}
