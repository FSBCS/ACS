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

Programming Assignment: Deck of Cards
For this assignment, you will model a Deck of playing Cards using object-oriented programming techniques in Python.

Requirements:

Create a Card class representing a single playing card. It should have suit (Hearts, Diamonds, Clubs, Spades) and value (Ace, 2-10, Jack, Queen, King) attributes.

Create a Deck class representing a deck of 52 standard playing cards. It should have a cards attribute containing a list of Card objects.

Implement a deal_card() method in the Deck class to deal (pop and return) a single card from the deck.

Implement a shuffle() method in the Deck class that randomly shuffles the order of the cards in the deck.

Create a Hand class representing a hand of cards. It should have a cards attribute containing dealt cards.

Implement a take_card() method in Hand to take a card from a Deck instance and add it to the hand.

Implement a total_value() method in Hand that returns the total value of the cards using this scheme:

Number cards are worth their number (2 through 10). Face cards (Jack, Queen, King) are worth 10 points each. Aces are worth 1 or 11 points (your choice).

Demonstrate your implementation by creating a Deck instance, shuffling it, dealing 5 cards into a Hand instance, and then printing the value of the hand.

This covers the key areas of defining classes, attributes, methods, inheritance, and utilizing object instances. Please let me know if you have any other questions!