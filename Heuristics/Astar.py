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

A = Vertex("Arad", "white")
B = Vertex("Timisoara", "white")
C = Vertex("Zerind", "white")
D = Vertex("Oradea", "white")
E = Vertex("Lugoj", "white")
F = Vertex("Sibiu", "white")
G = Vertex("Mehadia", "white")
H = Vertex("Rimnicu Vilcea", "white")
I = Vertex("Fagaras", "white")
J = Vertex("Drobeta", "white")
K = Vertex("Craiova", "white")
L = Vertex("Pitesti", "white")
M = Vertex("Giurgiu", "white")
N = Vertex("Bucharest", "white")
O = Vertex("Urziceni", "white")
P = Vertex("Vaslui", "white")
Q = Vertex("Iasi", "white")
R = Vertex("Neamt", "white")
S = Vertex("Hirsova", "white")
T = Vertex("Eforie", "white")

# Given Adjhsld[node] = [(node', weight, hsld)]
# hsld(goal_state) = 0
Adjhsld[A] = [(B, 118, 329), (C, 75, 374), (F, 140, 253)]
Adjhsld[B] = [(E, 111, 244), (A, 118, 366)]
Adjhsld[C] = [(A, 75, 366), (D, 71, 380)]
Adjhsld[D] = [(C, 71, 374), (F, 151, 253)]
Adjhsld[E] = [(G, 70, 241), (B, 111, 329)]
Adjhsld[F] = [(D, 151, 380), (A, 140, 366), (H, 80, 193), (I, 99, 176)]
Adjhsld[G] = [(J, 75, 242), (E, 70, 244)]
Adjhsld[H] = [(K, 146, 160), (F, 80, 253), (L, 97, 100)]
Adjhsld[I] = [(F, 99, 253), (N, 211, 0)]
Adjhsld[J] = [(K, 120, 160), (G, 75, 241)]
Adjhsld[K] = [(J, 120, 242), (H, 146, 193), (L, 138, 100)]
Adjhsld[L] = [(H, 97, 193), (K, 138, 160), (N, 101, 0)]
Adjhsld[M] = [(N, 90, 0)]
Adjhsld[N] = [(I, 211, 176), (L, 101, 100), (M, 90, 77), (O, 85, 80)]
Adjhsld[O] = [(N, 85, 0), (S, 98, 151), (P, 142, 199)]
Adjhsld[P] = [(O, 142, 80), (Q, 92, 226)]
Adjhsld[Q] = [(R, 87, 234), (P, 92, 199)]
Adjhsld[R] = [(Q, 87, 226)]
Adjhsld[S] = [(O, 98, 80), (T, 86, 161)]
Adjhsld[T] = [(S, 86, 151)]

def addtup(sttup, ndtup):
    """
    Take two tuple as its parameter, where the different
    length of both tuples is allowed, then return a list of
    a tuple. How this function
    work is as follows: sttup:= (4A, hsld(A)), ndtup:= (5B, hsld(B)), 
    then it will (path(A-B), cost(path), cost(path) + hsld(B)). In this
    case, it will return [(A, B, fn)] where fn = cost(path) + hsld(B)
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
    # for qitems in Q.queue:
    #     print([q.name for q in qitems[:-2]], qitems[-1])
    while Q.queue != []:
        Q.sortedtup()
        node = Q.dequeue()
        if node[-3].name == goal.name:
            Goal.enqueue([node])
        else:
            node[-3].color = "black"
            for vertex in Adjhsld[node[-3]]:
                if vertex[0].color == "white":
                    descendant = addtup(node, vertex)
                    Q.enqueue(descendant)
            # for qitems in Q.queue:
            #     print([q.name for q in qitems[:-2]], qitems[-1], end=" ")
            # print("")
    return Goal.queue

sol = astar(A, 366, N)

for qitems in sol:
    print(f"path : {[q.name for q in qitems[:-2]]}")
    print(f"cost : {qitems[-2]}")
    print(f"fn : {qitems[-1]}")
    print("")
