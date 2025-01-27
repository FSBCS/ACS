# Lesson 3: Hash Functions

So far we've discussed ways to store and structure data in a hash table using a hash function. In this lesson, we cover the final component, actually writing the hash function.

## Built-in `hash()` Function

Python comes with a built-in function, `hash()` which takes any data and hashes it if possible.


## Examples of Hashing Different Data Types

Below is a table showing different data types and their corresponding hash values using Python's built-in `hash()` function:

| Data Type | Data (x)       | Hash (hash(x))                |
|-----------|----------------|-------------------------------|
| Integer   | 42             | `42`                          |
| Float     | 3.14           | `322818021289917443`          |
| Tuple     | (1, 2, 3)      | `529344067295497451`          |
| List      | [1, 2, 3]      | Not hashable                  |
| String    | "hello"        | `-1446124798350477317`        |
| Object    | SomeObject()   | Implemented using the `__hash__()` magic method |

Note: Lists are not hashable in Python, so attempting to hash a list will result in a `TypeError`.

## Requirements for Hash Functions

We need to make three main assumptions about hash functions. Namely, that every hash function is:

1. Consistent
2. Compatible with `==`
3. Uniform

In other words, the hash function must hash the same key to the same value each time. Similarly, if two objects are equal, they should have the same hash. This applies particularly when we are hashing more complex classes which may have more than one way to consider equality. Finally, we also require our hash function to spread the data out evenly over the hash space, even if the keys chosen are structured in some way.

Since we're the ones designing the hash function now, we'll have to check these conditions.

## Hashing Techniques

As we see from the table, diffent data is hashed in different ways. Let's look at a few techniques for each.

### Integers

Integers are by far the easiest to hash. In this course, we'll simply hash an integer `k` into a hash table of length `n` by computing

$$h(k) = k \quad mod \; m$$

There are other options, but this is the easiest.

It is clearly compatible with assumptions 1 and 2. Assumption 3, however depends on our choice of `m`. Powers of $2$ are bad because they don't consider all of the bits of the integer, as are values one less than powers of two because they don't consider the _order_ of the bits. It turns out that _prime numbers_ not too close to a power of $2$ are ideal.

### Floats

As with integers, we want to take full advantage of _all_ of the bits of a number to optimize the spread in the hash table. Since we need to hash to an integer, it may seem hard to do this with any arbitrary decimal. Actually, though, if we remember that all data is just a bunch of binary digits, we can just consider it an integer and do the same modular arithmetic on that.

Doing this by hand in python is a little bit of a nightmare, so it's best left up to the implementation given by the interpreter.

### Strings

You might now be picking up on the trick: coming up with a hash is much easier if we have a nice way to convert things to integers. Annoyingly, this is not standardized between versions of Python, but it is in Java:

```python
def string_to_int(s, radix=31):
    result = 0
    for char in s:
        result = result * radix + ord(char)
    return result
```

This is a clever algorithm that considers the string as a base-31 number. This turns out to be a good base, providing sufficient distribution while being easy to compute.

### Tuples
It turns out that we can use the same exact trick with tuples by combining the _hashes_ of each element into a base-31 number.

```python
def tuple_hash(t):
    h = 0
    for item in t:
        h = h * 31 + hash(item)
    return h
```

### Lists

You may remember from the table above that lists are not hashable. Why can't we just use the same trick as tuples?

The problem here is bigger than the algorithm: lists make terrible keys because they are _mutable_. In other words, they are not compatible with the `==` operation over time unless we just don't appeal to the values they contain. Some languages, like Java, handle this by reporting the hash code as its memory address. For obvious reasons, that is usually a terrible choice, so Python simply does not allow it.

### Complex Objects

What about objects with a whole bunch of fields of different types? If we simply consider the fields to be one big tuple, we've already solved the problem! This is generally the best way to implement the `__hash__()` magic method, but be careful: you should limit the hashed fields to those that are _immutable_, lest we encounter the same problem as lists!

## Universal Hashing (*)
All of our efficiency calculations in previous lessons relied on assumption 3, that hashing results in a uniform distribution. Of course, it is totally possible that in a worst-case scenario, some adversary could choose only keys that all hashed to the same value. That would be a real problem!

With a sufficiently irreversible hash function, it is hard to imagine this could actually happen, but sometimes we do get really unlucky. In either case, it turns out that it can be possible to defeat the adversary on average using a technique called **Universal Hashing**.

The idea is to define as set $H$ containing _multiple_ hash functions. If we define each function in such a way that it maps very differently from the other functions, we could defeat the adversary by simply choosing a different function. Since we can't do that efficiently after we've already done several insertions, we simply choose one of the functions at random at the start; then, sometimes we'll lose to the adversary, but on average we'll come out on top!

Mathematically, we say that the the set $H$ is a universal family if:

$$x,y \in K, x\neq y \Rightarrow |\{h \in H: h(x) = h(y)\} \leq \frac{|H|}{n}$$

In other words, if we choose any two elements from $K$ (even maliciously), then a random choice of $h$ will result in a collision in at most $\frac{1}{n}$ of the time, that is _uniformly_.

### Carter-Wegman Method
It turns out we can relatively easy define such a family of hash functions! To do this, we just choose some prime number $p$ _greater_ than the size of the key space. Then, every hash function in the family can be expressed as:

$$h_{a,b}(x) = ((ax + b) \quad mod\; p) \quad mod \; n$$

where $a$ and $b$ are integers less than $p$ and $a\neq 0$

In practice choosing a sufficiently large $p$ is often impractical, since the key space is likely to be large. In practice, we often use a value of $p$ just a little larger than $n$.

## Assignment

Consider the following class:

```python
class Student:
    def __init__(id, fn, ln, gl, gpa):
        self.id = id
        self.first_name = fn
        self.last_name = ln
        self.grade_level = gl
        self.gpa = gpa
    
    def __hash__():
        pass
        #get the hash of the student
```

Correctly implement the hash magic method.
