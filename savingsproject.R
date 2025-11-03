savings <- SDS320E_Project_Preliminary_Dataset_Sheet1

# Money saved - response variable
moneysaved <- savings$moneysaved
hist(moneysaved, main="Distribution of Money Saved Per Month", xlab="Money Saved in Dollars", breaks=20)
median(moneysaved)
IQR(moneysaved)

# Quiz score - numeric explanatory variable
score <- savings$score
hist(score, main="Distribution of Quiz Scores", xlab="Score out of 100")
median(score)
IQR(score)
score_vs_moneysaved <- plot(x=score, y=moneysaved, main="Quiz Scores versus Money Saved", 
                            xlab="Score out of 100", ylab="Money Saved in Dollars")
lmodel <- lm(moneysaved ~ score)
abline(lmodel)

# Budgeting tool usage - categorical explanatory variable
budgetingtool <- savings$budgetingtool
barplot(table(budgetingtool), main="Distribution of Budgeting Tool Usage", xlab="Do People Use a Budgeting Tool?",
        ylab="Frequency")
boxplot(moneysaved~budgetingtool, main="Budgeting Tool Usage versus Money Saved",
        xlab="Do People Use a Budgeting Tool?", ylab="Money Saved in Dollars")

# Assumptions test
plot(score, moneysaved, main="Score vs. Money Saved", xlab="Quiz Score (out of 100)", ylab="Money Saved Monthly (In Dollars)")
abline(lm(moneysaved~score))
hist(my_model$residuals, main="Distribution of Model Residuals", xlab="Residuals")
plot(my_model$fitted.values, my_model$residuals, main="Residual Plot", xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="red")
plot(my_model, 1)


my_model <- lm(moneysaved~score, data=savings)
my_glm <- lm(moneysaved ~ score + budgetingtool, data=savings)
summary(my_glm)

library(interactions)

# Predict money saved with main effect of score, budgeting tool usage, and their interaction
mod9 <- lm(moneysaved ~ score + budgetingtool + score*budgetingtool, data=savings)
summary(mod9)
interact_plot(mod9, pred=score, modx=budgetingtool, x.label="Quiz Score (out of 100 points)", y.label="Money Saved Monthly (in dollars)", 
              main.title="Interaction Plot of Money Saved vs. Quiz Scores, Budgeting Tool Use", legend.main="Budgeting Tool Use", colors=c("red", "darkgreen"))
# Lines are parallel, no interactions between the explanatory variables
