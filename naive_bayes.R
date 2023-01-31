library(naivebayes)
dane=iris
xtabs(~Species, data=dane)
idx=sample(2,150,replace= T , prob=c(0.8,0.2))
idx
train=dane[idx==1,]
test=dane[idx==2,]
test
train
model=naive_bayes(Species~.,data=train,usekernel = T)
plot(model)
                
                
#predykcja
p=predict(model,train)
cf=table(p,train$Species)      
cf

sum(diag(cf))/sum(cf)

speciesID <- as.numeric(iris$Species)
ma <- as.matrix(iris[, 1:4])
pairs(ma, col = rainbow(3)[speciesID])