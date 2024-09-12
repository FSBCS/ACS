## Introduction to Object-Oriented Programming (OOP) in Python

Object-Oriented Programming (OOP) is a programming paradigm that focuses on creating objects that contain both data (attributes) and code (methods). In Python, OOP is a powerful tool for organizing and structuring code, promoting code reuse, and creating maintainable and scalable applications.

### Python Basics Review

Before diving into OOP, let's quickly review some fundamental Python concepts:

#### Variables
Variables are used to store data in Python. They can hold values of different data types, such as integers, floats, strings, booleans, and more.

```python
age = 25
name = "Alice"
is_student = True
```

#### Collections
Python provides built-in data structures that can contain multiple elements, known as collections. Some common collections include lists, dictionaries, tuples, and sets.

```python
# List
fruits = ["apple", "banana", "cherry"]

# Dictionary
person = {"name": "Alice", "age": 25, "is_student": True}

# Tuple
coordinates = (3, 4)

# Sets
unique_numbers = {1, 2, 3, 4, 5}
```

| Feature          | List                          | Dictionary                          | Tuple                          | Set                          |
|------------------|-------------------------------|-------------------------------------|--------------------------------|------------------------------|
| Syntax           | `["apple", "banana"]`         | `{"name": "Alice", "age": 25}`      | `(3, 4)`                       | `{1, 2, 3, 4, 5}`            |
| Ordered          | Yes                           | No                                  | Yes                            | No                           |
| Mutable          | Yes                           | Yes                                 | No                             | Yes                          |
| Allows Duplicates| Yes                           | No (keys must be unique)            | Yes                            | No                           |
| Access by Index  | Yes                           | No (access by key)                  | Yes                            | No                           |
| Common Use Cases | Ordered collection of items   | Key-value pairs                     | Fixed collection of items      | Unique collection of items   |



#### Functions
Functions are reusable blocks of code that perform a specific task. They can take arguments and return values.

```python
def greet(name):
    return f"Hello, {name}!"

greeting = greet("Alice")
print(greeting)  # Output: Hello, Alice!
```

#### Conditionals
Conditional statements, such as `if-elif-else`, allow you to execute different code based on certain conditions.

```python
if age < 18:
    print("You are a minor.")
elif age >= 18 and age < 65:
    print("You are an adult.")
else:
    print("You are a senior.")
```

#### Loops
Loops, such as `for` and `while`, allow you to repeatedly execute a block of code.

```python
for i in range(5):
    print(i)  # Output: 0, 1, 2, 3, 4

count = 0
while count < 3:
    print(count)
    count += 1  # Output: 0, 1, 2
```

### Object-Oriented Programming in Python

Now, let's dive into the core concepts of OOP in Python.

#### Classes and Objects
In OOP, a **class** is a blueprint or template for creating objects. An **object** is an instance of a class, which has its own attributes (data) and methods (functions).

```python
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year

    def start(self):
        print("Starting the car.")

    def stop(self):
        print("Stopping the car.")

# Creating objects (instances) of the Car class
my_car = Car("Toyota", "Camry", 2020)
your_car = Car("Honda", "Civic", 2018)

# Accessing object attributes and calling methods
print(my_car.make)  # Output: Toyota
my_car.start()  # Output: Starting the car.
```

#### Self Keyword
The `self` keyword is a reference to the current instance of the class. It is used to access the object's attributes and methods within the class.

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        print(f"Hello, my name is {self.name} and I am {self.age} years old.")
```

When a method is called on an object, Python automatically passes the object itself as the first argument to the method. This is why we use `self` as the first parameter in the method definition.


#### Constructors and Instance Methods
The `__init__` method is a special method called a **constructor**, which is used to initialize the object's attributes when it is created. **Instance methods** are functions defined within a class that operate on the object's data.

```python
class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount
        print(f"Deposited {amount} into {self.owner}'s account. New balance: {self.balance}")

    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount
            print(f"Withdrew {amount} from {self.owner}'s account. New balance: {self.balance}")
        else:
            print("Insufficient funds.")

