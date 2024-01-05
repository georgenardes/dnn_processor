

class Layer:
  def __init__(self, name):
    self.name = name

  def __call__(self, inputs, training:bool):
    pass

  def get_config(self):
    pass
