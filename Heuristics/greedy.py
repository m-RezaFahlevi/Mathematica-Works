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

class Queue(object):
    """
    By default, it is a class of first in first out (FIFO)
    queue. Where it takes a tuples as its element. The data type
    of the queue is a list of tuples.
    """
    def __init__(self):
        self.queue = list()
    
    def enqueue(self, listoftup):
        """
        Take a list of tuples as parameter, then
        add it to self.queue as a new tuples
        """
        for tup in listoftup:
            self.queue.append(tup)
    
    def dequeue(self):
        """
        remove the first element of self.queue
        and return its value (which it is a tuple for this case)
        """
        temp = self.queue[0]
        self.queue.remove(temp)
        return temp
    
    def sortedtup(self):
        """
        Use this method if we want a priority queue, then
        we have an ascending self.queue
        """
        self.queue.sort(key= lambda sld: sld[-1]) # sld is stand for straight line distance

class Vertex(object):
    def __init__(self, name, color):
        self.name = name
        self.color = color

# Given.
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

# Given h_sld(n). Where sld is stand for straight line distance
# Since N (a.k.a. Bucharest) is the goal state, then hsld(N) = 0
Adj[A] = [(B, 329), (C, 374), (D, 380), (F, 253)]
Adj[B] = [(E, 244), (A, 366)]
Adj[C] = [(A, 366), (D, 380)]
Adj[D] = [(C, 374), (F, 253)]
Adj[E] = [(G, 241), (B, 329)]
Adj[F] = [(D, 380), (A, 366), (H, 193), (I, 176)]
Adj[G] = [(J, 242), (E, 244)]
Adj[H] = [(K, 160), (F, 253)]
Adj[I] = [(F, 253), (N, 0)]
Adj[J] = [(K, 160), (G, 241)]
Adj[K] = [(J, 242), (L, 100)]
Adj[L] = [(K, 160), (N, 0)]
Adj[M] = [(N, 0)]
Adj[N] = [(I, 176), (L, 100), (O, 80)]
Adj[O] = [(N, 0), (S, 151), (P, 199)]
Adj[P] = [(O, 80), (Q, 226)]
Adj[Q] = [(R, 234), (P, 199)]
Adj[R] = [(Q, 226)]
Adj[S] = [(O, 80), (T, 161)]
Adj[T] = [(S, 151)]

vertexs = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T]

def addtup(sttup, ndtup):
    """
    Take two tuple as its parameter, where the different
    length of both tuples is allowed, then return a list of
    a tuple. How this function
    work is as follows: sttup:= 4A, ndtup:= 5B, then
    it will return 4A + 5B or 9 A-B. In this case,
    it will return [(A, B, 9)]
    """
    if sttup == ndtup:
        return list(sttup)
    sumtup = [sttup[:-1] + ndtup[:-1] + (sttup[-1] + ndtup[-1],)]
    return sumtup # it is a list of a tuple

def minadj(lsttup):
    """
    Taka a list of tuple as its parameter, then return
    an adjacency which it is not visited/explored/black
    with minimum weight / cost.
    """
    templist = []
    for tup in lsttup:
        if tup[0].color == "white":
            templist.append(tup)
    templist.sort(key= lambda sld: sld[-1])
    choosenadj = templist[0]
    return choosenadj # it is a tuple

def greedysearch(vertices, hsld, goal):
    Goal = Queue()
    Q = Queue()
    node = (vertices, hsld)
    Q.enqueue([node])
    while Q.queue != []:
        Q.sortedtup()
        node = Q.dequeue()
        try:
            if node[-2].name == goal.name:
                Goal.enqueue([node])
            else:
                node[-2].color = "black"
                minsldnode = minadj(Adj[node[-2]])
                descendant = addtup(node, minsldnode)
                Q.enqueue(descendant)
        except(Exception):
            print(f"path : {[q.name for q in node[:-1]]}")
            print(f"cost : {node[-1]}")
            print("")
            print("DEADEND.") # We have endless loop or a deadend
    return Goal.queue

sol = greedysearch(A, 366, N)
# print(sol)
for qitems in sol:
    print(f"path : {[q.name for q in qitems[:-1]]}")
    print(f"cost : {qitems[-1]}")
    print("")
