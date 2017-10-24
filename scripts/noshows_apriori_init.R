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

setwd("/home/iluxonchik/Documents/GitHub/dss-project-first-delivery/resources/datasets")

no_shows <- read_csv("noshowsfinal.csv")

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

print("no_shows_d <- discretize_all(no_shows, interval, 10)")
print('rules <- apriori(no_shows_d, parameter = list(supp=0.3, conf=0.8, target="rules"))')
print('inspect(head(sort(rules, by="lift"), 10))')
print('sub <- subset(rules, subset= rhs %in% "SMS_received=O")')

j <- 0
l <- c()
for (i in 1:length(sub)) {
    ina <-inspect(sub[i])
    s <- toString(ina$lhs)
    if(!grepl(",", s)) {
      ina
    }
}
