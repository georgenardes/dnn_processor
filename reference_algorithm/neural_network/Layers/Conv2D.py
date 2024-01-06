from Layers.BaseLayer import Layer
import numpy as np


def convolution(inputs, filters, bias, strides, padding):
    ib, ih, iw, ic = inputs.shape
    fh, fw, fc, fm = filters.shape
    stride_h, stride_w = strides

    if padding == "valid":
        oh = int(np.ceil((ih - fh + 1) / stride_h))
        ow = int(np.ceil((iw - fw + 1) / stride_w))
        padded_inputs = inputs

    elif padding == "same":
        # https://www.tensorflow.org/api_docs/python/tf/nn#notes_on_padding_2
        oh = int(np.ceil(ih / stride_h))
        ow = int(np.ceil(iw / stride_w))

        if ih % stride_h == 0:
            pad_along_height = max(fh - stride_h, 0)
        else:
            pad_along_height = max(fh - (ih % stride_h), 0)
        if iw % stride_w == 0:
            pad_along_width = max(fw - stride_w, 0)
        else:
            pad_along_width = max(fw - (iw % stride_w), 0)

        pad_top = pad_along_height // 2
        pad_bottom = pad_along_height - pad_top
        pad_left = pad_along_width // 2
        pad_right = pad_along_width - pad_left

        padded_inputs = np.pad(
            inputs,
            ((0, 0), (pad_top, pad_bottom), (pad_left, pad_right), (0, 0)),
            mode="constant",
        )
    else:
        raise ValueError("Invalid padding")

    output = np.zeros((ib, oh, ow, fm))

    for b in range(ib):
        for h in range(oh):
            for w in range(ow):
                print(h, w)
                for m in range(fm):
                    # Extract the region from the input using array slicing
                    input_region = padded_inputs[
                        b,
                        h * stride_h : h * stride_h + fh,
                        w * stride_w : w * stride_w + fw,
                        :,
                    ]
                    # Perform element-wise multiplication and sum using vectorized operations
                    output[b, h, w, m] = (
                        np.sum(input_region * filters[:, :, :, m]) + bias[m]
                    )

    return output


class Conv2D(Layer):
    def __init__(self, strides, padding, activation=None, name="Conv2D"):
        super().__init__(name)
        self.weights = None
        self.bias = None
        self.strides = strides
        self.padding = padding
        self.activation = activation

    def __call__(self, inputs, training: bool):
        outputs = None

        if training:
            raise NotImplementedError("Conv2D trainin not implemented")
        else:
            outputs = convolution(
                inputs, self.weights, self.bias, self.strides, self.padding
            )

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
