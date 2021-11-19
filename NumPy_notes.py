# -*- coding: utf-8 -*-

import numpy as np

# Arrays
# Can be indexed and sliced.
# One dimensional (vector), 2D, (matrix), 3D+ (tensor). NOT the same as nesting?


one_dimensional_array = np.array([1.2, 2.4, 3.5, 4.7, 6.1, 7.2, 8.3, 9.5])
print(one_dimensional_array)

two_dimensional_array = np.array([[6, 5], [11, 7], [4, 8]])
print(two_dimensional_array)

# Elements in an array are all the same type: referred to as the "dtype"
x = np.ones(2, dtype=np.int64)


# Can be concatenated
a = np.array([1, 2, 3, 4])
b = np.array([5, 6, 7, 8])
np.concatenate((a,b))

x=np.array([[1, 2], [3, 4]])
y=np.array([[5, 6]])
np.concatenate((x,y), axis=2)


## Properties of arrays
nested_array = np.array([[[1,2,3,4],[5,6,7,8]],[[2,3,4,5],[6,7,8,9]],[[1,1,1,1],[2,2,2,2]]])

nested_array.ndim  # number of dimensions
nested_array.shape  # shape of array: 3 dimensions of 2 rows of 4 columns


# can be reshaped. array.shape property gives the indices of dimensions. eg.
arr = np.arange(5,11)
arr2 = np.reshape(arr, newshape=(2,3))
arr2.shape

# new axis/dimensions can be added 
a = np.array([[1 , 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
a2  = np.expand_dims(a, axis = (0))  # axis is the index of the shape of the array
arr3 = arr[np.newaxis,:]

# Can be indexed and sliced like python lists: indices start at 0, -ve indices go from the last value
data = np.array([1, 2, 3])
data[1]
data[0:2]
data[1:]







    #### Useful functions ####

arr = np.arange(5,11) # Create sequence of intergers inclusive of 5, not of 11
np.zeros(5)  # Create array of zeros
np.empty(5)  # filled with random numbers - faster than np.zeros
np.random.randint(low=50, high=101, size=(6))  # random numbers
np.linspace(0, 10, num=5)  # array of 5 numbers of equal intervals apart from 0 to 10

