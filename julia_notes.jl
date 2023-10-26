# SEE: R vs Julia - https://www.johnmyleswhite.com/notebook/2012/04/09/comparing-julia-and-rs-vocabularies/
#https://juliadatascience.io/select
#https://syl1.gitbook.io/julia-language-a-concise-tutorial/useful-packages/dataframes

:objname  # I think : is a bit like $ in bash?

# print in r
printf()
repeat("hello", inner = 3, outer = 2)  # like rep(c("hello", "hello" ,"hello"), 2)
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
df[!, colname] = vector  # new column
v .> 3   # . is needed for element wise operations

# subset and replacing
replace!(df.a, "None" => "c")
# replace via condition over multiple columns
ltmp[:,[:label]] = ifelse.(ltmp[!,[:label]] .>=23, 26, ltmp[!,[:label]])

first(df, 10)  # 10 rows
last(df, 15)  # last 15 rows


## Dictionaries ## 
#
