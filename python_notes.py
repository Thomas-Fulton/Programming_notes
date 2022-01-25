     ################### Python notes ######################

# = defines an object, like "<-"" in R
# ** is ^
# % is / but outputs the remainder eg. 5/2 = 2r1, 1 is output
# function "float()" converts integer type (19) into a float (19.0)
# function "int()" and "float()" can convert a string containing numbers into an integer or float


# == is equal to 
# != is not equal to
# <= is less than or equal to

    #### reading files ####
file_handle= open("/file/path.txt")
for i in file_handle :
    (whatever you want loop)

data_as_string = data.read() #reads file into one string as one line with \n for newlines
lines = data.readlines() # reads whole file into a list of lines. Saves whole file into memory so be careful

data.close() # remeber to close the resource after to save memory?
#easier way to close is to use "with"

with open("file.txt") as data :
    #loop
#here data is already closed 



    #### Strings ####

\n = new line
\t = tab


#command input("Question/statement") prompts user to type an input. eg. 
name = input("Type your name:").strip()
print("Hello", name)
# output: Hello name

    ## Command Line Interface ## 
while TRUE :
    choice = input("Input \"1\" for start, \"2\" for options, or \"stop\" to exit")
    if choice == "1" :
        # do something
    elif choice == "2"
        # give options
    elif name.lower() == "stop" :
        # .lower allows for CAps mistakes
        break
    else :
        print("Invalid option, please try again!")



# each letter in a string has a corresponding value eg.
fruit = "banana"
#        012345 <- index or sub operator eg fruit[4] is the fourth index "a". 
#therefore
print(fruit[0])
b
#also if 
maxletters = 5
print(fruit[maxletters - 2])
a

#operator indices can be used to print a section of the string
print(fruit[0:4])
bana
0123
#^up to but NOT INCLUDING 4th index
print(fruit[:])
#print beginning to end

#length of string can be found with len function. Characters start at 1, not 0 like indexes do. 
>>> print(len(fruit))
6

# in as a logical

fruit = 'banana'
if 'n' in fruit :
    print("found n")


 ### methods ###
 # object.methods 

#finding position of letters and strings
position = fruit.find("na") #finds first occurence at 2
pos2 = fruit.find("ana", "n") # format: string.find("search term", "starting position")
thefruit = fruit.replace("ba", "the ba") #format: word.replace("old", "replacement"). Creates a copy with ALL matches replaced

#removing whitespaces. Includes spaces, tabs, \n newlines
string.strip()
string.rstrip() #removes whitespace from right of string
string.lstrip()

#prefix prefixes
line = "Male arrested for bad fart"
if line.startswith(Male) :
    print(line)

thestring = "Help I am a string and there's a cat with a gleam in their eye!!"

# spliting string into list - only works for stringsssss
last_word = thestring.split(" ")[-1]
#gives "eye!!" #splits single STRING with " " as delimiter into a LIST. outputs last string in list to object last_word

thestring_aslist = thestring.split(" ")
for word in thestring_aslist :
    char_count = word.len()
    lengthofeachword.append(char_count)

#
atinating strings with + and ,
>>> print(fruit+fruit)
bananabanana
>>> print(fruit,fruit) # inserts space between strings, can concatenate strings with integers and floats
banana banana


#Comparing strings
# < can be used to compare words alphabetically. Capital letters count as smaller than lower case FINISH

#changing case of strings
>>> Greeting = "Hi There"
>>> greeting = Greeting.lower()
>>> print(greeting)
hi there



    #### Conditionals ####
#indentation matters - either \t or four spaces "    ". Four spaces is good practice
#example
x=5
if x==5 :
    print("x is five")
else :
    print("x is not five")
    
# If there is no "else", there is the possiblility no commands will round

# elif is used for multiple conditionals. Only one line will run: the first line to be True. 
x = 15
if x <= 10 :
    print("x is smaller than ten")
elif x <= 20 :
    print("x is between 10 and 20")
elif x <= 30 :
    print("x is between 20 and 30")
