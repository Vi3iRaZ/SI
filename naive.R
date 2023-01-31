library(naivebayes)
dane = read.csv("penguins_size.csv",header = TRUE, stringsAsFactors = T)

xtabs(~species, data=dane)
idx=sample(2,340,replace= T , prob=c(0.5,0.5))
idx
train=dane[idx==1,]
test=dane[idx==2,]
test
train
model=naive_bayes(species~.,data=train,usekernel = T)
plot(model)

p=predict(model,test)
cf=table(p,test$species)      
cf

sum(diag(cf))/sum(cf)

p=predict(model,train)
cf=table(p,train$species)      

cat(sum(diag(cf))/sum(cf)*100, "%")

