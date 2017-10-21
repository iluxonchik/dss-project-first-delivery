require(readr)
require(arules)
require(dplyr)

# IMPORTANT: this header should be similiar in pretty much all scripts
args <- commandArgs(trailingOnly = TRUE)
dataset_path <- args[1]
min_support <- as.numeric(args[2])
csv_file_name = "crabs_simple_discr.csv"
csv_file_path = paste(dataset_path, csv_file_name, sep="")

# discritize columns and adapt dataset for the algorithm
# this part is specific to every script
data <- read_csv(csv_file_path)
data$index = NULL
data <- mutate_if(data, is.character, as.factor)
data <- mutate_if(data, is.integer, as.factor)

# this part should be similiar in all scripts
rules <- apriori(data, parameter=list(supp=min_support, conf=0.8, target="rules"))
num_rules <- length(rules)
write(num_rules, stdout())
