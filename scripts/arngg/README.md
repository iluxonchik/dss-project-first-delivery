# Apriori Rules Number Graph Generator

A combination of Pyhton and R scripts to genreate the number of apriori rules for different
support parameters for our project report.

# Installation

Install all of the required R packages.

This tool requires `Python 3.x` to run.

Either use virtualenv (recommended) or just run the following command
directly:

`pip install -r requirements.txt`

You can change whether or not the graph is shown at the end of the run
by opening `settings.py` and setting `SHOW_GRAPH` to either `True` or
`False`.

At the end of each run, **the graph is always saved** in the `./img/`
directory.


# Usage Examples:

`python run.py "crabs_simple_discr.R crabs_5_discr.R crabs_8_discr.R crabs_10_discr.R crabs_15_discr.R" 0.02 0.1 0.01`

* min_support_begin = 0.02
* min_support_end = 0.1
* increment in every run = 0.01

All of the R scripts must be stored in `arngg/pygfrs/rscripts/`. Every
`R` script must return the `number of rules` value (you can do whatever)
you want in it.
