"""
pygfrs - Python Graph From R Script

Outputs an image graph using values from an R script.

This file is project-specific and is used soley for the purpose of generating
graphs which are needed for our report.

Usage:

pygfrs <filename>.R start end step [R_args...]
     * <filename>.R - path to Rscript file containing the algorithm you want to
    run. This script must return a single numeric value (look for examples
    in the rscrpt/ folder)
    * if everything in R_args will be passed to the script on every run
"""

import subprocess
import numpy
import matplotlib as plt

def _get_last_line_from_str(string):
    string = string.decode()
    print(string)
    split_str = string.split('\n')

    # get last line that's not empty
    reverse_list_len = len(split_str) * -1 - 1

    for i in range(-1, reverse_list_len, -1):
        if split_str[i] not in ['\n', ' ', '', None]:
            return split_str[i]
    return None

def _get_num_rules(rscript_path, min_support, r_args=None):

    proc_args = ['Rscript', rscript_path, min_support]
    proc = subprocess.Popen(proc_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out,err = proc.communicate()
    last_line = _get_last_line_from_str(out)

    return int(last_line)


def run(rscript_path, start, end, step):
    print(rscript_path, start, end, step)
