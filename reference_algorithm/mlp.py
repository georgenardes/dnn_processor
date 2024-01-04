import numpy as np
import array_to_mif as am

np.random.seed(2)

batch = 16
features = 64
neurons = 32

inputs = np.random.uniform(low=-127, high=127, size=(batch, features)).astype(np.int8)
weights = np.random.uniform(low=-127, high=127, size=(features, neurons)).astype(
    np.int8
)
biases = np.random.uniform(low=-127, high=127, size=(1, neurons)).astype(np.int8)

print(inputs)
print(weights)
print(biases)

z = np.matmul(inputs, weights) + biases
print(z)


am.arraytomif(
    filename="mem_init_files/output.mif", arr=z.ravel(), width=8, depth=len(z.ravel())
)
am.arraytomif(
    filename="mem_init_files/biases.mif",
    arr=biases.ravel(),
    width=8,
    depth=len(biases.ravel()),
)
am.arraytomif(
    filename="mem_init_files/weights.mif",
    arr=weights.ravel(),
    width=8,
    depth=len(weights.ravel()),
)
am.arraytomif(
    filename="mem_init_files/inputs.mif",
    arr=inputs.ravel(),
    width=8,
    depth=len(inputs.ravel()),
)

all_data = list(inputs.ravel()) + list(weights.ravel()) + list(biases.ravel())
print(len(all_data))
am.arraytomif(
    filename="mem_init_files/dram.mif",
    arr=all_data,
    width=8,
    depth=len(all_data),
)
