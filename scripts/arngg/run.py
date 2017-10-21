import sys
from decimal import Decimal
import settings
from pygfrs.pygfrs import run

rscript_name = sys.argv[1]
rscript_path = settings.RSCRIPTS_PATH + rscript_name
start = Decimal(sys.argv[2])
end = Decimal(sys.argv[3])
step = Decimal(sys.argv[4])



run(rscript_path, settings.DATASET_PATH, start, end, step)
