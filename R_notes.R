
########## Switching between versions of R ##############
# For 3.6:
# Set environmental variable and launch Rstudio from the terminal (add to ~/.profile to lauch with application icon)
export RSTUDIO_WHICH_R=/usr/local/bin/R3.6.3
#.libPaths() <- "/home/thomas/R/x86_64-pc-linux-gnu-library/3.6"


#### Setting up switching ######
## normal .libPaths() :
 #[1]  "/home/thomas/R/x86_64-pc-linux-gnu-library/3.6" "/usr/local/lib/R/site-library"                  "/usr/lib/R/site-library"                       
 #[4]  "/usr/lib/R/library"

# (root CL Bash):
mkdir /tmp/R3.6/
cp /home/thomas/R/x86_64-pc-linux-gnu-library/3.6/* /tmp/R3.6/ -r
## 2nd and 3rd directories in .libPaths() are empty - move 4th to save
mkdir /usr/lib/R3.6/ 
cp /usr/lib/R/* /usr/lib/R3.6/ -r

# Install R 4.1.3 and 3.6.3
export R_VERSION=4.1.3
curl -O https://cdn.rstudio.com/r/ubuntu-2004/pkgs/r-${R_VERSION}_1_amd64.deb
sudo gdebi r-${R_VERSION}_1_amd64.deb
/opt/R/${R_VERSION}/bin/R --version
# (making symlinks below is not necessary for subsequent installations)
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
# specify version
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R${R_VERSION}
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript${R_VERSION}

# Change environmental variable in ~/.profile
RSTUDIO_WHICH_R=/usr/local/bin/R


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

sort(z, decreasing = TRUE) # sorts list

sample(z, 5) # takes a 5 random samples from the list

# IMPORTANT
# Operations done to a list applies the operation to each element of the list


#### Data Frames

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


 # Tidyverse #
# Pipe using %>% eg. out_object <- df %>% egselect() %>% firstfilter %>% secondfilter 
# Operands & and | for selecting the intersection or the union of two sets of variables.
# Filter rows using df %>% filter()
# get frequency of an occurence in a column using tidyverse, filter so frequency >= 2.
df %>% count(colname1) %>% filter(n>=2)
mtcars %>% filter(str_detect(type, 'Toyota|Mazda'))

### Plotting

x = 1:50
length(x) # length of list
y = (x+2)*(x+5)
plot(x,y)
plot(x,y, type = "l", col="red") # creates a line plot, red line

barplot()


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

print(output)
