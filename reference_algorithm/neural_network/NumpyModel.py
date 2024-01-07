class Model:
    def __init__(self, name="NumpyModel"):
        self.name = name
        self.layers = []

    def __call__(self, inputs, training: bool):
        x = inputs
        for l in self.layers:
            x = l(x, training)

        return x

    def load_model(self, model_path):
        pass

    def summary(self):
        for l in self.layers:
            print(l.name)
