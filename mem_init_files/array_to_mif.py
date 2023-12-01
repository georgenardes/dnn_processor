'''
Este programa converte uma imagem 64x64 
em RGB para um arquivo .mif
'''

import os 
import numpy as np

# definicoes arquitetura memoria
WIDTH=8
DEPTH=256

def cabecalho ():
    str_ret = ""
    str_ret += "-- begin_signature\n"
    str_ret += "-- ROM\n"
    str_ret += "-- end_signature\n"
    str_ret += "WIDTH="+str(WIDTH)+";\n"
    str_ret += "DEPTH="+str(DEPTH)+";\n"
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



index = 0

with open("mem.mif", "w") as mif:    
    mif.writelines(cabecalho()) 

    for i in range(256):
        mif.writelines(str(DEPTH-index-1) +
        ": 00000000; \n")
        index += 1


    mif.writelines(rodape())


 