# Lesson 2

In the previous lesson, we introduced the Hash Table ADT and gave a few possible (not particularly good) implementations. The first suggestion was to simply save the keys and values in two lists where corresponding keys and values had the same idex. We might call this a "Chain Map" since we have to look up keys in a sequential "chain-like" fashion.

For completeness, here's what that would look like:

```python
class ChainMap():
    def __init__(self):
        self.keys = []
        self.vals = []

    def _index(self, key):
        for i, e in enumerate(keys)
            if key == e: return i
        return -1
    
    def get(self, key):
        index = self._index(key)
        return self.vals[indes] if index >= 0 else None

    def put(self, key, val):
        index = self._index(key)
        if index < 0: 
            self.keys.append(key)
            self.vals.append(val)
        else:
            self.vals[index] = val
    
    def as_tuples():
        return [(self.keys[i], self.vals[i]) for i in range(len(keys))]
    
```
The problem with this was that it's super slow: every time we want to find something, we have to slog through the list of all possible keys.

We also introduced the notion of a _hash function_ which converted every key to an array index. This allowed us to access keys efficiently, but it also introduced _collisions_, i.e. two keys having the same array index or _hash_.

There are a couple of options for dealing with this, but the simplest is a technique known as **separate chaining**, which is a hybrid between the two approaches above.

## Separate Chaining

The method of separate chaining (sometimes just "chaining") involves treating each list element in our hash table not as a single entry but as "bucket." If two elements have the same hash we simply add them to the same bucket. In turn, the buckets are simply our chain maps that we used above.

```python
import ChainMap
class ChainedHashTable:
    def __init__(self, hash_fn):
        self.buckets = [ChainMap() for _ in range(100)]
        self.hash = hash_fn
    
    def _bucket(self, key):
        return self.hash(key) % self._n

    def put(self, key, val):
        bucket = self._bucket(key)
        bucket.put(key, val)
    
    def get(self, key):
        bucket = self._bucket(key)
        return bucket.get(key)
```

### Efficiency

What is the worst-case scenario for runtime? If we get really unlucky, all of our keys will have the same hash, effectively reducing the whole table to a single chain. As we've seen, this is $O(n)$ in the runtime for lookups. However, if we make a few adjustments/assurances, we can expect this algorithm to perform much closer to $O(1)$.

#### Good vs. Bad Hash Functions

The main factor distinguishing good hash functions from bad is their ability to spread keys uniformly accross the space of possbile hashes, irrespective of patterns in the keys. In other words, the hash function should feel more or less random. If the has preserved the structure of the unhashed keys, we could end up with long chains if that structure reliably resulted in the same or similar hashes. By spreading out the hashes of keys "randomly," we are able to guarantee relatively short chains.

Don't forget, however, that hashes need to be _deterministic_, that is, they must always hash the same key to the same value. Although a good hash function will _look_ random, it cannot actually _be_ random: the trick is to come up with a good algorithm where it's hard to tell the difference. We'll see some tricks for picking good hash functions in a later lesson.

#### Table Size

Another challenge is deciding how many buckets/chains to create. If we have only a few buckets, the number of elements in each will be large and lookups slow. Ideally, we want a number of buckets proportional to the quantity of entries in the hash table. If we have a good hash functions, then we can expect lookups to run in constant time on average.

Now, if we know how many entries there will be ahead of time, this is prety easy to do: just make that many buckets! Most of the time, though, we're not so lucky. Instead, the best we can do is keep the size of the table roughly proportional to the number of entries. If we do that, then, on average, all of the chains will be of a constant length no matter how many entries are added. Here's what that might look like:

