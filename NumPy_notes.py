# -*- coding: utf-8 -*-

import numpy as np



#### Differences from R ####
# 1. creating an object in R creates a separate copy eg. a <- a[1:5]
#    doing the same in Numpy only "views" the data - creates a shallow copy that when modified also modifies the original!!

# 2. column vs row major ordering. R uses column major ordering like Fortran


# numpy vs pandas: numpy more memory efficient (below 50K rows), and used in most machine learning packages.







# Arrays
# Can be indexed and sliced.
# One dimensional (vector), 2D, (matrix), 3D+ (tensor).


one_dimensional_array = np.array([1.2, 2.4, 3.5, 4.7, 6.1, 7.2, 8.3, 9.5])
print(one_dimensional_array)

two_dimensional_array = np.array([[6, 5], [11, 7], [4, 8]])
print(two_dimensional_array)

nested_array = np.array([[[1,2,3,4],[5,6,7,8]],[[2,3,4,5],[6,7,8,9]],[[1,1,1,1],[2,2,2,2]]]) # nested is just a three dimensional array
nested_array[0,0]  # nested_array[column,row]
nested_array[0,0][0]

## slicing rows and columns
# for a 2d array/matrix:
# --->>> array[column,row]
# for a 3d array
nested_array[]

print("Rows #0, #1, and #2:")
print(my_dataframe.head(3), '\n')

print("Row #2:")
print(my_dataframe.iloc[[2]], '\n')

print("Rows #1, #2, and #3:")
print(my_dataframe[1:4], '\n')

print("Column 'temperature':")
print(my_dataframe['temperature'])

# Elements in an array are all the same type: referred to as the "dtype"
x = np.ones(2, dtype=np.int64)  # np.float64

# Can be concatenated
a = np.array([1, 2, 3, 4])
b = np.array([5, 6, 7, 8])
np.concatenate((a,b))

x=np.array([[1, 2], [3, 4]])
y=np.array([[5, 6], [7,8]])
z=np.concatenate((x,y), axis=0)  # axis refers to dimension, internal structure is lost?


# The "shape" (or structure) of an array can be seen with the property .shape. Each tuple respresents
z.shape

# Can be reshaped with a tuple for the dimensions
z.reshape(2,2,2)

# array.shape property gives the indices of dimensions. eg.
arr = np.arange(5,11)
arr2 = np.reshape(arr, newshape=(2,3))
arr2.shape


## Properties of arrays
nested_array = np.array([[[1,2,3,4],[5,6,7,8]],[[2,3,4,5],[6,7,8,9]],[[1,1,1,1],[2,2,2,2]]])
nested_array[0,0]  # nested_array[column,row]
nested_array[0,0][0]

nested_array.ndim  # number of dimensions
nested_array.shape  # shape of array: 3 dimensions of 2 rows of 4 columns



# new axis/dimensions can be added 
a = np.array([[1 , 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
a2 = np.expand_dims(a, axis=(0))  # axis is the index of the shape of the array
arr3 = arr[np.newaxis, :]  # increases the dimensionality of the array - doesn't add a new column, more like adding a new sheet


# Can be indexed and sliced like python lists: indices start at 0, -ve indices go from the last value
data = np.array([1, 2, 3])
data[1]
data[0:2]
data[1:]
# data[start:stop:step]


# values can be obtained using expressions
a = np.array([[1 , 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
divisible_by_2 = a[a%2==0]  # divisible by 2
# boolean obtained by not slicing
divisible_by_2_boo = (a%2==0)

# Operators return boolean values 
c = a[(a > 2) & (a < 11)]  # both greater than 2 and less than 11
c = a[(a > 2) | (a < 11)]  # either

# nonzero can be used to return an array of TRUE values
d = np.nonzero(a%2==0)
print(d[0])
print(a)

# zip nonzero arrays into coordinates of True values?
list_of_coordinates = list(zip(d[0], d[1]))
for coord in list_of_coordinates : 
    print(coord)
print(list_of_coordinates)

# Can be used to search for values and get there coordinates in an array. If not present array will be empty.
not_there = np.nonzero(a == 42)
print(not_there)



# Viewing an array: creates a shallow copy of a section which is easy to index, slice and modify. 
# MODIFYING A VIEW WILL ALSO MODIFY THE ORIGINAL!!



    #### Useful functions ####

arr = np.arange(5,11) # Create sequence of intergers inclusive of 5, not of 11
np.zeros(5)  # Create array of zeros
np.empty(5)  # filled with random numbers - faster than np.zeros
np.random.randint(low=50, high=101, size=(6))  # random numbers
np.linspace(0, 10, num=5)  # array of 5 numbers of equal intervals apart from 0 to 10






