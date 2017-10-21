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

    msr - 100
    con - x
"""

import subprocess
import numpy as np
import matplotlib as plt

def _get_last_line_from_str(string):
    string = string.decode()
    split_str = string.split('\n')

    # get last line that's not empty
    reverse_list_len = len(split_str) * -1 - 1

    for i in range(-1, reverse_list_len, -1):
        if split_str[i] not in ['\n', ' ', '', None]:
            return split_str[i]
    return None

def _get_num_rules(rscript_path, dataset_path, min_support, r_args=None):

    proc_args = ['Rscript', rscript_path, dataset_path, min_support]
    proc = subprocess.Popen(proc_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out,err = proc.communicate()
    last_line = _get_last_line_from_str(out)

    return int(last_line)


def run(rscripts_path, rscript_names, dataset_path, start, end, step):
    script_runs = {} # dictionary mapping dataset name to run results
    # force evaluation, sicne this will be used for multiple runs, plotting, etc
    min_support_range = [str(dec) for dec in np.arange(start, end + step, step)]
    min_sup_range_length = len(min_support_range)

    rscript_ids = [rscript_name.rstrip(".R") for rscript_name in rscript_names]
    num_scripts_to_run = len(rscript_ids)
    scripts_run_counter = 1
    for rscript_id in rscript_ids:
        print('Computing for {} [{}/{}]'.format(rscript_id, scripts_run_counter, num_scripts_to_run))

        rscript_file_path = rscripts_path + rscript_id + '.R'
        script_runs[rscript_id] = []
        counter = 0

        for min_sup in min_support_range:
            res = _get_num_rules(rscript_file_path, dataset_path, min_sup)
            script_runs[rscript_id].append(res)
            counter = counter + 1
            print('\t{}/{} done... : {}'.format(counter, min_sup_range_length, res))

        scripts_run_counter = scripts_run_counter + 1

    print(script_runs)
