# Zephyr Analysis

# Run below Query for Zephyr's data for repo_id:25158
#Select pull_request_id,
#pr_src_id,
#count(cmt_filename) as count_filenames,
#sum(cmt_added) as lines_added,
#pr_src_state
#from augur_data.pull_requests, augur_data.commits
#where cmt_commit_hash=pr_merge_commit_sha and augur_data.pull_requests.repo_id ='25158' 
#Group by pull_request_id, pr_src_state,pr_src_id

# Import Zephyr's pull request data
library(readxl)
Zephyr_Data <- read_excel("Documents/GA Work/Prof Matt/Zephyr Data.xlsx")
View(Zephyr_Data) 

# Names of allvariables in the dataset
names(Zephyr_Data)
# "pull_request_id" "pr_src_id" "count_filenames" "lines_added" "pr_src_state"   
# Dependent variable(y): "pr_src_state"
# Independent variables(x): "pull_request_id" "pr_src_id" "count_filenames" "lines_added" 

#structure of the data
str(Zephyr_Data)
#Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	10896 obs. of  5 variables:
#$ pull_request_id: num  15911 15912 15913 15914 15915 ...
#$ pr_src_id      : num  1.18e+08 1.18e+08 1.18e+08 1.18e+08 1.18e+08 ...
#$ count_filenames: num  2 2 6 2 2 6 2 2 2 2 ...
#$ lines_added    : num  16 18 676 2 12 32 92 8 136 0 ...
#$ pr_src_state   : chr  "closed" "closed" "closed" "closed" ...

# PR State distribution
ggplot(Zephyr_Data, aes(pull_request_id, colour = pr_src_state)) + geom_histogram()

# Converting character variable (y) to factor 
Zephyr_Data <- as.data.frame(unclass(Zephyr_Data))
str(Zephyr_Data)

# Multiple Regression
library(GGally)
require(GGally)

# Correlation summary
ggpairs(Zephyr_Data)

# Multiple regression model (Non-logistic)
#model <- lm((pr_src_state)~pull_request_id+pr_src_id+count_filenames+lines_added,data = Zephyr_Data)
#summary(model)

# Logistic Regression model - Attempt 1
logistic_model <- glm(Zephyr_Data$pr_src_state ~ Zephyr_Data$pull_request_id + Zephyr_Data$pr_src_id + Zephyr_Data$count_filenames + Zephyr_Data$lines_added, family = binomial(link="logit"))
summary(logistic_model)
anova(logistic_model, test = 'Chisq')

# Logistic Regression model - Attempt 2 without the ids
logistic_model_2 <- glm(Zephyr_Data$pr_src_state ~ Zephyr_Data$count_filenames + Zephyr_Data$lines_added, family = binomial(link="logit"))
summary(logistic_model_2)
anova(logistic_model_2, test = 'Chisq')