# For the above, even though x is smaller than 30, the third block will not be run because the second block was.
# There is no "else" command so if x = 



# grading system

score = input("Enter Score: ")
try :
    fscore = float(score)

    try :
      if not fscore <= 1.0 :
            fscore/0
      else :
        if fscore >= 0.90 :
            print("A")
        elif fscore >= 0.80 :
            print("B")
        elif fscore >= 0.70 :
            print("C")
        elif fscore >= 0.60 :
            print("D")
        elif fscore >= 0.00 :
            print("F")
        else:
            raise RuntimeError("Cannot have negative score")
    except Exception as e:
        print("Invald score: {}".format(e)) # Formatting 
except Exception as e:
    print("Score cannot be converted to a number. {}".format(e))
    
# also explicitly state what type of errors can be caught
    except (TypeError, ZeroDivisionError)
    
    
 ### Formatting  
number = 8.93658947362847  
print("The number is {0:.2f}".format(number)) #number to 2 decimal places dp
    
    #### Loops and iterations ####

## while loop  INFINITE
# while, then statement eg. n > 0. n is the iteration variable. This should change within  the loop to avoid infinite loop.

# break stops the loop
# continue skips to the top of the loop


smallest = None
largest = None
while True:  # keep going until break
  num = input("Enter a number: ")
  if num == "done" : 
    break
  else : 
    try:
        num = float(num)
        if smallest is None : 
          smallest = num
        elif num < smallest :
          smallest = num
        elif largest is None : 
          largest = num
        elif num > largest :
          largest = num
        else : 
          pass
    except :
      print("Input: '", num, "' is an invalid input")
smallest = int(smallest)
largest = int(largest)
print("Maximum is", largest)
print("Minimum is", smallest)

quit() # often used in an except clause to halt the rest of the program when there's no reason to continue.

fruit = "banana"
index = 0
while index < len(fruit):
    print(fruit[index])
    index = index + 1
    


    ##FOR LOOP DEFINITE ##
# for a finite set or list
    
for i in [5, 4, 3, 2, 1] :   # i conventional letter for iteration variable 
     print (i)
print ("Blastoff!")

count = 0
total = 0
for i in [64,34,2,8,99] :
    count = count + 1
    total = total + i
    continue
average = total/count
print("Count = ", count, ", Total = ", total, "Average = ", average)

#counted loop
friends = [harry,julie,beth,dick,tom]

for i in range(len(friends)) :
    friend is friends[i]

    
    ### lists ###
# lists are made within []
# can be sliced like strings
list1 = []
list_num = [1,2,3,4,5]
list_string = ["one","two","three","four"]
# nested list
my_list = ["mouse", [8, 4, 6], ['a']]
# elements within a list can be accessed/sliced with an index operator: listname[element_number] The index must be an integer. eg:
print(list_string[0,2])
# ^output is 
# elements start at 0

my_list.append("book")
#lists are mutable, unlike strings. therefore DON'T do the following
my_list = my_list.append("book")


## Some functions for lists

len(nums) # count no of items in list
max(nums) # for integers/floats
min(nums)
sum(nums)
sorted(list) or list.sort()
reversed(list) or list.reverse()
list.remove(value)  # removes the first matching value
del list[3]  # removes value at the specific index
list.pop(3)  # removes value at the specific index and returns it


 ## list comprehension ##
# do something to every element in a list 
[x**2 for x in [1,2,3,4,5]]

# eg. for a dictionary 
print(sorted([(v,k) for k,v in dictionary.items() ])) 


    ### Dictionaries / Associative Arrays ###
# mutable
# key and value {key:value}
# random order
 
purse = dict() # makes empty dictionary
purse{}
purse["money"] = 12
purse["candy"] = 3
purse["tissues"] = 18

purse = {"money":12, "candy":3, "tissues":18}

#create nested dictionary
people = dict()    
def create_person(name,weight,height) : 
    person = {"name" : name, "height" : height, "weight" : weight}
    people[name] = person

