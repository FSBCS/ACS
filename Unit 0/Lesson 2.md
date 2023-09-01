# Advanced Topics in Computer Science: Web Technology

## Lecture Notes for Lesson 2: Python Functions and Data Structures

---

### Overview

In the second lesson, we'll explore Python functions and commonly used data structures like lists, tuples, sets, and dictionaries. You'll learn how to define your own functions and how to manipulate various data types efficiently.

---

### Table of Contents

1. [Introduction to Functions](#1-Introduction-to-Functions)
2. [Data Structures in Python](#2-Data-Structures-in-Python)
3. [Manipulating Data Structures](#3-Manipulating-Data-Structures)
4. [Looping Through Data Structures](#4-Looping-Through-Data-Structures)
5. [Introduction to Python Modules](#5-Introduction-to-Python-Modules)
6. [Programming Assignment](#Programming-Assignment)


### Talking Points

#### 1. Introduction to Functions

##### a. What is a Function?
- A function is a block of reusable code that performs a specific task.
  
##### b. Defining a Function
- Use the `def` keyword to define a function.

```python
def greet(name):
    print(f"Hello, {name}!")
```

##### c. Calling a Function
- Functions are executed when they are called.

```python
greet("John")  # Output: Hello, John!
```

##### d. Parameters and Arguments
- Parameters are variables listed inside the parentheses in the function definition.
- Arguments are the values sent to the function when it is called.

```python
def add(a, b):  # 'a' and 'b' are parameters
    return a + b

result = add(5, 3)  # 5 and 3 are arguments
```

##### e. Understanding `*args`

- `*args` allows you to pass a variable number of non-keyword arguments to a function. It gathers extra positional arguments into a tuple.

```python
# Using *args to accept multiple arguments
def sum_all(*args):
    return sum(args)

print(sum_all(1, 2, 3, 4))  # Output: 10
```

##### f. Understanding `**kwargs`

- `**kwargs` allows you to pass a variable number of keyword arguments to a function. It gathers extra keyword arguments into a dictionary.

```python
# Using **kwargs to accept multiple keyword arguments
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name='John', age=30, email='john@email.com')
```

##### g. Default Parameter Values

- Default parameter values specify that a parameter will take a certain value if no argument is provided for it. 

```python
# Using default parameter values
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}")

greet("John")  # Output: Hello, John
greet("John", greeting="Hi")  # Output: Hi, John
```

##### h. Mixing Positional, Keyword Arguments, and Default Parameters

- You can mix positional arguments, `*args`, keyword arguments, default parameters, and `**kwargs` in a function definition. However, they have to appear in this specific order.

```python
# Mixing *args, **kwargs, and default parameters
def my_function(a, b, *args, greeting="Hello", **kwargs):
    print(f"{greeting}, a: {a}, b: {b}")
    print("Additional arguments:", args)
    print("Additional keyword arguments:", kwargs)

my_function(1, 2, 3, 4, greeting="Hi", x=5, y=6)
```

Output:

```
Hi, a: 1, b: 2
Additional arguments: (3, 4)
Additional keyword arguments: {'x': 5, 'y': 6}
```

##### i. Unpacking Sequences and Dictionaries

- You can also use `*` and `**` to unpack sequences and dictionaries when calling a function.

```python
# Unpacking a list and a dictionary
def my_function(a, b, c):
    print(f"a: {a}, b: {b}, c: {c}")

my_list = [1, 2]
my_dict = {'c': 3}

my_function(*my_list, **my_dict)  # Output: a: 1, b: 2, c: 3
```

#### 2. Data Structures in Python

##### a. Lists
- Ordered, mutable, and allows duplicate elements.

```python
my_list = [1, 2, 3, 4]
```

##### b. Tuples
- Ordered, immutable, and allows duplicate elements.

```python
my_tuple = (1, 2, 3, 4)
```

##### c. Sets
- Unordered, mutable, and does not allow duplicate elements.

```python
my_set = {1, 2, 3, 4}
```

##### d. Dictionaries
- Unordered, mutable, and does not allow duplicate keys.

```python
my_dict = {'name': 'John', 'age': 30}
```

#### 3. Manipulating Data Structures

##### a. Adding and Removing Elements

###### i. Lists

- `append()`: Adds an element at the end of the list.
- `extend()`: Adds multiple elements at the end of the list.
- `remove()`: Removes the first occurrence of a specific element.
- `pop()`: Removes and returns an element at the given index, or the last item if the index is not specified.

```python
# append() example
my_list = [1, 2, 3]
my_list.append(4)  # [1, 2, 3, 4]

# extend() example
my_list.extend([5, 6])  # [1, 2, 3, 4, 5, 6]

# remove() example
my_list.remove(1)  # [2, 3, 4, 5, 6]

# pop() example
last_element = my_list.pop()  # 6, list becomes [2, 3, 4, 5]
```

###### ii. Sets

- `add()`: Adds an element to the set.
- `update()`: Adds multiple elements to the set.
- `remove()`: Removes a specified element from the set. Raises a KeyError if the element is not found.
- `discard()`: Removes a specified element from the set if it is present.

```python
# add() example
my_set = {1, 2, 3}
my_set.add(4)  # {1, 2, 3, 4}

# update() example
my_set.update([5, 6])  # {1, 2, 3, 4, 5, 6}

# remove() example
my_set.remove(1)  # {2, 3, 4, 5, 6}

# discard() example
my_set.discard(2)  # {3, 4, 5, 6}
```

###### iii. Dictionaries

- Setting by key: You can add a new key-value pair by assigning a value to a new key.
- `update()`: Updates the dictionary with key-value pairs from another dictionary, overwriting existing keys.
- `del`: Removes a key-value pair by key.
- `pop()`: Removes a key-value pair by key and returns its value.

```python
# Setting by key example
my_dict = {'name': 'John', 'age': 30}
my_dict['email'] = 'john@email.com'  # {'name': 'John', 'age': 30, 'email': 'john@email.com'}

# update() example
my_dict.update({'name': 'Jane', 'city': 'New York'})  # {'name': 'Jane', 'age': 30, 'email': 'john@email.com', 'city': 'New York'}

# del example
del my_dict['age']  # {'name': 'Jane', 'email': 'john@email.com', 'city': 'New York'}

# pop() example
email = my_dict.pop('email')  # 'john@email.com', dictionary becomes {'name': 'Jane', 'city': 'New York'}
```


##### b. Accessing Elements
- Lists and Tuples: Indexing
- Dictionaries: By key

```python
# List example
first_element = my_list[0]

# Dictionary example
name = my_dict['name']
```

#### 4. Looping Through Data Structures

##### a. Using For-Loops

```python
# Loop through a list
for element in my_list:
    print(element)

# Loop through a dictionary
for key, value in my_dict.items():
    print(key, value)
```

##### b. Using List Comprehensions

```python
# Create a new list with each element squared
squared_list = [x ** 2 for x in my_list]
```

---

#### 5. Introduction to Python Modules

##### a. What is a Module?

- A module is a file containing Python code. It could be definitions of variables, functions, or classes. You can import these into other Python scripts or notebooks to reuse code.

##### b. Using the `import` Statement

- To use a Python module, you have to import it using the `import` statement.

```python
import math
```

##### c. Accessing Functions and Variables

- After importing, you can use the functions or variables defined in that module.

```python
print(math.sqrt(16))  # 4.0
```

##### d. Importing Specific Functions

- You can also import only specific functions from a module.

```python
from math import sqrt

print(sqrt(16))  # 4.0
```

##### e. Aliasing Modules

- Sometimes modules have long names, and in such cases, you can use an alias.

```python
import numpy as np
```

##### f. Creating Your Own Modules

- You can write your own Python file with a set of functions and import it just like built-in modules. 

```python
# my_module.py
def greet(name):
    return f"Hello, {name}"

# main_script.py
import my_module

print(my_module.greet("John"))  # Hello, John
```

---


# Assignment: Simple Task Manager

## Objective

In this assignment, you'll create a simple task manager to keep track of your to-dos and completed tasks. Your task manager should be able to add tasks, mark them as complete, and show the list of to-dos and completed tasks.

## Requirements

1. **Data Structures**: Use a dictionary to store the tasks. Within that dictionary, use a list to keep track of to-do tasks and another list for completed tasks. The initial structure should look like this:

    ```python
    tasks = {
        'todo': [],
        'completed': []
    }
    ```

2. **Add Task**: Write a function called `add_task` that takes a task description and adds it to the 'todo' list.

    ```python
    def add_task(task_description, tasks):
        pass  # Your code here
    ```

3. **Complete Task**: Write a function called `complete_task` that takes a task description, removes it from the 'todo' list, and adds it to the 'completed' list.

    ```python
    def complete_task(task_description, tasks):
        pass  # Your code here
    ```

4. **List Tasks**: Write a function called `list_tasks` that prints the tasks in both the 'todo' and 'completed' lists.

    ```python
    def list_tasks(tasks):
        pass  # Your code here
    ```

5. **Duplicate Check**: Use a set to keep track of all task descriptions ever added (either to 'todo' or 'completed') to ensure that no task is added more than once.

    ```python
    all_tasks = set()
    ```

6. **Main Function**: Write a `main` function that allows the user to add, complete, and list tasks until they decide to exit the program.

    ```python
    def main():
        pass  # Your code here
    ```

### Helpful note: The "in" Operator in Conditionals

You've seen the "in" operator being used in loops to iterate through elements in a list or other iterable objects. The "in" operator can also be used within conditionals to check for the existence of a value within a data structure.

#### Syntax

```python
if value in some_data_structure:
    # Do something
```

#### Example

```python
# Using 'in' with a list
if 3 in [1, 2, 3, 4, 5]:
    print("3 is in the list!")

# Using 'in' with a set
if 'apple' in {'apple', 'banana', 'cherry'}:
    print("Apple is in the set!")

# Using 'in' with a dictionary (checks keys by default)
if 'age' in {'name': 'Alice', 'age': 30}:
    print("The key 'age' is in the dictionary!")```

---

The next lesson will dive deeper into Pythonic idioms and best practices, giving you the tools to write more advanced and efficient code.