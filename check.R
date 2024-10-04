## R script for checking the contribution
##
## You need to have R installed (and preferably also RStudio).
##
## If you don't have the MOrepoTools package installed the run:
##
# install.packages("devtools")
# library(devtools)
# install_github("MCDMSociety/MOrepo/misc/R/MOrepoTools")
# install.packages("~/github/MOrepo/misc/R/MOrepoTools_1.0.2.tar.gz", repos = NULL, type = "source")
library(MOrepoTools)
library(here)
library(tidyverse)

checkContribution()
fs::file_copy("ReadMe.html", "docs/index.html", overwrite = T)

# ## Convert alg1 results from other repo to format
# paths <- fs::dir_ls(here("~/github/minkowski_theory/code/instances/results/algorithm1"), recurse = T, type = "file")
# p <- paths[1]
# for (p in paths) {
#    lst <- jsonlite::read_json(p, simplifyVector = T)
#    if (length(lst$points) != 0) {
#       if (ncol(lst$points) == lst$statistics$p) {
#          lst$points$type <- NA_character_
#       } else {
#          colnames(lst$points)[lst$statistics$p + 1] <- "type"
#       }
#    } else lst$points <- NULL
#    if (is.na(lst$statistics$supported)) lst$statistics$supported <- NULL
#    if (is.na(lst$statistics$extreme)) lst$statistics$extreme <- NULL
#    fs::dir_create(here(str_c("results/msp/nd-sum/", lst$statistics$p, "obj")))
#    createResultFile(
#       instanceName = str_c("Lyngesen24-msp", str_extract(p, "^.*-prob(.*).json$", group = 1)),
#       contributionName = "Lyngesen24",
#       objectives = lst$statistics$p,
#       points = lst$points,
#       card = lst$statistics$card,
#       suppCard = lst$statistics$supported,
#       extCard = lst$statistics$extreme,
#       objectiveType = rep("int", lst$statistics$p),
#       direction = rep("min", lst$statistics$p),
#       comments = "The nondominated sum for the MSP (points not stored for large Yn sizes)",
#       optimal = TRUE,
#       other = "Yn",
#       misc = list(min = lst$statistics$min, max = lst$statistics$max, width = lst$statistics$width),
#       path = here(str_c("results/msp/nd-sum/", lst$statistics$p, "obj"))
#    )
# }
#
# ## Add generator results to existing results
# paths <- fs::dir_ls(here("~/github/minkowski_theory/code/instances/results/algorithm2"), recurse = T, type = "file")
# # p <- paths[length(paths)]
# # p <- paths[1]
# for (p in paths) {
#    lst <- jsonlite::read_json(p)
#    resPath <- fs::path_file(p) |>
#       str_remove("MGS-prob") |>
#       str_remove(".json") |>
#       str_c("_result_Yn.json")
#    resPath <- here(str_c("results/msp/nd-sum/", lst[[1]]$V1$statistics$p, "obj"), str_c("Lyngesen24-msp", resPath))
#    lstRes <- jsonlite::read_json(resPath, simplifyVector = T)
#    g <- NULL
#    for (i in 1:length(lst[[1]])) {
#       g <- c(g, lst[[1]][[i]]$statistics$card)
#    }
#    lstRes$misc$genSize <- g
#    str <- jsonlite::toJSON(lstRes, auto_unbox = TRUE, pretty = TRUE,
#                            digits = NA, na = "null")
#    readr::write_lines(str, resPath)
#    message("Results written to ", resPath)
# }


## Rename stuff
# paths <- fs::dir_info(path, recurse = T, type = "file")$path
# newPaths <- str_replace(paths, "prob", "msp")
# #newPaths <- fs::path(fs::path_dir(paths), str_c(prefix, "-", fs::path_file(paths)))
# paths <- fs::file_move(paths, newPaths)
# message("Add prefix to files:", paths)



