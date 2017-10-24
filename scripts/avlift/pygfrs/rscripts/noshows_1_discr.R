require(readr)
require(dplyr)
require(arules)
require(ggplot2)

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

args <- commandArgs(trailingOnly = TRUE)
dataset_path <- args[1]
num_bins <- as.numeric(args[2])
csv_file_name = "noshowsfinal.csv"
csv_file_path = paste('../../resources/datasets/', csv_file_name, sep="")

no_shows <- read_csv(csv_file_path)

no_shows$Gender <- as.factor(no_shows$Gender)
no_shows$Scholarship <- as.factor(no_shows$Scholarship)
no_shows$Hipertension <- as.factor(no_shows$Hipertension)
no_shows$Diabetes <- as.factor(no_shows$Diabetes)
no_shows$Alcoholism <- as.factor(no_shows$Alcoholism)
no_shows$Handcap <- as.factor(no_shows$Handcap)
no_shows$SMS_received <- as.factor(no_shows$SMS_received)
no_shows$No_Show <- as.factor(no_shows$No_Show)
no_shows$appt_weekday <- as.factor(no_shows$appt_weekday)
no_shows$Neighbourhood <- as.factor(no_shows$Neighbourhood)

no_shows_d <- discretize_all(no_shows, "interval", num_bins)
rules <- apriori(no_shows_d, parameter = list(supp=0.4, conf=0.8, target="rules"))
top_rules <- head(sort(rules, by="lift"), 5)

num_rules <- length(top_rules)

res <- 0

if (num_rules > 0) {
  sum_of_lifts <- sum(top_rules@quality$lift)
  res <- sum_of_lifts / num_rules
}

write(res, stdout())