# Creating a BankAccount object and calling its methods
my_account = BankAccount("Alice", 1000)
my_account.deposit(500)  # Output: Deposited 500 into Alice's account. New balance: 1500
my_account.withdraw(2000)  # Output: Insufficient funds.
```

#### Inheritance
**Inheritance** allows you to create a new class based on an existing class. The new class, called a **subclass**, inherits the attributes and methods of the existing class, called the **superclass**.

```python
class SavingsAccount(BankAccount):
    def __init__(self, owner, balance, interest_rate):
        super().__init__(owner, balance)
        self.interest_rate = interest_rate

    def apply_interest(self):
        self.balance += self.balance * self.interest_rate
        print(f"Applied {self.interest_rate * 100}% interest to {self.owner}'s account. New balance: {self.balance}")

# Creating a SavingsAccount object and calling its methods
savings_account = SavingsAccount("Alice", 1000, 0.05)
savings_account.deposit(500)  # Output: Deposited 500 into Alice's account. New balance: 1500
savings_account.apply_interest()  # Output: Applied 5.0% interest to Alice's account. New balance: 1575.0
```

#### Polymorphism
**Polymorphism** allows objects of different classes to be treated as objects of a common superclass. This is achieved through method overriding, where a subclass provides its own implementation of a method defined in the superclass.

```python
class Dog:
    def make_sound(self):
        print("Woof!")

class Cat:
    def make_sound(self):
        print("Meow!")

# Polymorphism in action
animals = [Dog(), Cat()]
for animal in animals:
    animal.make_sound()  # Output: Woof!, Meow!
```

##### Duck Typing
Python uses a concept called **Duck Typing**, which means that the type or class of an object is less important than the methods it defines. If an object implements a method, it can be used wherever that method is expected, regardless of its specific type.

In the example above, it is enough that both `Dog` and `Cat` classes have a method called `make_sound`. The specific type of the object is not important. In contrast to statically typed languages (where the types are checked at compile time), errors related to missing methods will only be detected at runtime in Python.

##### Method Overriding
Method overriding allows a subclass to provide a specific implementation of a method that is already defined in its superclass. When a method is called on an object, Python will look for the method in the class of the object and its superclasses.

```python
class Animal:
    def make_sound(self):
        print("Some generic sound")

class Dog(Animal):
    def make_sound(self):
        print("Woof!")

class Cat(Animal):
    def make_sound(self):
        print("Meow!")

x = Dog()
y = Cat()

x.make_sound()  # Output: Woof!
y.make_sound()  # Output: Meow!
```

In the example above, the `make_sound` method is overridden in the `Dog` and `Cat` subclasses to provide specific sounds for each animal.

Sometimes, you may want to call the overridden method from the superclass within the subclass method. This can be done using the `super()` function.

```python

class Dog(Animal):
    def make_sound(self):
        super().make_sound()  # Call the superclass method
        print("Woof!")

x = Dog()
x.make_sound()  # Output: Some generic sound Woof!
```

#### Encapsulation
**Encapsulation** is the practice of bundling the data (attributes) and methods that operate on the data within a class, and restricting access to the internal data. In Python, encapsulation can be achieved by using protected attributes and methods.

```python
class Circle:
    def __init__(self, radius):
        self._radius = radius  # Protected attribute

    def get_radius(self):
        return self._radius

    def set_radius(self, radius):
        if radius > 0:
            self._radius = radius
        else:
            print("Radius must be greater than 0.")

# Creating a Circle object and accessing/modifying its attributes

circle = Circle(5)
print(circle.get_radius())  # Output: 5
circle.set_radius(10)
print(circle.get_radius())  # Output: 10
```

Unlike some other programming languages, Python does not have strict access control keywords like `private` or `public`. Instead, it uses naming conventions to indicate the intended visibility of attributes and methods. By convention, attributes and methods prefixed with a single underscore `_` are considered protected and should not be accessed directly from outside the class.
