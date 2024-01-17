# SEE: R vs Julia - https://www.johnmyleswhite.com/notebook/2012/04/09/comparing-julia-and-rs-vocabularies/
#https://juliadatascience.io/select
#https://syl1.gitbook.io/julia-language-a-concise-tutorial/useful-packages/dataframes

:objname  # I think : is a bit like $ in bash?

print()  # print() in R
join(["dir/prefix", sampleName, 34, ".png"])  # paste0 in R: need vector of type::any (?)
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
# Index must be converted to Bool or Int type ie. Bool.[0,1,1,1,0] or Int.[2,3,4]
fcsFilesMetadata[Bool.(fcsFilesMetadata.fileStart .== 0),5] .= 4
replace!(df.a, "None" => "c")
# replace via condition over multiple columns
ltmp[:,[:label]] = ifelse.(ltmp[!,[:label]] .>=23, 26, ltmp[!,[:label]])

first(df, 10)  # 10 rows
last(df, 15)  # last 15 rows

_  # underscore is a throwaway variable
_, fcsParams = loadFCSHeader(md[1, :file_name])   # code returns list of 2 (?): underscore comma is assigning the output to two variables instead of one with a list of two?

## Operators ##
# When applied to a vector or list (?) needs the .
v1 .== v2  # Per value
v1 == v2  # like `all(v1 == v2)`  in R
findall()  # like which() in R


## Dictionaries ## 
#
