
from BaseLayer import Layer

class FullyConnectedLayer(Layer):
  def __init__(self, name="FullyConnectedLayer"):
    super.__init__(name)

  def __call__(self, inputs, training:bool):
    if training:
      print("training")
    else:
      print("not training")
    
    return inputs

  def get_config(self):
    return {"name": self.name}
