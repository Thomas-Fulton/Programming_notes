# SEE: R vs Julia - https://www.johnmyleswhite.com/notebook/2012/04/09/comparing-julia-and-rs-vocabularies/
#https://juliadatascience.io/select
#https://syl1.gitbook.io/julia-language-a-concise-tutorial/useful-packages/dataframes

:objname  # I think : is a bit like $ in bash?

# IMPORTANT: x = y does not create a copy but add another name for the same object!!!
x = 1
y = x
y = 2
x  # x is 2!!!
y = copy(x)

print()  # print() in R
string.(md[:,"Sample Name"], " ", md.Condition)  # paste0 in R: 
join(["dir/prefix", sampleName, 34, ".png"])     # join/paste0 alt in R: need vector of type::any (?)
repeat("hello", inner = 3, outer = 2)  # like rep(c("hello", "hello" ,"hello"), 2)
repeat([true], 8)  # 8 element vector{Bool}
obj = nothing  # like rm(obj) in R

using CategoricalArrays, DataFrames
df = DataFrame(a=1:2, b=[1.0, missing], c=categorical('a':'b'), d=[1//2, missing])

# Subsetting
# Select: will always return a dataframe (not a vector)
select!(md, Not("Name"))
rename(df, :Name => :cname )
rename!(fcsFilesMetadata, :matrixSize => "matrixSizeRows")

df[1, [:Name]]  # will return a df
df[1, :Name]  # will return a vector
df[:, 1]  # Will return a COPY of the vector
df[!, 1]  # Will return the underlying data itself
df[!, "newColname"] = vector  # new column eg.:
fcsFilesMetadata[!,"fileStart"] = repeat([0], size(fcsFilesMetadata)[1])  # Don't use missing values as they are hard to convert to anything else
v .> 3   # . is needed for element wise operations
# Delete column
select!(df, Not([:x2, :x10]))

# subset and replacing
# Indexing starts at 1 (like R) not 0 (like python)
# Index must be converted to Bool or Int type ie. Bool.[0,1,1,1,0] or Int.[2,3,4]
fcsFilesMetadata[Bool.(fcsFilesMetadata.fileStart .== 0),5] .= 4
# Booleans
# for bitvectors  [1 0 0 1 ]
Bool.(mdataBool) .&& Bool.(metaClusBool)  # must use .

replace!(df.a, "None" => "c")
# replace via condition over multiple columns
ltmp[:,[:label]] = ifelse.(ltmp[!,[:label]] .>=23, 26, ltmp[!,[:label]])

first(df, 10)  # 10 rows `head()` in R
last(df, 15)  # last 15 rows `tail()` in R

_  # underscore is a throwaway variable
_, fcsParams = loadFCSHeader(md[1, :file_name])   # code returns list of 2 (?): underscore comma is assigning the output to two variables instead of one with a list of two?

## Operators ##
# When applied to a vector or list (?) needs the .
v1 .== v2  # Per value
v1 == v2  # like `all(v1 == v2)`  in R
v1 || v2  # or 

# vectorised logical subsetting and examples
findall()  # like which() in R
in()  # returns BitVector (Bools). like `allMarkers %in% selectedMarkers` in R
  in(selectedMarkers).(allMarkers)              # 8-element BitVector: 0 0 1 0 1 0 1 0  
  findall(in(markers).(markerAntigens))         # 3-element Vector{Int64}: 3 5 7
  markerAntigens[in(markers).(markerAntigens)]  # 3-element Vector{String}: "CD19" "CD5" "CD27"
# Not / invert bitvector bool
.!in(selectedMarkers).(allMarkers)

## Vectors ##
# Treated as a column when adding to matrix, so need to be transposed before hcat (rbind)
eachcol(avector)  # converts to matrix and iterates through each, substitute for lapply 

## apply ## 
# map takes the function first, then the input
map(x -> join(x, " "), eachcol(markers))  # paste " " to each element of vector

string.(md[:,"Sample Name"], md.Condition)  # paste0

# lapply 

# Transpose a matrix
mat.'  # like `t(A)` in R

# Converting between types
Array()
Matrix()

# Matrices
amatrix = [1 3 2 5 3 ; 3 5 5 6 7 ]
avector = [3, 3, 0, 0, 0]
vcat(amatrix, avector')  # rbind vector (treated as a column until transposed (') )
[amatrix ; avector']     # rbind alternative
hcat(amatrix, newcolVector)  # cbind

## Dictionaries ## 
#
