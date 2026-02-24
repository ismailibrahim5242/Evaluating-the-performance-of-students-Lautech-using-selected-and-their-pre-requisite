set.seed(100)
library(readxl)

# reading file into r
file <- read.csv(file.choose())
View(file)
summary(file)

# generating random values 
random_sample <- file[sample(nrow(file), 30), ]
View(random_sample)

# regresssion model
model <- lm(Y ~ X, data = random_sample)
summary(model)
coefficients <- coef(model)
residuals <- residuals(model)
fitted_values <- fitted(model)

# Calculate mean, variance, covariance, and standard deviation
mean(random_sample$STA204)
var(random_sample$STA204)
cov(random_sample$STA302, random_sample$STA208)
sd(random_sample$STA411)
GHY = cor(random_sample$STA411, random_sample$STA204)
summary(GHY)
GHY
