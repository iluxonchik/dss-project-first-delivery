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
