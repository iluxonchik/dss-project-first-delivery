import sys
import settings
from pygfrs.pygfrs import run

rscript_name = sys.argv[1]
rscript_path = settings.RSCRIPTS_DIR + rscript_name
start = sys.argv[2]
end = sys.argv[3]
step = sys.argv[4]



run(rscript_path, start, end, step)
