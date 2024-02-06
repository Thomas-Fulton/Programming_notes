
########## Switching between versions of R ##############
# SEE: https://community.rstudio.com/t/why-not-r-via-conda/9438/4 
# https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html#:~:text=0%2C%20Conda%20has%20a%20strict,conda%20config%20%2D%2Ddescribe%20channel_priority%20. 
# For 3.6:
# Set environmental variable and launch Rstudio from the terminal (add to ~/.profile to lauch with application icon)
export RSTUDIO_WHICH_R=/usr/local/bin/R3.6.3
#.libPaths() <- "/home/thomas/R/x86_64-pc-linux-gnu-library/3.6"


#### How to set up switching ######
# https://support.posit.co/hc/en-us/articles/215488098
# https://docs.posit.co/resources/install-r/
# see: https://cran.r-project.org/bin/linux/debian/
## normal .libPaths() :
 #[1]  "/home/thomas/R/x86_64-pc-linux-gnu-library/3.6" "/usr/local/lib/R/site-library"                  "/usr/lib/R/site-library"                       
 #[4]  "/usr/lib/R/library"

# as root in terminal (Bash):
mkdir /tmp/R3.6/
cp /home/thomas/R/x86_64-pc-linux-gnu-library/3.6/* /tmp/R3.6/ -r
## 2nd and 3rd directories in .libPaths() are empty - move 4th to save
mkdir /usr/lib/R3.6/ 
cp /usr/lib/R/* /usr/lib/R3.6/ -r

# Install R 4.1.3 and 3.6.3
export R_VERSION=4.1.3
export UBUNTU_VERSION=2204
curl -O https://cdn.rstudio.com/r/ubuntu-${UBUNTU_VERSION}/pkgs/r-${R_VERSION}_1_amd64.deb
sudo gdebi r-${R_VERSION}_1_amd64.deb
/opt/R/${R_VERSION}/bin/R --version
# DEFAULT (make symlinks below to latest as default)
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
# SPECIFICS: after installing new version, specify version for RSTUDIO_WHICH_R
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R${R_VERSION}
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript${R_VERSION}

# Change environmental variable in ~/.profile
RSTUDIO_WHICH_R=/usr/local/bin/R


#### Install rstudio ####
# Download from https://posit.co/download/rstudio-desktop/
# Append lines below to /etc/apt/sources.list to fix dependency error for package: libchang-dev
#deb http://se.archive.ubuntu.com/ubuntu/ jammy main restricted universe
#deb http://se.archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe



#### Packages #####

# See for environment management with conda: https://astrobiomike.github.io/R/managing-r-and-rstudio-with-conda
# Use Mamba not conda

# Set default repo url below, which always uses nearest CRAN mirror:
local({r <- getOption("repos")
  r["CRAN"] <- "http://cran.r-project.org" 
  options(repos=r)
})


install.packages("data.table")
library(data.table)
detach("package:stringr")

# use package pacman to load, or install and then load packages, eg.
#install.packages("pacman")
pacman::p_load(Seurat,SeuratObject,SeuratDisk,
               Signac,tidyverse,scDblFinder)

### Repositories ###
# CRAN is default
# Bioconductor:
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::available()
BiocManager::install()

# Install from github:
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("mojaveazure/seurat-disk")

# -------------------------------------------------------------------------------------------------------------------------------------------------------
## Useful Functions ##
# Specify decimal places: x is the number and k is no. decimal places
specify_decimal <- function(x, k) as.double(trimws(format(round(x, k), nsmall=k)))



### Shortcuts ###
# alt + drag up/ down multiline typing! Like visual column in vim

###  Cheatsheets  ###
# https://www.rstudio.com/resources/cheatsheets/


object <- 10


mode(object) # prints data type eg. string, numeric, boolian
rm(object) # deletes object from global environment

### Data types
#*numeric*
#*strings* in "speech_marks"  
#*boolian* either TRUE or FALSE  

### Data Structures
#### Vectors/lists
# A vector is an ordered list of data. To assign a vector to the object x:

x <- c(3,5,3,5)
mean(x)

y <- rep(5,50) # creates a vector with the value "5" 50 times.

z <- seq(10,100,5) # creates a vector starting at "10", and going up in steps of 20 until 100

fourth.element.z <- z[4]
two.to.four.z <- z[2:4] # NOT LIKE PYTHON: first value is indexed "1". 
z.minus.first.element <- z[-1] # NOT LIKE PYTHON: removes first element of the list

z < 55 # is each element in the list less than 55, gives back Boulian for each element
z[z<55] # only elements less than 55

# Sort returns values, order returns indices
sort(z, decreasing = TRUE) # sorts list

sample(z, 5) # takes a 5 random samples from the list

# IMPORTANT
# Operations done to a list applies the operation to each element of the list


#### Data Frames

str(cars)  # see structure of data

cars
colnames(cars)
carname = c(rep("pergeot",20),rep("BMW", 15),rep("golf",25))
carname = carname[-1:-10] # remove first ten variables
length(carname)
car.version <- c(rep(2.0,15), rep(2.1,5), rep(3,24), 4, rep(4.1,5))
car.type <- data.frame(carname,car.version) # create data frame
cars$cartype <- car.type # Add new column/data frame to cars
cars$cartype$carname[23]

# Create df
dd<-data.frame(names=c("Alice","Bob","Eve"), birthday=c("June","May","December"))
data.frame(matrix(ncol = 1)) 

#insert column 
df$newcolumn <- paste(df$col1, "and", df$col2, sep="_")

cars$cartype[23,] # brackets [ROW,COLUMN] remember with x,y axis of graph
cars[cars$cartype == "BMW"]
cars$cartype$carname <- NULL
summary(cars)
head(cars)
colnames(cars) <- gsub("distance", "distance_tavelled", colnames(cars))

# python_style key-value searching
mut_load_change$Generation_labs[n] <- paste(SRR_lineage_generation[SRR_lineage_generation$SRR_names==SRR_name, "generation_axis_labs"])

cars[2] # list style indexing, returns column
cars[,2] # matrix style indexing, returns a vector

  ## Filtering rows: base R and tidyverse ##
# put an expression in the index:
df[which(df$column == "specific value"), ]  # which() will exclude NaNs, without it will not. which is slower?
# Exclude two columns
DF[ , !(colnames(DF) %in% c("colname1", "colname2"))]

# select two columns and get unique combinations of their values:
unique(lin_mut_load_change[ ,c('Pos', 'Lineage')])


# append df to df
lin_mut_load_change <- rbind(lin_mut_load_change, mut_load_change)
cbing  # for columns


 # Tidyverse #
# Pipe using %>% eg. out_object <- df %>% egselect() %>% firstfilter %>% secondfilter 
# Operands & and | for selecting the intersection or the union of two sets of variables.
# Filter rows using df %>% filter()
# get frequency of an occurence in a column using tidyverse, filter so frequency >= 2.
df %>% count(colname1) %>% filter(n>=2)
mtcars %>% filter(str_detect(type, 'Toyota|Mazda'))


ggdf <- ggdf %>% 
  pivot_longer(c("DPG.POL.Phl.p","DPG.Phl.p","Phl.p", "unstimulated"), names_to = "Stimulation", values_to = "Population")
"""
# A tibble: 40 × 3
   metacluster Stimulation   Population
         <int> <fct>              <int>
 1           1 DPG.POL.Phl.p        305
 2           1 DPG.Phl.p            610
 3           1 Phl.p                615
 4           1 unstimulated        1256
 5           2 DPG.POL.Phl.p     152154
 6           2 DPG.Phl.p         192642
 7           2 Phl.p             179204
 8           2 unstimulated      163136
 9           3 DPG.POL.Phl.p      30067
10           3 DPG.Phl.p          31504
"""

# apply function to whole dataframe: 
# can use lapply: converts each col to list, applies function, and returns list for each col (so list of lists for df). Can then convert back to df
lapply(df, function(x){x})[1]
df[] <- data.frame(lapply(df, function(x){specify_decimal(x)}))

### Plotting

x = 1:50
length(x) # length of list
y = (x+2)*(x+5)
plot(x,y)
plot(x,y, type = "l", col="red") # creates a line plot, red line

barplot()

### ggplot tips ----------------------------------------------------------------
## Colour and size
# scale_fill_  and scale_colour_  only work when shape is set to values between 21:25 
# Automate based on factor of fill aes: improve by setting "Stimulation" col as factor
ggdf$Stimulation <- factor(ggdf$Stimulation, levels = c("Phl.p","DPG.Phl.p","DPG.POL.Phl.p","unstimulated"))
scale_fill_manual(values=setNames(scales::hue_pal()(length(levels(as.factor(ggdf[["Stimulation"]])))), levels(as.factor(ggdf[["Stimulation"]])))) + 

## Legend
# Remove legend for a particular aesthetic (fill):
  bp + guides(fill="none")
# It can also be done when specifying the scale:
  bp + scale_fill_discrete(guide="none")
# This removes all legends:
  bp + theme(legend.position="none")


# Heatmaps: https://jokergoo.github.io/ComplexHeatmap-reference/book/legends.html <- !!!!!!!!!
# scale each column:
mat <- scale(as.matrix(metaclusRes[, heatCols]))
## Colour heatmap
abs(mat) # makes all values positive by squaring the positive sqrt of each value
# colour to max / min of scale mat: equal distance either side of zero to furthest from zero
rg <- max(abs(mat))
col_fun = circlize::colorRamp2(c(-rg, 0, rg), c("blue", "white", "darkred")) 
# colour to max and min of scale mat: equal distance either side of zero
rg <- quantile(mat, c(0.01, 0.99))
col_fun = circlize::colorRamp2(c(rg[1], 0, rg[2]), c("blue", "white", "darkred")) 
# Min and max of vals in mat
col_fun = circlize::colorRamp2(c(min(mat), 0, max(mat)), c("blue", "white", "darkred")) 

  Heatmap(mat, 
          col = col_fun,
          heatmap_legend_param = list(
            title = "Scaled\nExpression",
            direction = "vertical",                        # scale bar horizontal or vertical
            title_position = "leftcenter-rot",             # -rot = rotated, right left center etc.
            legend_height = unit(4, "cm"),
            title_gp = gpar(col = "red", fontsize = 8)
          ))



url <- "http://www.mas.ncl.ac.uk/~nak102/teaching/MAS8406/fibroblast_data.txt"
fibro <- read.table(url, header = TRUE)
hist(fibro$Time, freq = FALSE, col = "gold", main = "Fibroblast cell survival", xlab = "Time", ylab = "Relative Frequency") # freq = FALSE shows relative frequency, ie. instead of no. cells surviving it shows proportion where 1 is the total - allows comparison of different datasetes
hist(fibro$Time, freq = TRUE, col = "gold", main = "Fibroblast cell survival", xlab = "Time", ylab = "Counts")
par(mfrow= c(1,2))


url <- "http://www.mas.ncl.ac.uk/~nak102/teaching/MAS8406/atp.txt"
cell_data <- read.table(url, header = TRUE)
attach(cell_data)
boxplot(ATP.ADP~Type+Temp, ylab = "ATP/ADP ratio") # Boxplots: boxplot(Data_to_be_plotted~category1+category2)


((x>1)&(x<5)) #x is greater than 1 and less than 5 
((x=="A")|(x=="T")) #x equals A or T 
(!(x>5)) #x is not greater than 5

### Reading and writing files

x <- read.table(file= "/file/path.txt", sep = "\t", header = TRUE)
write.table(x, file = "/file/path.txt", quote = FALSE)


## conditions
if (condition){
  
} else if (condition2) {
  
} else {
  
}

# 

    #### Looping ####

# Apply conditions across a vector with tidyverse is faster than for loops
library(tidyverse)

fbnums <- 1:50

output <- case_when(fbnums %% 15 == 0 ~ "FizzBuzz",
                    fbnums %% 3 == 0 ~ "Fizz",
                    fbnums %% 5 == 0 ~ "Buzz",
                    TRUE ~ as.character(fbnums))



    #### Large data ####
### General Principles:
#  - use sparse matrices, especially if data has many zero values eg. expression data
#  - find different implementation of algorithm/analysis
#  - subset data: processing data in chunks or line-by-line, careful selection of features
#  - parallelise
#  - matrix computing and use parallel serial computing to keep the memory requirements low, e.g.:
# (in python):
# for index0, data0 in dataset:
#   for index1, data1 in dataset:
#       new_df[index0, index1] = correlation(data0, data1)
#  - convert data types? eg. floats to integers

# appending rows/dfs: create separate df with same structure and use rbind
lin_mut_load_change <- rbind(lin_mut_load_change, mut_load_change)



# Name list of S4 objects:
names(ptmp_obj) <- pids



    ####  Parse command-line arguments  ####
library(argparse)
# create parser object
parser <- ArgumentParser()
required <- parser$add_argument_group("Required", "required arguments")

# Add arguments
required$add_argument(
  "--input",
  help = "full path to the sample sheet tsv file",
  metavar = "SampleSheet.tsv",
  required = TRUE
)

required$add_argument(
  "--manifest",
  help = "full path to the manifest file",
  metavar = "manifest",
  required = TRUE
)

args <- parser$parse_args()

if (!file.exists(args$input)) {
  stop("The input samplesheet was not found.")
}
if (!file.exists(args$manifest)) {
  stop("The manifest was not found.")
}

input <- read.delim(args$input)
manifest <- read.delim(args$manifest)

# check manifest paths exist

check_exists <- function(filepath) {
  RCurl::url.exists(filepath) | dir.exists(filepath)
}

dir_exists <- purrr::pmap_lgl(manifest, ~ check_exists(as.character(..2)))

if (!all(dir_exists)) {
  cat("The following paths were not found: -\n")
  print(manifest[!dir_exists, ])
  stop("Folder paths specified in the manifest were not found.")
} else {
  cat("✓ All paths specified in the manifest were found.\n")
}


# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------
# Docstrings:
library("docstring")
return_inverse <- function(x) {
  #' Multiplicative Inverse of Number
  #' 
  #' @description Computes the multiplicative inverse of the input
  #' 
  #' @param x: Real number.
  return(1/x)
  
}
?return_inverse
?return_inverse
