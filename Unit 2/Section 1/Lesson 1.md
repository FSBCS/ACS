# Lesson 1

## Arrays
Arrays are always an efficient data structure allowing both accesses and writes in $O(1)$ time. This is possible because arrays make use of _direct addressing_, that is each "cell" of the array is assigned an index corresponding to a fixed memory address. If the memeory address is known (by way of the index) the contents of that address can be made instantly available to the CPU.

There is a big trade-off here: we must always use a fixed set of sequential integer indices: $0,1,2,3,...$ . Additionally, in most languages, in order to allocate memory efficiently, the size of the array is fixed after initialization.

## Motivation

Sometimes these trade-offs are more than we are willing to sacrifice. In previous lessons we covered _lists_ which do not have fixed lenght and gave a couple of examples (linked lists and dynamic resizing) of efficient implementations of the list API.

Similarly, we may not wish to confine ourselves to the sequential indices required for an array. Instead, it might be useful to have, for example, meaningful key-value pairs. In fact, this is the principle behind a **symbol table** (also known as a **dictionary**). Symbol tables allow for efficient look ups of data given a corresponding key (like looking up the definition of a known word). You will likely have used python dictionaries in a variety of applications. Here's an example from Dijkstra's Algorithm.

```python
# Extract from Dijkstra's Algorithm
ops = {
    '+': lambda a, b: a + b,
    '-': lambda a, b: a - b,
    '*': lambda a, b: a * b,
    '/': lambda a, b: a / b
}
```

In this example, we needed to select an arithmetic operation to perform based on the character read. Hence, our dictionary serves an important purpose which an array could not fulfill: directly linking the symbol with its function.

### Implementation

Let's look at a few example--inefficient and efficient--of implementations of symbol tables. Of course, we're doing this in Python, so we'll have to pretend dictionaries aren't already built in.

#### Naive Implementation

The most obvious and direct way to accomplish this task is to use two lists (covered in the previous unit) where elements are linked by sharing the same index.

```python
class Dictionary:
    def __init__(self):
        self.keys() = []
        self.values() = []

    def _index(key):
        for i in range(len(self.keys)):
            if self.keys[i] == key: return i
        return -1
    
    def contains(key):
        return self._index(key) != -1
    
    def put(key, val):
        i = self._index(key)
        if i == -1:
            self.keys.append(key)
            self.values.append(val)
        else:
            self.values[i] = val
    
    def get(key):
        i = self._index(key)
        if i == -1: return None
        return self.values[i]
    
    def delete(key):
        i = self._index(key)
        if i != -1:
            self.keys.pop(i)
            self.values.pop(i)
```

There's nothing fancy going on here. Every function in the API relies on the `index()` function which locates the key in the `keys` list and looks up the corresponding value in the `values` list. The problem, of course, is that each lookup is $O(n)$--much worse than lists and arrays!

## Hash tables

One solution to our symbol table problem above would be to use direct addressing with an array. First we convert each key to a numerical index and then store the value in the corresponding array.

```python
class DirectAddressDictionary:
    def __init__(self, n=1000):
        self.items = [None] * n

    def put(self, key:int, value):
        self.items[key]

    def get(self, key:int):
        return self.items[key]

    def delete(self, key:int):
        self.items[key] = None
```

Problem solved! Each of these operations is $O(1)$. Of course, as you might expect, we're sweeping a really important detail under the rug here: the keys have to be integers. If this is going to work, we need to convert each of the keys to a _unique_ integer. That's a problem because our list needs to be initialized to store every possible key at the beginning (or dynamically resized). If the space of possible keys is large (let's say strings), even with just a couple of entries in the dictionaries our list is going to be gargantuan. This is the time-space trade-off that we always have to deal with.

### Hash Functions
We can cut down on the amount of space we need to allocate by changing the way we convert keys to integers. Instead of insisting that every key be assigned a _unique_ integer, we define a **hash function** that assigns one that is "unique enough." We'll say more about that in a moment, but first, here's a formal definition:

A **hash function** $h: K \rightarrow M$ maps any key in $K$ (the set of all possible keys) to an integer in $M$ where $M$ is the set ${0,1,2,...m-1}$ and $m$ is the length of our hash table.

In other words, if we want to define a relatively small hash space, we need to cook up some function that converts ("maps") the keys to integers within that range. The process of applying a hash function to keys is called **hashing**.

#### Example
Let's say that we want to use a dictionary to build an address book where the keys are names (strings) and the values are addresses. How could we hash the keys effectively? One solution is to use the [ASCII value](https://www.ascii-code.com/) of each character in the string. We might guess that we'll have roughly 100 entries in the address book ultimately and so we define a list with 100 entries. Then, to hash a string, we sum all of the ASCII values together and take the sum mod 100.

For example, let's say we wanted to hash the name "Newman." Here are the ASCII values:

| N | e | w | m | a | n |
|---|---|---|---|---|---|
| 78 | 101 | 119 | 109 | 97 | 110 |

So, $h(``Newman")$ would be $(78 + 101 + 119 + 109 + 97 + 110)$ mod $100 = 4$. So, we would put the address corresponding to "Newman" in the index 4.

Below is a possible implementation of our address book

```python
class AddressBook:
    def __init(self)__:
        self.items = [None] * 100

    def hash_key(key):
            total = 0
            for char in key:
                total += ord(char)
            return total % 100
    
    def put(key, val):
        i = hash_key(key)
        self.items[i]
    
    def get(key, val):
        i = hash_key(key)
        return self.items[i]

    def delete(key, val):
        i = hash_key(key)
        return self.items[i]
```
What's great about this example is that as long as our hash function is reasonably efficient, the runtime of `put()`, `get()`, and `delete()` is all $O(1)$. And, if we keep the list a proportional size to the number of entries, it's $O(n)$ in terms of space.

There is however a glaring problem...

### Collisions
In order to save space, we decided to limit the number of possible keys and to create a hash function that would be "good enough." In our example above, we tried to use the sum of ASCII values. But, there are plenty of words that hash to the same value. For example, "gobble" and "bandana" both hash to $19$. In fact, as long as our key space is larger than the range of hashes, there will always be the possibility of a collision which we need to deal with.

This will be the point of departure for the next lesson.


## Assignment

Write the example hash function in python code and identify two words that have identical hashes.

