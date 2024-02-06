from Activations.Softmax import Softmax
from Activations.Tanh import Tanh
from Activations.Relu import Relu


def activation_from_name(activation_name):
    assert isinstance(activation_name, str), "activation_name should be str.."

    if activation_name.lower() == "tanh":
        activation = Tanh()
    elif activation_name.lower() == "softmax":
        activation = Softmax()
    elif activation_name.lower() == "relu":
        activation = Relu()
    elif activation_name.lower() == "linear":
        activation = None

    else:
        activation = None
        raise ValueError(f"activation unknow {activation_name}")

    return activation
