# Advanced Topics in Computer Science: Web Technology
### Lesson 4: Object-Oriented Programming

***Table of Contents***

- [Introduction](#introduction)
- [Classes](#classes)
- [Creating Objects](#creating-objects)  
- [Attributes](#attributes)
- [Methods](#methods)
- [Inheritance](#inheritance)
  - [Single Inheritance](#single-inheritance)
  - [Multiple Inheritance](#multiple-inheritance) 
  - [Overriding Methods](#overriding-methods)
- [Naming Conventions](#naming-conventions) 
- [Instance vs Class Methods](#instance-vs-class-methods)
- [Public vs Private](#public-vs-private)

## Introduction

- Object-oriented programming (OOP) is a programming paradigm that uses objects and classes in building applications.  
- It allows for modularity, encapsulation, abstraction and polymorphism.
- We will learn about using OOP techniques in Python.

## Classes  

- A class is like a blueprint for creating objects. It defines attributes and behaviors.
- To define a class in Python, use the class keyword:

```python
class MyClass:
  # Class body
```

- The class body contains method and attribute definitions

## Creating Objects

- We create an instance of a class using the constructor:

```python
my_object = MyClass() 
```

- This creates an object named my_object that is an instance of MyClass

## Attributes  

- Attributes are data associated with a class. They are variables that belong to an object.

- Define attributes inside the __init__ constructor method:

```python
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age
```   

- self refers to the current instance.
- We can access attributes using dot notation:

```python  
person = Person('John', 30)
print(person.name) # Prints 'John'
```

## Methods

- Methods are functions that belong to a class.
- They are defined inside the class body. 

```python
class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

  def greet(self):
    print('Hello, my name is', self.name)

person = Person('John', 30)  
person.greet() # Calls greet method
```

- self allows the method to access attributes and other methods on the same object.

## Inheritance

### Single Inheritance

- Inheritance allows us to create a parent-child class relationship.

- Child class inherits attributes and methods from parent class.

```python
class Vehicle:
  def __init__(self, make, color):
    self.make = make
    self.color = color

  def drive(self):
     print('Driving', self.make) 

class Car(Vehicle):
  def open_trunk(self):
    print('Opening trunk of', self.make) 
```

- Car inherits from Vehicle, so it gets drive() method
- It can also have its own unique methods like open_trunk()

### Multiple Inheritance

- A class can inherit from multiple parent classes:

```python
class GasPoweredEngine:
  # Gas engine methods
  
class ElectricPoweredEngine:
  # Electric engine methods
  
class Hybrid(GasPoweredEngine, ElectricPoweredEngine):
  # Hybrid inherits from both gas and electric classes  
```

- The inherited classes are specified in parentheses after the child class name.

### Overriding Methods 

- Child classes can override methods from the parent class by redefining them.

- This allows the child class to provide a specialized implementation of the method.

```python
class Vehicle:
  def start(self): 
    print('Starting engine')

class Car(Vehicle):
  def start(self):
    print('Turning key to start engine')
  
tesla = Car()
tesla.start() # Prints 'Turning key to start engine'
```

- Here Car overrides the start() method to provide custom behavior. 

- To call the parent method, use super():

```python 
class Car(Vehicle):
  def start(self):
    super().start() # Call parent start()  
    print('Turning key to start engine')
```

- super() gives access to the parent class. This allows you to extend the base implementation.

- Overriding methods is useful for customizing behavior in child classes.

## Naming Conventions

- ClassNames - PascalCase  
- method_names - snake_case
- __double_leading_underscore - Name mangling for private attributes
- _single_leading_underscore - Protected/Non-Public attributes

## Instance vs Class Methods

- Instance methods can access object state through self
- Class methods are marked with @classmethod, take cls arg instead of self
- Used to create factory methods that don't require object instance

## Public vs Private 

- Public attributes and methods can be accessed directly
- Private attributes and methods are name mangled with __double_leading_underscore  
- Protected attributes use _single_leading_underscore by convention