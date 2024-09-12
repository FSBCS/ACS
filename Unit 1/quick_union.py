class QuickUnion:
    def __init__(self, n):
        self.parent = list(range(n))
    
    def root(self, i):
        while i != self.parent[i]:
            i = self.parent[i]
        return i
    
    def find(self, a, b):
        return self.root(a) == self.root(b)
    
    def union(self, p, q):
        root_p = self.root(p)
        root_q = self.root(q)
        if root_p != root_q:
            self.parent[root_p] = root_q
