
require(Quandl)
require(TTR)
require(ggplot2)
require(magrittr)

#get some commodities
sdate<- "2013-01-05"
oil <- (Quandl("CHRIS/CME_CL1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts"))
gas <- Quandl("CHRIS/CME_NG1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts")
ho<- Quandl("CHRIS/CME_HO1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts")
rb_crack <- Quandl("CHRIS/CME_RM1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts")

#get settle prices
oilset <- oil[,"Settle"]
gasset <- gas[,"Settle"]
hoset<-ho[,"Settle"]
rb_crackset<-rb_crack[,"Settle"]

#moving average function
ma<- function(x, n=20){
  filter(x, rep(1/n,n), sides=2)
}


z <- merge(as.zoo(oilset), as.zoo(gasset), as.zoo(rb_crackset),  all = FALSE)

# Set the column names; these will be used in the heat maps:
myColnames <- c("OIL","GAS","Crack")
colnames(z) <- myColnames







