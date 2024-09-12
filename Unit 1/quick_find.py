class QuickFind:
    def __init__(self, n):
        self.id = list(range(n))
    
    def find(self, a, b):
        return self.get_id(a) == self.get_id(b)
    
    def union(self, p, q):
        pid = self.id[p]
        qid = self.id[q]
        if pid == qid:
            return
        for i in range(len(self.id)):
            if self.id[i] == pid:
                self.id[i] = qid

# Example usage
if __name__ == "__main__":
    n = 10
    qf = QuickFind(n)
    
    print("Initial array:", qf.id)
    
    qf.union(4, 3)
    print("After union(4, 3):", qf.id)
    
    qf.union(3, 8)
    print("After union(3, 8):", qf.id)
    
    print("find(3, 8):", qf.find(3, 8))
    print("find(5, 4):", qf.find(5, 4))
    
    qf.union(5, 4)
    print("After union(5, 4):", qf.id)
    
    print("find(5, 4):", qf.find(5, 4))