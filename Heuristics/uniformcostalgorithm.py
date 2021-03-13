"""
Author      :   Muhammad Reza Fahlevi
Dated       :   March 13th, 2021
Affiliation :   Departemen Ilmu Komputer,
                Fakultas Ilmu Komputer - Teknologi Informasi,
                Universitas Sumatera Utara, Indonesia
References  :   Benjamin Baka. Python Data Structures and Algorithms. 2017. Packt Publishing.
                https://docs.python.org/3.8/tutorial/index.html
                Stuart Russell and Peter Norvig. 2020. Artificial Intelligence: A Modern Approach, 4th Edition. University of California at Berkeley. Pearson.
                Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein - Introduction to Algorithms-MIT Press (2009).
"""

Adj = dict()
Cost = dict()

class Queue(object):
    def __init__(self):
        self.queue = list()
    
    def enqueue(self, nodetup):
        [self.queue.append(adjacency) for adjacency in nodetup]
    
    def dequeue(self):
        temp = self.queue[0]
        self.queue.remove(temp)
        return temp
    
    def sortedtup(self):
        self.queue.sort(key= lambda cost: cost[1])

class Vertex(object):
    def __init__(self, name, color):
        self.name = name
        self.color = color

A = Vertex("A", "white")
B = Vertex("B", "white")
C = Vertex("C", "white")
D = Vertex("D", "white")
E = Vertex("E", "white")
F = Vertex("F", "white")
G = Vertex("G", "white")
S = Vertex("S", "white")
K = Vertex("K", "white")
Z = Vertex("Z", "white")

Adj[A] = [(B, 3), (E, 8), (F, 3), (S, 4)]
Adj[B] = [(A, 3), (D, 6), (S, 4)]
Adj[C] = [(D, 3), (S, 5)]
Adj[D] = [(B, 6), (C, 3), (E, 4), (K, 5)]
Adj[E] = [(A, 8), (D, 4), (F, 5), (Z, 6)]
Adj[F] = [(A, 3), (E, 4), (G, 3)]
Adj[G] = [(F, 3), (Z, 7)]
Adj[S] = [(A, 4), (B, 4), (C, 5)]
Adj[K] = [(D, 5), (Z, 9)]
Adj[Z] = [(E, 6), (G, 7), (K, 9)]

vertexs = [S, A, B, C, D, E, F, G, K, Z]

Q = Queue()

def addtup(sttup, ndtup):
    temp = sttup[:-1] + ndtup[:-1]
    val = sttup[-1] + ndtup[-1]
    tup = temp + (val,)
    return tup

def mintup(thetup):
    thetup.sort(key= lambda cost: cost[1])
    return thetup[0]

Q.enqueue(Adj[S])
Q.sortedtup()
temp = Q.dequeue()
temp[0].color = "black"; print(temp[0].name)
minval = mintup(Adj[temp[0]])
addtups = addtup(temp, minval)
print(addtups)
print(addtups[0].name, addtups[1].name)