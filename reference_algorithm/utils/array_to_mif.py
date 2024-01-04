"""
Este programa converte uma imagem 64x64 
em RGB para um arquivo .mif
"""

import os
import numpy as np


def cabecalho(width, depth):
    str_ret = ""
    str_ret += "-- begin_signature\n"
    str_ret += "-- ROM\n"
    str_ret += "-- end_signature\n"
    str_ret += "WIDTH=" + str(width) + ";\n"
    str_ret += "DEPTH=" + str(depth) + ";\n"
    str_ret += "ADDRESS_RADIX=UNS;\n"
    str_ret += "DATA_RADIX=BIN;\n\n"
    str_ret += "CONTENT BEGIN\n"
    print(str_ret)
    return str_ret


def rodape():
    str_ret = ""
    str_ret += "\nEND;\n"
    print(str_ret)
    return str_ret


def int_to_binary_string(value, bit_width):
    # Ensure the value is within the range
    if not (-(2 ** (bit_width - 1)) <= value <= 2 ** (bit_width - 1) - 1):
        raise ValueError(
            f"Value must be in the range of ({-(2 ** (bit_width - 1))} to {2 ** (bit_width - 1) - 1})"
        )

    # Convert the value to binary and remove the '0b' prefix
    binary_representation = bin(value & int(2**bit_width - 1))[2:]

    # Pad with zeros to make it bit_width bits
    padded_binary = binary_representation.zfill(bit_width)

    return padded_binary


def get_next_po2(x):
    po2 = 1

    while x > po2:
        po2 = 2 * po2

    return po2


def arraytomif(filename="mem.mif", arr=None, width=8, depth=256):
    index = 0
    arr_size = len(arr)

    if arr_size > depth:
        raise ValueError("arr_size > depth")

    with open(filename, "w") as mif:
        mif.writelines(cabecalho(width, depth))

        if arr_size < depth:
            for i in range(depth - arr_size):
                mif.writelines(
                    str(depth - index - 1)
                    + f": {int_to_binary_string(0, bit_width=width)}; \n"
                )
                index += 1

        for i, value in enumerate(reversed(arr)):
            mif.writelines(
                str(depth - index - 1)
                + f": {int_to_binary_string(value, bit_width=width)}; \n"
            )
            index += 1

        mif.writelines(rodape())
