###
#   Run all scripts
###
#   Author:
#   Max Westphal (max.westphal@mevis.fraunhofer.de)
###
#   Description:
#   This script runs all remaining scripts in correct order 
#   to (re)produce the contents of the 'data' folder.
###
#   Remark:
#   This needs only be executed for a reproduction of (pre-computation) results.
###


## create data dir:
dir.create("data", showWarnings = FALSE)

## run scripts:
source("scripts/1_rwd_ctg_data_proc.R")
source("scripts/2_rwd_support_data_proc.R")
source("scripts/3_rwd_ctg_model_dev.R")
source("scripts/4_nested_cv_bootstrap.R")

## clean environment:
rm(list = ls())