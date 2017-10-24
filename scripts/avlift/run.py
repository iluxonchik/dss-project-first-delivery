import sys
from decimal import Decimal
import settings
from pygfrs.pygfrs import run

rscript_names = sys.argv[1].split(" ")
start = Decimal(sys.argv[2])
end = Decimal(sys.argv[3])
step = Decimal(sys.argv[4])

run(settings.RSCRIPTS_PATH, rscript_names, settings.DATASET_PATH, start, end, step)
