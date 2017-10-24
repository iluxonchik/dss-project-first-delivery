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



Our                Other
AppointmentDay -> AppointmentDate
no_shows$No-show <- as.integer(as.character(no_shows$No-show))


ggcorr(as.matrix(no_shows[,c("Gender", "Age", "Neighbourhood", "Scholarship",
                             "Hipertension" , "Diabetes", "Alcoholism",
                             "Handcap", "SMS_received", "No_Show" "appt_month", "appt_day",
                             "waiting_time", "appt_weekday")]), label=TRUE, hjust = 0.8)
