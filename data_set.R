#####頻出#####
library(arules)
library(arulesViz) #可視化ライブラリ

ds <- read.transactions('dataForR_frequent.csv', sep=',', format='basket')
#データ確認
str(ds)
summary(ds)

ds.ap <- apriori(ds) #ルール抽出
inspect(head(sort(ds.ap, by='support'),n=10)) #上位10件のルールの表示
plot(ds.ap,method='graph',control=list(type='items',layout=layout.show())) #可視化


#####系列#####
library(arulesSequences)

ds2 <- read_baskets('dataForR_sequential.csv', sep = '','', info = c('sequenceID','eventID'))
#データ確認
str(ds)
summary(ds)

ds2.sp <- cspade(ds2) #Rstudioで発生するbugがある