
library(ggplot2)
library(Quandl)
library(magrittr)
require(plotly)
require(lubridate)

#Get first 9 month on the nat gas curve data from Quandl
my_start_date <- "2013-01-05"

gas1<-Quandl("CHRIS/CME_NG1", start_date = my_start_date, type = "xts")
gas2<-Quandl("CHRIS/CME_NG2", start_date = my_start_date, type = "xts")
gas3<-Quandl("CHRIS/CME_NG3", start_date = my_start_date, type = "xts")
gas4<-Quandl("CHRIS/CME_NG4", start_date = my_start_date, type = "xts")
gas5<-Quandl("CHRIS/CME_NG5", start_date = my_start_date, type = "xts")
gas6<-Quandl("CHRIS/CME_NG6", start_date = my_start_date, type = "xts")
gas7<-Quandl("CHRIS/CME_NG7", start_date = my_start_date, type = "xts")
gas8<-Quandl("CHRIS/CME_NG8", start_date = my_start_date, type = "xts")
gas9<-Quandl("CHRIS/CME_NG9", start_date = my_start_date, type = "xts")

#isolate the last prices
gas1a<-gas1[,"Last"]
gas2a<-gas2[,"Last"]
gas3a<-gas3[,"Last"]
gas4a<-gas4[,"Last"]
gas5a<-gas5[,"Last"]
gas6a<-gas6[,"Last"]
gas7a<-gas7[,"Last"]
gas8a<-gas8[,"Last"]
gas9a<-gas9[,"Last"]

p <- merge(as.zoo(gas9a), as.zoo(gas8a), as.zoo(gas7a), as.zoo(gas6a),
           as.zoo(gas5a), as.zoo(gas4a),as.zoo(gas3a), as.zoo(gas2a), as.zoo(gas1a), all = FALSE)

#add them together to get first 9 months of curve
curve<- cbind("gas1a","gas2a","gas3a","gas4a","gas5a", "gas6a", "gas7a", "gas8a", "gas9a")
names(curve)<-c("1st Month", "2nd Month", "3rd Month", "4th Month", "5th Month", "6th Month", "7th Month", "8th Month", "9th Month")

z<-autoplot.zoo(p, facet=NULL)

ggplotly(p)


p <- autoplot.zoo(z, main = "1st 9 Month Nat Gas Curve", facets = NULL) + xlab("")+facet_free()
ggplotly(p)

#3d graph
plot_ly(y=index(p), z = p, type = "surface", colors= "Oranges")%>%
  layout(title = "9 month Nat Gas curve",
         scene = list(
           xaxis = list(title = "Month"),
           yaxis = list(title = "Days",tickangle = 90),
           zaxis = list(title = "Price")))




