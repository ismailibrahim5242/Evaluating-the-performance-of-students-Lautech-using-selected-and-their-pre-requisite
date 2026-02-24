set.seed(100)
library(readxl)

# reading file into r
file <- read.csv(file.choose())
View(file)
summary(file)

# generating random values 
random_sample <- file[sample(nrow(file), 30), ]
View(random_sample)
summary(random_sample)


mean_ratio_estimate <- sum(random_sample$STA302) / sum(random_sample$STA208) * 48.45
mean_ratio_estimate
variance_estimate <- sum((random_sample$STA302 / random_sample$STA208 - mean_ratio_estimate)^2) / nrow(random_sample)
variance_estimate


#mean and variance using regression estimation
model <- lm(STA411 ~ STA204, data = random_sample)
coef(model)[2]

summary(model)
coef(model)[1] + coef(model)[2] * mean(file$STA204)

residuals <- residuals(model)
sum(residuals^2) / (length(residuals) - 2)
  