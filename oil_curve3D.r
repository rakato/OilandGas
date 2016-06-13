
library(ggplot2)
library(Quandl)
library(TTR)
require(gplots)
library(magrittr)
require(plotly)

#Get first 9 month on the curve data from Quandl
my_start_date <- "2013-01-05"

oil1<-Quandl("CHRIS/CME_CL1", api_key="ncDqwnksVuYyCeMyJvYC", start_date = my_start_date, type = "xts")
oil2<-Quandl("CHRIS/CME_CL2", start_date = my_start_date, type = "xts")
oil3<-Quandl("CHRIS/CME_CL3", start_date = my_start_date, type = "xts")
oil4<-Quandl("CHRIS/CME_CL4", start_date = my_start_date, type = "xts")
oil5<-Quandl("CHRIS/CME_CL5", start_date = my_start_date, type = "xts")
oil6<-Quandl("CHRIS/CME_CL6", start_date = my_start_date, type = "xts")
oil7<-Quandl("CHRIS/CME_CL7", start_date = my_start_date, type = "xts")
oil8<-Quandl("CHRIS/CME_CL8", start_date = my_start_date, type = "xts")
oil9<-Quandl("CHRIS/CME_CL9", start_date = my_start_date, type = "xts")

#isolate the last prices
oil1a<-oil1[,"Last"]
oil2a<-oil2[,"Last"]
oil3a<-oil3[,"Last"]
oil4a<-oil4[,"Last"]
oil5a<-oil5[,"Last"]
oil6a<-oil6[,"Last"]
oil7a<-oil7[,"Last"]
oil8a<-oil8[,"Last"]
oil9a<-oil9[,"Last"]

p <- merge(as.zoo(oil1a), as.zoo(oil2a), as.zoo(oil3a), as.zoo(oil4a),
           as.zoo(oil5a), as.zoo(oil6a),as.zoo(oil7a), as.zoo(oil8a), as.zoo(oil9a), all = FALSE)

#add them together to get first 9 months of curve
curve<- cbind("oil1a","oil2a","oil3a","oil4a","oil5a", "oil6a", "oil7a", "oil8a", "oil9a")
names(curve)<-c("1st Month", "2nd Month", "3rd Month", "4th Month", "5th Month", "6th Month", "7th Month", "8th Month", "9th Month")

z<-autoplot.zoo(p, facet=NULL)

ggplotly(p)


p <- autoplot.zoo(z, main = "1st 9 Month WTI Curve", facets = NULL) + xlab("")+facet_free()
ggplotly(p)

#3d graph
plot_ly(y=index(p), z = p, x=index(month(p)), type = "surface", colors= "Blues")%>%
  layout(title = "9 month Nat Gas curve",
         scene = list(
           xaxis = list(title = "Month"),
           yaxis = list(title = "Dates", tickangle = 90),
           zaxis = list(title = "Price")))




