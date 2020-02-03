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
Zephyr_Data <- read_excel("Documents/GA Work/Zephyr Data.xlsx")
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

# Converting categorial variable (y) to Binary



library(aod)
library(ggplot2)


