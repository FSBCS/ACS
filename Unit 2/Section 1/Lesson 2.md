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
        return self.hash(key)

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

Now, if we know how many entries there will be ahead of time, this is prety easy to do: just make that many buckets! Most of the time, though, we're not so lucky. Instead, the best we can do is keep the size of the table roughly proportional to the number of entries. If we do that, then, on average, all of the chains will be of a constant length no matter how many entries are added.