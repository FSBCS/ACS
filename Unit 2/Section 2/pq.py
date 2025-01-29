class Node:
    def __init__(self, priority, value):
        self.priority = priority
        self.value = value
    
    def __lt__(self, other):
        return self.priority < other.priority

class MaxPQ:
    def __init__(self):
        self._pq = [None]  # Initialize with a dummy element at index 0
        self._size = 0
    
    def is_empty(self):
        return self._size == 0
    
    def insert(self, priority, value):
        self._pq.append(Node(priority, value))
        self._size += 1
        self._swim(self._size)
    
    def _swim(self, k):
        while k > 1 and self._pq[k] > self._pq[k // 2]:
            self._pq[k], self._pq[k // 2] = self._pq[k // 2], self._pq[k]
            k //= 2

    def peek(self):
        if self.is_empty():
            raise IndexError("Priority queue is empty")
        return self._pq[1].value

    def del_max(self):
        if self.is_empty():
            raise IndexError("Priority queue is empty")
        max_node = self._pq[1]
        self._pq[1] = self._pq[self._size]
        self._pq.pop()
        self._size -= 1
        self._sink(1)
        return max_node.value
    
    def _sink(self, k):
        left = 2 * k
        right = 2 * k + 1
        largest = k
        if left <= self._size and self._pq[left] > self._pq[largest]:
            largest = left
        if right <= self._size and self._pq[right] > self._pq[largest]:
            largest = right
        if largest != k:
            self._pq[k], self._pq[largest] = self._pq[largest], self._pq[k]
            self._sink(largest)

class MinPQ:
    def __init__(self):
        self._pq = [None]  # Initialize with a dummy element at index 0
        self._size = 0
    
    def is_empty(self):
        return self._size == 0
    
    def insert(self, priority, value):
        self._pq.append(Node(priority, value))
        self._size += 1
        self._swim(self._size)
    
    def _swim(self, k):
        while k > 1 and self._pq[k] < self._pq[k // 2]:
            self._pq[k], self._pq[k // 2] = self._pq[k // 2], self._pq[k]
            k //= 2

    def peek(self):
        if self.is_empty():
            raise IndexError("Priority queue is empty")
        return self._pq[1].value

    def del_min(self):
        if self.is_empty():
            raise IndexError("Priority queue is empty")
        min_node = self._pq[1]
        self._pq[1] = self._pq[self._size]
        self._pq.pop()
        self._size -= 1
        self._sink(1)
        return min_node.value
    
    def _sink(self, k):
        left = 2 * k
        right = 2 * k + 1
        smallest = k
        if left <= self._size and self._pq[left] < self._pq[smallest]:
            smallest = left