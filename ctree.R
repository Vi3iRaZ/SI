library(party)
library(partykit)
library(e1071)
library(caTools)
library(class)
library(neuralnet)

data = read.csv("penguins_size.csv",header = TRUE, stringsAsFactors = T)

idx=sample(2,150,replace = T, prob=c(0.7,0.3))

train = data[idx == 1,]
test = data[idx ==2,]


train

model = ctree(species ~ . , data=train)
dev.off()
plot(model)

p = predict(model, test)
length(p)
p
length(data$species)
cf = table (p, test$species)
cf
cat("poprawność", sum(diag(cf))/sum(cf)*100, "%")