#converting list to dictionary
friends = [harry,julie,beth,dick,tom]

friends_age = dict.fromkeys(friends, None)

#counting number of each key (object)
for object in purse :
    purse[object] = purse.get(object,0) + 1 
#dictionary.get(key, default) - searches for a key, and if it isn't present creates a key with the default value.


example use:

name = input("file name:")
if len(name) < 1 : name = "mbox-short.txt"

handle = open(name)

addresses = dict()
commonadrs = ("No address yet", 0)
for line in handle :
    if line.startswith("From ") : #can also do endswith()
        address = line.split()[1] #split line into words and take 2nd word as address
        addresses[address] = addresses.get(address, 0)+1 #take address as key and add one to value. Makes new key if doesn't exist.
        if commonadrs[1] < addresses[address] or commonadrs is None :
            commonadrs = (address, addresses[address])
    else : continue
     

print(commonadrs[0],commonadrs[1])
#to print key, then value
for object in purse : #for key in dictionary
    print(object, purse[object]

print(list(purse)    
purse.keys() #gives list of keys
purse.values() #gives list of values
purse.items() #gives list of BOTH in a tuple

#Iteration through two variables at the same time
for (object,value) in purse.items : #for key,value in dictionary
    print(object,value)
    
    
#sorting before looping by KEY
for k,v in sorted(purse.items()) :
    print(k,v)

#sorting before looping by VALUE
tmp = list()
for k,v in purse.items() :
   tmp.append((v,k))  #put tuple key and value pairs into a list ordered (value, key)
    tmp = sorted(tmp, reverse=True)    
    

    TARIFFS = {1: [20, 200, 150],
           2: [35, 400, 350]}

EXTRA_MINS_RATE = 0.10## put appropriate value in here
EXTRA_TEXT_RATE = 0.05## put approriate value in here


def available_tariffs() :
    out = "{:8} {:9} {:7} {:5}"                     #no. letters per cell header of output table
    print(out.format("Tariff #", "Flat Rate", "Minutes", "Texts")) # prints headers
    for tariff in TARIFFS.keys() :                  # for list of values in the tariff 1 key:
        inclusive = TARIFFS[tariff]                 #labels list [20, 200, 150] as inclusive
        print(out.format(tariff, inclusive[0], inclusive[1],
                         inclusive[2]))
    
# prints:
Tariff # Flat Rate Minutes Texts
       1        20     200   150
       2        35     400   350
       
print(TARIFFS[1][2]) # dictionary TARIFFS[Tariff 1][3rd item in list]
150
    
    ### Tuples ###
    
# Immutable :/ like strings. Therefore you can't sort, append, reorder etc
#comparison operators work with tuples eg. > < = etc.
#

#tuple on the left demands a tuple on the right
(x,y) = ("Fred", "17")


 ### enumerate ###
 list = "apple", "banana"
mylist = enumerate(list, 1) # enumerate(list, starting value) default is 0.
output = [(1, "apple"), (2, "banana")]


 #### Funtions ####
list1 = [1,2,3,4,5]
## Reduce applies function to first two elements of list, the applies the result to the next, then the next etc.
from functools import reduce
def add(x,y): return x+y
print(reduce(add, list1))# applies a function to the first two indexes, then the next etc.
output = 15

def by_ten(x):
    return x*10

## map applies the function to all elements in the list
list1x10 = list(map(by_ten, list1))
print(list1x10)



   ### Classes ###
class shape():
    def __str__(self): # define a method using the same def as defining a funciton. Always has the "self" parameter as object itself being called on. __str__() creates a string representation of the object.
        return "x = ", self.x 
    def __init__(self,x,y):
        self.x = x
        self.y = y
        
 # methods starting and ending with a __ indicate magic methods or protocols
 __init__ #is a constructor, that takes other arguments which are stored as attributes of the object
 
    ## Class inheritance 
    #Hierarchy or objects within objects. I
    #eg. in the below code, a rectangle is a shape, and so has the attributes of a shape (self.x,self.y) - if the attributes are not stated, the superclass is checked.
    #Additional attributes can be added lower down the hierarchy eg. circle can have r
    #Attributes can be overridden locally eg. 
    #
    
class Shape():
    def __init__(self,x,y):
        self.x = x
        self.y = y


class Circle(Shape):
    def __init__(self,x,y,r):
        Shape.__init__(self,x,y)
        self.r = r

    def __str__(self):
        return "Circle (x,y,r):({},{},{})".format(self.x,self.y,self.r)

class Rectangle(Shape):
    def __init__(self,x,y,height,width):
        Shape.__init__(self,x,y)
        self.height = height
        self.width = width

    def area(self):
        return self.height * self.width

    def __str__(self):
        return "Rectangle (x,y,height,width):({},{},{},{})" \
               .format(self.x,self.y,self.height,self.width )


class Square(Rectangle):
    def __init__(self,x,y,side):
        Rectangle.__init__(self,x,y,side,side)

    def __str__(self):
        return "Square (x,y,side):({},{},{})".format(self.x,self.y,self.height)


print( Circle(1,2,3) )
print( Square(4,5,6) )
print( Rectangle(1,2,3,4) )

print( Rectangle(1,2,3,4).area() )
print( Square(4,5,6).area() )


## The *arguments prefix allows infinite number of arguments
class Curve():
    def __init__(self,*items):
        self.items = list(items);
    def __str__(self):
        return "Curve:{}".format(self.items)
print(Curve(1,2,3))


    #### Help ####
help(function())
# returns """ information """ in the defined function

 ### Explore structure of an object
type(object)  #
vars(iris)  # list vars
dir(object)  # gives alphabetised list of attributes
object





    #### Stucture of a python project/package ####

## Quick points ##

# USE GIT (or other VCS)
# no _underscores_ or CAPS in package name, and avoid in modules --> see PEP8 guidelines
# A MODULE is any python script (.py)
# A PACKAGE is a directory containing modules AND an __init__.py 
# flatter project is better than nested: explicit imports become too long otherwise (see importing)


# Project needs: Licence.md, README.md, project/, .gitignore. All python scripts go into the project folder


    ## Importing ##
import package_namespace  # imports package
package_namespace.function1()

from package_namespace import function1, function2  # imports two functions from a package
function1()
function2()

# NEVER use * when importing modules to improve code readability and avoid functions with the same name clashing with each other. Also difficult to trace what has been imported and debug any problems from them 

# modules don't know about their "sibling" modules in the same directory, so the parent package must be stated eg. for the structurepackage/setup/module1 package/game/module2
module1.py
from game import module2  # WON'T WORK! Instead:
from package.game import module2  # or
import ..game/module2  # ... is back two packages, .... back three..
# bash-like relative paths only work within python packages 

# to import a module from the same package use . like bash eg.
from .setup import module3





    ## main ##
   
    # __main__ is the name of the environment where top-level code is run.
    # “Top-level code” is the first user-specified Python module that starts running. It’s “top-level” because it imports all other modules that the program needs. Sometimes top-level code is called an "entry point" to the application.
   
__main__.py  # the special file that is exectuted when a python package is ran directly with python: 
# eg. python -m package (OR module)
#     python3 module.py
#    python3 -c "import module"

    # __name__ is the variable of a module (eg. myscript.py), either top level or imported: in this case __name__ = "myscript". __main__ is set as only the top level module.

if __name__ == '__main__':
    # do something eg. run python script
    # this block is only ran if the script is exectuted as the entry point, ie. in the top level environment.



    #### arguments ####
## Argparse

# Used to parse arguments from the command line or interpreter
# Positional args don't have a flag.
# Positional or keyword (--flag value) can be optional or required arguments


    #### PyCharm ####
## Troubleshooting unrecognised but correct relative imports:
# make sure parent package is set as "sources root"



    #### Conventions ####
    # Pycharm helpfully corrects many, misc notes here:

    ## docstrings
# https://www.programiz.com/python-programming/docstrings
# change with class, function, object
