# Advanced Topics in Computer Science: Web Technology
### Lesson 3: Pythonic Code

**Table of Contents**
1. [Introduction to Pythonic Code](#1-introduction-to-pythonic-code)
2. [List Comprehensions](#2-list-comprehensions)
3. [Lambda Functions](#3-lambda-functions)
4. [The Zen of Python](#4-the-zen-of-python)
5. [The `map()` Function](#5-the-map-function)

---

## 1. Introduction to Pythonic Code

"Pythonic" refers to the idiomatic way of writing Python code. It's not just about writing code that works but writing code that is clear, concise, and adherent to Python's design principles.

**Key Takeaways**:
* Pythonic code is more readable and often more efficient.
* It follows the principle of "There should be one-- and preferably only one --obvious way to do it."

---

**Lecture Notes: Python Comprehensions**

---

**Objective**: By the end of this lesson, you should be able to understand and use comprehensions in Python to create and transform data collections more concisely.

---

**2. List Comprehensions**:

**Syntax**:
```python
[expression for item in iterable if condition]
```

**Examples**:
- Create a list of squares:
  ```python
  squares = [x*x for x in range(10)]
  ```

- List of even numbers:
  ```python
  evens = [x for x in range(10) if x % 2 == 0]
  ```

---

**3. Set Comprehensions**:

**Syntax**:
```python
{expression for item in iterable if condition}
```

**Example**:
- Create a set of squares without duplicates:
  ```python
  squares_set = {x*x for x in range(-5, 6)}
  ```

---

**4. Dictionary Comprehensions**:

**Syntax**:
```python
{key_expression: value_expression for item in iterable if condition}
```

**Examples**:
- Map numbers to their squares:
  ```python
  square_dict = {x: x*x for x in range(5)}
  ```

- Create a dictionary of vowels mapped to their ASCII values:
  ```python
  vowels = {char: ord(char) for char in 'aeiou'}
  ```

---

**5. Nested Comprehensions**:

You can nest comprehensions inside other comprehensions. However, use this judiciously as it can make the code less readable.

**Example**:
- Matrix transposition:
  ```python
  matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  transposed = [[row[i] for row in matrix] for i in range(3)]
  ```

---

**6. Advantages of Comprehensions**:

- **Conciseness**: Reduces the amount of code required.
- **Readability**: Can improve readability for simple cases.
- **Performance**: List comprehensions can sometimes be faster than equivalent `for` loop constructs.

---

**7. Points of Caution**:

- **Over-complication**: Avoid nesting too many comprehensions or including complex logic.
- **Memory**: List comprehensions create a list in memory. For large datasets, consider using generator expressions `(x*x for x in range(10))` which are more memory-efficient.

---

**8. Practice Exercises**:

1. Create a list of all the odd numbers between 1 and 20 using a list comprehension.
2. Create a dictionary that maps each character of a string to its ASCII value.
3. Use a set comprehension to find the unique vowels in a given string.



## 3. Lambda Functions

Lambda functions are small, anonymous functions defined using the `lambda` keyword.

**Basic Syntax**:
```python
lambda arguments: expression
```

**Examples**:

* A simple lambda function to add two numbers:
```python
add = lambda x, y: x + y
print(add(5, 3))  # Output: 8
```

* Using `lambda` with the `filter()` function:
```python
numbers = [1, 2, 3, 4, 5]
evens = list(filter(lambda x: x % 2 == 0, numbers))
print(evens)  # Output: [2, 4]
```

---

## 4. The Zen of Python

The Zen of Python is a collection of 19 aphorisms that capture the philosophy of the Python language.

```python
import this
```

### "Beautiful is better than ugly."

**Explanation**: Code aesthetics matter. Beautifully written code is easier to read, understand, and maintain. It also sets a standard of craftsmanship in software development.

**Non-Zen**:
```python
def calc(x,y):if x>0:return y/x
```

**Zen**:
```python
def calculate_ratio(numerator, denominator):
    if denominator > 0:
        return numerator / denominator
```

### "Explicit is better than implicit."

**Explanation**: Code should be clear about its intent. Instead of making readers guess what a piece of code does, it's better to make everything obvious and straightforward.

**Non-Zen**:
```python
def make_list(n):
    return [i for i in range(n)]
```

**Zen**:
```python
def generate_numbers_list(upper_limit):
    return [number for number in range(upper_limit)]
```

### "Simple is better than complex."

**Explanation**: While complex solutions might be necessary at times, simplicity should be preferred whenever possible. Simple code is easier to understand, debug, and maintain.

**Non-Zen**:
```python
def find_odd_numbers(data):
    odd_numbers = []
    for number in data:
        if not number % 2 == 0:
            odd_numbers.append(number)
    return odd_numbers
```

**Zen**:
```python
def find_odd_numbers(data):
    return [number for number in data if number % 2 != 0]
```

### "There should be one-- and preferably only one --obvious way to do it."

**Explanation**: Consistency is key. Instead of having multiple ways to achieve the same goal, having one clear way reduces confusion and potential sources of error.

**Non-Zen**:
Imagine using multiple libraries or methods that essentially do the same thing, leading to confusion and redundancy.

**Zen**:
Choose and stick to one reliable method or library, ensuring consistency throughout the codebase.

### "Readability counts."

**Explanation**: Code is written once, but read multiple times—by the author and by others. Making code readable ensures that it can be understood, debugged, and maintained effectively.

**Non-Zen**:
```python
def p(l):return [x for x in l if isinstance(x,int) and x>0]
```

**Zen**:
```python
def filter_positive_integers(data_list):
    return [item for item in data_list if isinstance(item, int) and item > 0]
```

---

## 5. The `map()` Function

The `map()` function is a standard function in Python that allows you to apply a function to every item of an iterable (like a list or tuple) and returns a map object (an iterator). This makes data transformation tasks concise and readable.

**Basic Syntax**:
```python
map(function, iterable)
```

**Examples**:

1. **Doubling each number in a list**:

**Non-Zen (Using a loop)**:
```python
numbers = [1, 2, 3, 4, 5]
doubled_numbers = []

for number in numbers:
    doubled_numbers.append(number * 2)

print(doubled_numbers)  # Output: [2, 4, 6, 8, 10]
```

**Zen (Using `map()`)**:
```python
numbers = [1, 2, 3, 4, 5]
doubled_numbers = list(map(lambda x: x * 2, numbers))

print(doubled_numbers)  # Output: [2, 4, 6, 8, 10]
```

2. **Converting a list of strings to uppercase**:

**Non-Zen (Using a loop)**:
```python
words = ["apple", "banana", "cherry"]
uppercase_words = []

for word in words:
    uppercase_words.append(word.upper())

print

(uppercase_words)  # Output: ['APPLE', 'BANANA', 'CHERRY']
```

**Zen (Using `map()`)**:
```python
words = ["apple", "banana", "cherry"]
uppercase_words = list(map(str.upper, words))

print(uppercase_words)  # Output: ['APPLE', 'BANANA', 'CHERRY']
```

By understanding and utilizing `map()`, Python developers can perform iterative transformations in a clean and Pythonic way.

## Homework Assignment: Pythonic Weather Analysis

**Background**:
Weather data is crucial for various applications from climate research to daily planning activities. In this assignment, you will be performing some data analysis on a list of daily temperatures to gain insights using Pythonic code techniques.

**Dataset**:
You're provided with a list of dictionaries representing a month of daily weather data:
```python
daily_temperatures = [
    {"date": "2023-09-01", "temperature": 22},
    {"date": "2023-09-02", "temperature": 25},
    # ... and so on for the month.
]
```

**Tasks**:

1. **Warm Days Filter**:
   - Use a list comprehension to extract all dates where the temperature was above 24 degrees Celsius.
   
2. **Temperature Conversion**:
   - Convert the Celsius temperatures to Fahrenheit (formula: `F = C * 9/5 + 32`).
   - Use the `map()` function to create a new list that includes dictionaries with both Celsius and Fahrenheit values.
   
3. **Weekend Averages**:
   - Given a separate list with the days of the week for each date:
     ```python
     days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", ...]
     ```
   - Use a lambda function and list comprehension to compute the average temperature for weekends (Saturdays and Sundays).

4. **Bonus Task**: 
   - Identify any two consecutive days where the temperature difference was more than 5 degrees Celsius. Return these dates.

**Tips**:
- Remember to make your code Pythonic! Think about readability, simplicity, and efficiency.
- Use the Python techniques discussed in the lesson, like list comprehensions, lambda functions, and the map() function.

**Submission**:
Please submit a `.py` file named `weather_analysis.py` containing your code and a brief documentation/comment on top explaining your approach for each task.
