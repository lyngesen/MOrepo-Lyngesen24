## R script for checking the contribution
##
## You need to have R installed (and preferably also RStudio).
##
## If you don't have the MOrepoTools package installed the run:
##
# install.packages("devtools")
# library(devtools)
# install_github("MCDMSociety/MOrepo/misc/R/MOrepoTools")
#
library(MOrepoTools)
checkContribution()


   # paths <- fs::dir_info(path, recurse = T, type = "file")$path
   # newPaths <- str_replace(paths, "prob", "msp")
   # #newPaths <- fs::path(fs::path_dir(paths), str_c(prefix, "-", fs::path_file(paths)))
   # paths <- fs::file_move(paths, newPaths)
   # message("Add prefix to files:", paths)



