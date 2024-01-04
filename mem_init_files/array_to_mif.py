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


def int8_to_binary_string(value):
    # Ensure the value is within the range of int8 (-128 to 127)
    if not (-128 <= value <= 127):
        raise ValueError("Value must be in the range of int8 (-128 to 127)")

    # Convert the value to binary and remove the '0b' prefix
    binary_representation = bin(value & 0xFF)[2:]

    # Pad with zeros to make it 8 bits
    padded_binary = binary_representation.zfill(8)

    return padded_binary


def arraytomif(filename="mem.mif", arr=None, width=8, depth=256):
    index = 0

    if len(arr) != depth:
      raise ValueError("len(arr) != depth")

    with open(filename, "w") as mif:
        mif.writelines(cabecalho(width, depth))

        for i, value in enumerate(arr):
            mif.writelines(str(depth - index - 1) + f": {int8_to_binary_string(value)}; \n")
            index += 1

        mif.writelines(rodape())
