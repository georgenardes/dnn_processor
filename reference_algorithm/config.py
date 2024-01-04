import numpy as np
import array_to_mif as am

np.random.seed(2)


class LayerConfig:
    def __init__(self):
        self.tipo = None
        self.batch = None
        self.input_heigth = None
        self.input_width = None
        self.input_channels = None
        self.input_address = None

        self.num_filters = None
        self.filter_heigth = None
        self.filter_width = None
        self.filter_channels = None  # equal to input channel
        self.filter_address = None
        self.bias_address = None

        self.output_heigth = None
        self.output_width = None
        self.output_channels = None  # equal to num_filters
        self.output_address = None

        self.activation_type = None

        self.input_scale = None
        self.output_scale = None
        self.weight_scale = None

        self.stride = None
        self.pad_size = None

        self.is_adptable = None

        self.gradient_address = None
        self.error_prev_address = None  # L-1 error
        self.error_next_address = None  #  L error

        self.gradient_scale = None
        self.error_scale = None


class MlpLayerConfig(LayerConfig):
    def __init__(self):
        self.batch = 16
        self.input_heigth = 1
        self.input_width = 1
        self.input_channels = 64

        self.num_filters = 32
        self.filter_heigth = 1
        self.filter_width = 1
        self.filter_channels = self.input_channels  # equal to input channel

        self.input_address = None
        self.filter_address = None
        self.bias_address = None

        self.inputs = np.random.uniform(
            low=-127, high=127, size=(self.batch, self.input_channels)
        ).astype(np.int8)
        self.weights = np.random.uniform(
            low=-127, high=127, size=(self.num_filters, self.input_channels)
        ).astype(np.int8)
        self.biases = np.random.uniform(
            low=-127, high=127, size=(1, self.num_filters)
        ).astype(np.int8)

    def create_mem_arr(self):
        mem_arr = []

        mem_arr.append(self.batch)
        mem_arr.append(self.input_heigth)
        mem_arr.append(self.input_width)
        mem_arr.append(self.input_channels)
        mem_arr.append(self.num_filters)
        mem_arr.append(self.filter_heigth)
        mem_arr.append(self.filter_width)
        mem_arr.append(self.filter_channels)

        mem_arr.append(len(mem_arr) + 3)  # input offset
        mem_arr.append(
            len(mem_arr) + len(list(self.inputs.ravel())) + 2
        )  # weights offset

        mem_arr.append(
            len(mem_arr)
            + len(list(self.inputs.ravel()))
            + len(list(self.weights.ravel()))
            + len(list(self.biases.ravel()))
            + 1
        )  # biases offset

        mem_arr += list(self.inputs.ravel())
        mem_arr += list(self.weights.ravel())
        mem_arr += list(self.biases.ravel())

        return mem_arr

    def save_mif(self, mif_file_name):
        mem_arr = self.create_mem_arr()
        am.arraytomif(
            mif_file_name, mem_arr, width=16, depth=am.get_next_po2(len(mem_arr))
        )


l = MlpLayerConfig()
l.save_mif("mem_init_files/dram_mlp_full_data.mif")

print(l.inputs)
print(l.weights)
print(l.biases)
