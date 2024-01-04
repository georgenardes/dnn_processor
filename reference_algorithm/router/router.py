import numpy as np
import matplotlib.pyplot as plt
import cv2 as cv

np.random.seed(2)

dram_size = 4096
buffer_cols = 1024
buffer_rows = 16

batch_size = 32
features = 64

dram = np.zeros((dram_size, 1), dtype=np.int32)
buffer = np.zeros((buffer_cols, buffer_rows), dtype=np.int32)
act = np.arange(batch_size * features,dtype=np.int32).reshape(-1, 1)
dram[0 : batch_size * features] = act

# indexers
i = 0
j = 0
x = 0
y = 0
ram_addr = 0


i = 0
while i < batch_size:
    j = 0
    while j < features:

        buffer[x, y] = dram[ram_addr]

        ram_addr += 1
        j += 1
        y += 1

        if y == buffer_rows:
            y = 0
            x += 1

            if x == buffer_cols:
                x = 0

    i += 1


print(dram)
np.savetxt("dram.txt", dram)
print("\n\n\n")
print(buffer)
np.savetxt("buffer.txt", buffer)
