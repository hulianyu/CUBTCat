#### Load ODS files ####
# Get the path of the current working directory
my_dir <- getwd()
# Get the paths of the subdirectories
sub_dirs <- c("ODS")
# Get the paths of TXT files in the subdirectories
txt_paths <- list.files(sub_dirs, pattern = "\\.txt$", full.names = TRUE)
# Read all TXT files
for (txt_path in txt_paths) {
  file_name <- gsub(".txt$", "", basename(txt_path))
  assign(file_name,  read.csv(txt_path, header=FALSE, colClasses="numeric"))
}

source('CUBT_Cat.R')

data <- ODS_tic_tac_toe
data[] <- lapply(data, as.character)
data <- as.matrix(data)
# construct the maximal tree
my_cubt_maximal = CUBT_Cat_growth(data)
# prune it 
my_cubt_prune = CUBT_Cat_prune(my_cubt_maximal,data)
# join leaves
my_cubt_join = CUBT_Cat_join(my_cubt_prune,data)
# plot the final tree
Plot.CUBT(my_cubt_join, type="uniform")
Text.CUBT(my_cubt_join)