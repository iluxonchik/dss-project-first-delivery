#!/usr/bin/env python3
import re
import sys

if len(sys.argv) < 3:
    print("Usage: python simple_discretize.py <in_file_name>.csv <out_file_name>.csv") 
    sys.exit(-1)

in_file_name = sys.argv[1]
out_file_name = sys.argv[2]

with open(in_file_name, mode='r') as in_f:
    cont = in_f.read()

    res = re.sub('\.\d+', ' ', cont)

    with open(out_file_name, mode='w') as out_f:
        out_f.write(res)

