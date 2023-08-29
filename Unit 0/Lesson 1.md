# Advanced Topics in Computer Science: Web Technology

## Lecture Notes for Lesson 1: Introduction to Python Syntax and Control Structures

---

### Overview
In this lesson, we'll be diving into the very basics of Python programming, focusing on its syntax, variables, data types, and control structures like conditionals and loops.

---

### Talking Points

#### 1. Introduction to Python Syntax

##### a. Importance of Syntax
- Syntax is the set of rules that defines the combinations of symbols considered to be correctly structured programs.
  
##### b. Python's Readability
- Python emphasizes readability, using whitespace for indentation rather than braces or other special characters.

```python
# Correct Indentation
if True:
    print("This is properly indented.")

# Incorrect Indentation
if True:
print("This will cause a syntax error.")
```

#### 2. Variables and Data Types

##### a. Variables
- Variables are containers for storing data values.

```python
x = 5
name = "John"
```

##### b. Common Data Types
- Integers, Floats, Strings, Booleans

```python
integer_type = 10
float_type = 20.5
string_type = "Hello, World!"
boolean_type = True
```

##### c. Dynamic Typing
- Python uses dynamic typing, meaning you can change the data type of a variable even after it's been set.

```python
x = 10
x = "ten"
```

##### d. The `type()` Function
- The `type()` function is used to determine the data type of a variable.

```python
x = 10
print(type(x))  # Output: <class 'int'>
```

#### 3. Indentation

##### a. Blocks of Code
- Indentation signifies a block of code.

```python
if True:
    print("This is indented.")
```

##### b. Importance of Consistency
- Consistency in indentation is crucial; otherwise, it leads to runtime errors.

```python
# This will cause an error
if True:
    print("This is indented.")
  print("This is not consistently indented.")
```

#### 4. Conditional Statements

##### a. `if`, `elif`, `else`
- Control flow can be directed using conditional statements.

```python
x = 10
if x > 5:
    print("x is greater than 5")
elif x == 5:
    print("x is equal to 5")
else:
    print("x is less than 5")
```

##### b. Comparison Operators
- `<`, `>`, `==`, `!=`, `<=`, `>=`

```python
if x != 10:
    print("x is not 10")
```

#### 5. Loops

##### a. `for` Loop
- Used for iterating over a sequence (list, tuple, dictionary, string, etc.).

```python
for i in range(5):
    print(i)
```

##### b. `while` Loop
- Repeats as long as a certain boolean condition is met.

```python
x = 0
while x < 5:
    print(x)
    x += 1
```

##### c. Loop Control Statements
- `break`: Exits the closest enclosing loop, skipping the optional `else` clause if the loop has one.
  
```python
for i in range(5):
    if i == 2:
        break
    print(i)
```

- `continue`: Skips the rest of the code inside the current loop iteration and moves to the next iteration.

```python
for i in range(5):
    if i == 2:
        continue
    print(i)
```

- `pass`: Does nothing; it's a placeholder when syntax requires some code but you have nothing meaningful to put there.

```python
for i in range(5):
    if i == 2:
        pass
    print(i)
```

---

### Programming Assignment

For the programming assignment, please write a Python script that:
1. Takes user input for their name and age.
2. Uses the `type()` function to confirm that age is stored as an integer.
3. Uses conditional statements to check if the user's age is over 18.
4. Prints out a greeting that is appropriate for their age.

Example:

```python
name = input("What is your name? ")
age = int(input("What is your age? "))

print("The age variable is of:", type(age))

if age > 18:
    print(f"Hello, {name}. You are an adult.")
else:
    print(f"Hello, {name}. You are not an adult.")
```

---

With these fundamentals in hand, you'll be ready to tackle more advanced Python programming concepts in the next lesson.