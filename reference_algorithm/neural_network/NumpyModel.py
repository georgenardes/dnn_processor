import json
from Layers import *
from Activations.ActivationFactory import activation_from_name


class Model:
    def __init__(self, name="NumpyModel"):
        self.name = name
        self.layers = []

    def __call__(self, inputs, training: bool = False):
        x = inputs
        for l in self.layers:
            x = l(x, training)

        return x

    def load_model(self, model_path):
        """
        model_path should point to a folder containing a model.json
        """

        modelJson = json.load(open(model_path + "model.json"))

        for layerConfig in modelJson["layers"]:
            if layerConfig["layerType"] == "InputLayer":
                layer = InputLayer(layerConfig["layerName"])

            elif layerConfig["layerType"] == "Conv2D":
                layer = Conv2D(
                    padding=layerConfig["layer_config"]["padding"],
                    strides=layerConfig["layer_config"]["strides"],
                    name=layerConfig["layerName"],
                )
                layer.load_weights(
                    model_path + layerConfig["weightPath"],
                    model_path + layerConfig["biasPath"],
                )

                layer.activation = activation_from_name(layerConfig["activation"])

            elif layerConfig["layerType"] == "DepthwiseConv2D":
                layer = DephtwiseConv2D(
                    padding=layerConfig["layer_config"]["padding"],
                    strides=layerConfig["layer_config"]["strides"],
                    name=layerConfig["layerName"],
                )
                layer.load_weights(
                    model_path + layerConfig["weightPath"],
                    model_path + layerConfig["biasPath"],
                )
                layer.activation = activation_from_name(layerConfig["activation"])

            elif layerConfig["layerType"] == "Dense":
                layer = Dense(layerConfig["layerName"])
                layer.load_weights(
                    model_path + layerConfig["weightPath"],
                    model_path + layerConfig["biasPath"],
                )
                layer.activation = activation_from_name(layerConfig["activation"])

            elif layerConfig["layerType"] == "Flatten":
                layer = Flatten(layerConfig["layerName"])

            elif layerConfig["layerType"] == "Dropout":
                print("ignoring not implemented dropout")
                continue

            else:
                print(layerConfig)
                raise NotImplementedError(layerConfig["layerName"])

            # add layer to the list of layers of the model
            self.layers.append(layer)

    def summary(self):
        for l in self.layers:
            print(l.name)
