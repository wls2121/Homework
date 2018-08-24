# import the data
data <- read.delim("~/OMSA/ISYE 6501/Week 1 Homework/credit_card_data-headers.txt")

# inspect the data
View(data)

# convert to matrix
data <- as.matrix(data)

# create the model
"
nb: when we say λ, R uses C
Unpacking the ksvm model: the first parameter (data[,1:10] is all of our attributes, our
response vector y is data[,11], C-svc is the TYPE of regularization , vanilladot is a linear kernel
C is the magnitude of our regularization parameter)
"
model <- ksvm(data[,1:10],data[,11],type="C-svc",kernel="vanilladot",C=100,scaled=TRUE)


# calculate coefficients (a1...am)
"
model@xmatrix[[1]] returns the SOMETHING ABOUT the number of support vectors
coeff
"
a <- colSums(model@xmatrix[[1]] * model@coef[[1]])

# calculate a0
a0 <- -model@b

# see what the model predicts
pred <- predict(model,data[,1:10])

#see what fraction of the model's predictions match the actual classification
sum(pred == data[, 11])/nrow(data)