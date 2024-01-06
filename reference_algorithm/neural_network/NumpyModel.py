class Model:
    def __init__(self, name="NumpyModel"):
        self.name = name
        self.layers = []

    def __call__(self, inputs, training: bool):
        pass

    def load_model(self, model_path):
        pass
