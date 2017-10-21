require(readr)
require(arules)
require(dplyr)

args <- commandArgs(trailingOnly = TRUE)
min_support <- as.numeric(args[1])

data <- read_csv("../../../resources/datasets/crabs_simple_discr.csv")
data$index = NULL
data <- mutate_if(data, is.character, as.factor)
data <- mutate_if(data, is.integer, as.factor)

rules <- apriori(data, parameter=list(supp=min_support, conf=0.8, target="rules"))

num_rules <- length(rules)

write(num_rules, stdout())
