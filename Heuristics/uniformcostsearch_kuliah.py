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
        self.queue.sort(key= lambda cost: cost[-1])

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
    templist.sort(key= lambda weigth: weigth[-1])
    choosenadj = templist[0]
    return choosenadj # it is a tuple

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

vertexs = [A, B, C, D, E]

# uncomment line 109 to 134 to see the demonstration
"""
# Q is a priority queue
Q = Queue() # it should be contained the list of tuples

Q.enqueue(Adj[A]); A.color = "black"
Q.sortedtup()
print([(q[0].name, q[1]) for q in Q.queue])

temp = Q.dequeue()
tempvertex = temp[0]
print(tempvertex.name, temp[1])

minvertex = minadj(Adj[tempvertex])
print(minvertex[0].name, minvertex[1])

res = addtup(temp, minvertex)[0]
restup = addtup(temp, minvertex)
print(restup)
print([q.name for q in res[:-1]], res[-1])

print("")
print([(q[0].name, q[1]) for q in Q.queue])
Q.enqueue(restup)
Q.sortedtup()
print(Q.queue)
"""
# uncomment this loop
# for qitems in Q.queue:
#     print([q.name for q in qitems[:-1]], qitems[-1])
# in def ucsearch to print the queue for each phase
def ucsearch(vertices, goal):
    Goal = Queue()
    Q = Queue() # Goal and Q is a priority queue
    
    node = (vertices, 0)
    Q.enqueue([node]) # return [(vertices, 0)]
    # for qitems in Q.queue:
    #         print([q.name for q in qitems[:-1]], qitems[-1])
    while Q.queue != []:
        Q.sortedtup()
        node = Q.dequeue() # return a tuple
        if node[-2].name == goal.name:
            Goal.enqueue([node])
        else:
            node[-2].color = "black"
            for vertex in Adj[node[-2]]:
                if vertex[0].color == "white":
                    descendant = addtup(node, vertex)
                    Q.enqueue(descendant)
            # for qitems in Q.queue:
            #     print([q.name for q in qitems[:-1]], qitems[-1], end=" ")
            # print("")
    return Goal.queue

sol = ucsearch(S, K)
# print(sol)
for qitems in sol:
    print(f"path : {[q.name for q in qitems[:-1]]}")
    print(f"cost : {qitems[-1]}")
    print("")
# print(B.name)
