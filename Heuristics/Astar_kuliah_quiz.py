"""
Author      :   Muhammad Reza Fahlevi
Dated       :   March 17th, 2021
Affiliation :   Departemen Ilmu Komputer,
                Fakultas Ilmu Komputer - Teknologi Informasi,
                Universitas Sumatera Utara, Indonesia
References  :   Benjamin Baka. Python Data Structures and Algorithms. 2017. Packt Publishing.
                https://docs.python.org/3.8/tutorial/index.html
                Stuart Russell and Peter Norvig. 2020. Artificial Intelligence: A Modern Approach, 4th Edition. University of California at Berkeley. Pearson.
                Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein - Introduction to Algorithms-MIT Press (2009).
"""

Adjhsld = dict()

class Queue(object):
    """
    By default, it is a class of first in first out (FIFO)
    queue. Where it takes a tuples as its element. The data type
    of the queue is a list of tuples. In this case (A* algorithm),
    self.queue contain a list of a tuples (path, cost(path), evalfun)
    """
    def __init__(self):
        self.queue = list()
    
    def enqueue(self, listoftup):
        for tup in listoftup:
            self.queue.append(tup)
    
    def dequeue(self):
        temp = self.queue[0]
        self.queue.remove(temp)
        return temp
    
    def sortedtup(self):
        self.queue.sort(key= lambda fn: fn[-1])

class Vertex(object):
    def __init__(self, name, color):
        self.name = name
        self.color = color

S = Vertex("S", "white")
A = Vertex("A", "white")
B = Vertex("B", "white")
C = Vertex("C", "white")
D = Vertex("D", "white")
E = Vertex("E", "white")
F = Vertex("F", "white")
G = Vertex("G", "white")
H = Vertex("H", "white")
L = Vertex("L", "white")
K = Vertex("K", "white")
M = Vertex("M", "white")
N = Vertex("N", "white")
Z = Vertex("Z", "white")

# Given Adjhsld[node] = [(node', weight, hsld)]
# hsld(goal_state) = 0
Adjhsld[S] = [(A, 4, 70), (C, 4, 55), (D, 6, 65)]
Adjhsld[A] = [(E, 5, 55), (F, 6, 45)]
Adjhsld[B] = [(S, 3, 50)]
Adjhsld[C] = []
Adjhsld[D] = [(B, 3, 50), (F, 7, 45), (G, 5, 45)]
Adjhsld[E] = [(H, 7, 80), (F, 4, 45)]
Adjhsld[F] = [(G, 3, 45), (L, 5, 50)]
Adjhsld[G] = [(K, 4, 65), (L, 6, 50)]
Adjhsld[H] = [(L, 3, 50), (M, 8, 80)]
Adjhsld[L] = [(M, 6, 80), (N, 4, 60), (Z, 9, 0)]
Adjhsld[K] = [(L, 2, 50)]
Adjhsld[M] = [(Z, 6, 0)]
Adjhsld[N] = [(K, 4, 65), (Z, 5, 0)]
Adjhsld[Z] = []

def addtup(sttup, ndtup):
    """
    Take two tuple as its parameter, where the different
    length of both tuples is allowed, then return a list of
    a tuple. How this function
    work is as follows: sttup:= (4A, hsld(A)), ndtup:= (5B, hsld(B)), 
    then it will return (path(A-B), cost(path), cost(path) + hsld(B)). In this
    case, it will return [(A, B, cost(path), fn)] where fn = cost(path) + hsld(B)
    """
    if sttup == ndtup:
        return list(sttup)
    pathcost = sttup[-2] + ndtup[-2]
    evalfun = pathcost + ndtup[-1]
    sumtup = [sttup[:-2] + ndtup[:-2] + (pathcost, evalfun)]
    return sumtup # it is a list of a tuple

# uncomment this 10 line below to demonstration
# print(A, A.name); print(F, F.name)
# print(Adjhsld[A][2][0], Adjhsld[A][2][0].name)
# vertices = (A, 0, 366)
# adj = Adjhsld[A][2]
# nodeeval = addtup(vertices, adj)
# print(nodeeval)

# nextadj = Adjhsld[F][2]
# print(nextadj, nextadj[0].name)
# nodeeval = addtup(nodeeval[0], nextadj)
# print(nodeeval)

# uncomment this loop
# for qitems in Q.queue:
#     print([q.name for q in qitems[:-2]], qitems[-1])
# in def astar to print the queue for each phase
def astar(vertices, hsld, goal):
    Q = Queue()
    Goal = Queue()
    node = (vertices, 0, hsld)
    Q.enqueue([node])
    count = 0
    while Q.queue != []:
        Q.sortedtup()
        count += 1
        print(f"phase {count}:")
        for qitems in Q.queue:
            print(f"({[q.name for q in qitems[:-2]]}, cost = {qitems[-1]})", end=" ")
        print("")
        node = Q.dequeue()
        if node[-3].name == goal.name:
            Goal.enqueue([node])
        else:
            node[-3].color = "black"
            for vertex in Adjhsld[node[-3]]:
                if vertex[0].color == "white":
                    descendant = addtup(node, vertex)
                    Q.enqueue(descendant)
    return Goal.queue

sol = astar(S, 50, Z)

for qitems in sol:
    print(f"path : {[q.name for q in qitems[:-2]]}")
    print(f"cost : {qitems[-2]}")
    print("")
