library(kernlab)
library(caret)
library(knitr)

fitnessFunction <- function(k,n,e,trainDataset,testDataset)
{
  model <- ksvm(trainDataset$Alphabet~., trainDataset, kernel=k, nu = n, epsilon = e, kpar=list())
  # Prediction (Testing)
  actual<-testDataset$Alphabet
  predicted <- predict(model, testDataset)
  # Model Evaluation: Accuracy
  accuracy <- round(mean(actual==predicted) *100,2)
  return (accuracy)
}

CalculateBestAccuracy<-function(trainDataset,testDataset)
{
  Accuracies<-c()
  bestAccuracy= 0 
  bestKernel = "" 
  bestNu = 0
  bestEpsilon = 0 
  iteration = 1000
  kernelList = c('rbfdot', 'polydot', 'vanilladot', 'tanhdot', 'laplacedot', 'anovadot')
  for (i in 1:iteration){
    # Choosing parameters randomly
    k = sample(kernelList, 1)
    n = runif(1)
    e = runif(1)
    Accuracy = fitnessFunction(k,n,e,trainDataset,testDataset)
    if(Accuracy > bestAccuracy) {
      bestKernel = k
      bestNu = n
      bestEpsilon = e
      bestAccuracy = Accuracy
    }
    Accuracies[i]=bestAccuracy
  }
  return (list(bestAccuracy,bestKernel,bestEpsilon,bestNu,Accuracies))
}

createSamples<-function(dataset,num_samples)
{
  samples <- list()
  for (i in 1:num_samples) {
    #sampled_data <- dataset[sample(nrow(dataset)), ]
    sampled_data <- dataset[sample(nrow(dataset),5000), ]
    train_index <- createDataPartition(sampled_data$Alphabet, p = 0.7, list = FALSE)
    train_data <- sampled_data[train_index, ]
    test_data <- sampled_data[-train_index, ]
    samples[[i]] <- list(train_data = train_data, test_data = test_data)
  }
  return (samples)
}

dataset<-read.table('letter-recognition.data',sep=',',header=FALSE)
colnames(dataset)[1]<-"Alphabet"
for(i in 2:17)
{
colnames(dataset)[i]<-paste("V",(i-1),collapse="",sep="")
}
dataset$Alphabet=factor(dataset$Alphabet)
samples<-createSamples(dataset,10)
bestParameters<-list()

for(i in 1:10)
{
  bestParameters[[i]] <- CalculateBestAccuracy(samples[[i]]$train_data,samples[[i]]$test_data)
}

Sample<-c()
BestAccuracy<-c()
BestKernel<-c()
BestEpsilon<-c()
BestNu<-c()

for(i in 1:10)
{
  Sample[i]<-i
  BestAccuracy[i]<-bestParameters[[i]][[1]]
  BestKernel[i]<-bestParameters[[i]][[2]]
  BestEpsilon[i]<-bestParameters[[i]][[3]]
  BestNu[i]<-bestParameters[[i]][[4]]
}

Result<-data.frame(Sample,BestAccuracy,BestKernel,BestNu,BestEpsilon)

kable(Result, format = "simple")

plot(bestParameters[[which.max(BestAccuracy)]][[5]],type='l',col="red",xlab="Iterations",ylab="Accuracy",main="Convergence Graph for Best SVM")
