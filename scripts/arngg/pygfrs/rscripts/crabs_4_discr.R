require(readr)
require(arules)
require(dplyr)

discretize_all = function(table_d, type, n){
 for (i in 1:ncol(table_d)) {
 if (is.numeric(table_d[[i]])) {
 table_d[[i]] = discretize(table_d[[i]], method = type, categories = n,
ordered=TRUE)
 }
 }
 print(summary(table_d))
 return(table_d);
}


# IMPORTANT: this header should be similiar in pretty much all scripts
args <- commandArgs(trailingOnly = TRUE)
dataset_path <- args[1]
min_support <- as.numeric(args[2])
csv_file_name = "crabs.csv"
csv_file_path = paste('../../resources/datasets/', csv_file_name, sep="")

# discritize columns and adapt dataset for the algorithm
# this part is specific to every script
data <- read_csv(csv_file_path)
data$index = NULL
data <- discretize_all(data, "interval", 4)
data <- mutate_if(data, is.character, as.factor)

# this part should be similiar in all scripts
rules <- apriori(data, parameter=list(supp=min_support, conf=0.8, target="rules"))
num_rules <- length(rules)
write(num_rules, stdout())