```python
import ChainMap
class ChainedHashTable:
    def __init__(self, hash_fn):
        self.buckets = [ChainMap() for _ in range(100)]
        self.hash = hash_fn
        self._n = 100
        self._sz = 0
    
    def _bucket(self, key):
        return self.hash(key) % self._n

    def put(self, key, val):
        bucket = self._bucket(key)
        bucket.put(key, val)
        self._sz += 1

        if self._sz >= self._n:
            self._double()
    
    def get(self, key):
        bucket = self._bucket(key)
        return bucket.get(key)

    def _double(self):
        old_buckets = self.buckets
        self._n *= 2
        self.buckets = [ChainMap() for _ in range(self._n)]

        for bucket in old_buckets:
            for key, val in bucket.as_tuples():
                self.put(key, val)
```

A couple of things to note--

1. The `_bucket()` function is dependent on the size of the table because we mod the hash by `_n`. Since the table size has changed, we need to rehash _everything_ in the table since it might be the case that two keys will have the same hash $mod \, 17$, say, but different $mod \, 34$. (You can probably think of some examples as an exercies).

<br/>

2. Rehashing the entire table is $O(n)$ which violates our rule that `put` operations should be $O(1)$. It turns out that this is okay since we only run the resize operation every $\frac{n}{2}$ puts. So, if all we care about is the overall runtime, we can spread the cost of this resize out:

$$\frac{kn}{n/2} = 2k$$

## Open Addressing

We have just given a solution to the collision problem by efficiently collecting all of the elements with the same hashes into chains. Now, we will present an alternative strategy: *Open Addressing*.

Separate chaining has the disadvantage of requiring a separate data structure for every individual bucket. If there aren't that many entries in the hash table (or if the table has recently been resized), most of these buckets will be empty. Open addressing deals takes advantage of this by inserting a colliding item in the next available hash slot, even if this isn't the correct hash. Then, when we want to look something up in the table, we keep looking for our key until we hit an empty space.

Here's a more detailed description of how that works:

### Initialization
Initialize an array (or list) with some default number of entries (say, 10 or 100).

### Put operation
_given the call `put(key,val)`, insert the key and value into the hash table_.

1. Hash the key mod the table length
2. If the resulting cell of the array is empty, put the `(key, val)` pair into that cell.
3. Otherwise:
    a. If the keys match, update the value
    b. If the keys do not match, move onto the next cell to the right (wrap back to the start if we go off the end)
4. Go back to 2
5. If the table is $\frac{2}{3}$ full, double the size (and rehash everything)

### Get operation
1. Hash the key mod the table length
2. Look up the corresponding cell in the array
  a. If the key matches return the linked value
  b. If the key does not match, move to the next element and repeat. If we hit an empty cell, there is no match; return `None`.

### Probing Sequence
This particular implementation of open addressing is known as **linear probing** since it deals with collisions by moving linearly through the array to find an open space. For our purposes, this is the only one we will consider. There are, however, other options that may be better.

For those that are interested, let us briefly acknowledge what is generally required to have a well-defined open addressing structure.

Note that because we deal with collisions by shifting the position of an element in the array, our hash function is essentially expanded by the probing step. In other words, where an element _actually_ ends up (its _true_ hash) is determined by its initial hash _plus_ the number of probes we need to do. Thus we can define our updated hash function:

$$H: K \times \{ 0, 1, 2, ..., n-1\} \rightarrow \{ 0, 1, 2, ..., n-1\}$$

For linear probing, our extended hash function would be defined as:

$$H(k,p) = (h(k) + p) \; mod \; n$$

Where $h(k)$ is our initial hashing of $k$ and $p$ is the number of probes we need to perform to get to an empty spot.

This is not the only kind of probing we could use another technique known as quadratic probing:

$$H(k,p) = (h(k) + p^2) \qquad mod \qquad p$$

In other words, in case of a collision we shift to the right one, then four, then nine, and so on. Quadratic hashing helps to solve the problem of _clustering_: simple linear probing tends to group data into large clumps.

We can use any hashing sequence we choose, but the sequence _must_ visit each element of the array at some point. In other words, the sequence $\{H(k,0), H(k,1), H(k, 2), \dots, H(k, n-1)\}$ must be a complete permutation of all the indices of the array.

## Assignment

Implement the class `OpenAddressingHashTable` using linear probing. How does its runtime compare to the hashmap with separate chaining?
