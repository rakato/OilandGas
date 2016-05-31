
require(Quandl)
require(TTR)
require(ggplot2)
require(magrittr)

#get some commodities
sdate<- "2013-01-05"
oil <- (Quandl("CHRIS/CME_CL1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts"))
gas <- Quandl("CHRIS/CME_NG1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts")
rb_crack <- Quandl("CHRIS/CME_RM1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = sdate, type = "xts")

oilset <- oil[,"Settle"]
gasset <- gas[,"Settle"]
rb_crackset<-rb_crack[,"Settle"]

#moving average function
ma<- function(x, n=20){
  filter(x, rep(1/n,n), sides=2)
}






