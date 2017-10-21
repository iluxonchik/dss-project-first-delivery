"""
pygfrs - Python Graph From R Script

Outputs an image graph using values from an R script.

This file is project-specific and is used soley for the purpose of generating
graphs which are needed for our report.

Usage:

pygfrs <filename>.R start end step
     * <filename>.R - path to Rscript file containing the algorithm you want to
    run. This script must return a single numeric value (look for examples
    in the rscrpt/ folder)
"""

import sys
import numpy
import matplotlib as plt
