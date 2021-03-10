"""
Author      :   Muhammad Reza Fahlevi
Dated       :   March 11th, 2021
Affiliation :   Departemen Ilmu Komputer,
                Fakultas Ilmu Komputer - Teknologi Informasi,
                Universitas Sumatera Utara, Indonesia
References  :   Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein - Introduction to Algorithms-MIT Press (2009).
                Benjamin Baka. Python Data Structures and Algorithms. 2017. Packt Publishing.
                https://docs.python.org/3.8/tutorial/index.html
"""

Adj = dict()

class Queue(object):
    def __init__(self):
        self.queue = []
    
    def enqueue(self, nodes):
        self.queue.append(nodes)
    
    def dequeue(self):
        temp = self.queue[0]
        self.queue.remove(temp)
        return temp

class Vertex(object):
    def __init__(node, name, color, distance, predecessor):
        node.name = name
        node.color = color
        node.distance = distance
        node.predecessor = predecessor

A = Vertex("A", "white", float("inf"), None)
B = Vertex("B", "white", float("inf"), None)
C = Vertex("C", "white", float("inf"), None)
D = Vertex("D", "white", float("inf"), None)
E = Vertex("E", "white", float("inf"), None)
F = Vertex("F", "white", float("inf"), None)
G = Vertex("G", "white", float("inf"), None)
S = Vertex("S", "white", float("inf"), None)
K = Vertex("K", "white", float("inf"), None)
Z = Vertex("Z", "white", float("inf"), None)

Adj[A] = [B, E, F, S]
Adj[B] = [A, D, S]
Adj[C] = [D, S]
Adj[D] = [B, C, E, K]
Adj[E] = [A, D, F, Z]
Adj[F] = [A, E, G]
Adj[G] = [F, Z]
Adj[S] = [A, B, C]
Adj[K] = [D, Z]
Adj[Z] = [E, G, K]

vertexs = [A, B, C, D, E, F, G, S, K, Z]

def resetattr(objects):
    objects.color = "white"
    objects.distance = float("inf")
    objects.predecessor = None

def restart(graph):
    [resetattr(v) for v in graph]

def bfsearch(vertex, goal):
    vertex.color = "gray"
    vertex.distance = 0
    vertex.predecessor = None
    Q = Queue()
    Q.enqueue(vertex)
    while Q.queue != []:
        udeq = Q.dequeue()
        for adj in Adj[udeq]:
            if adj.color == "white":
                adj.color = "gray"
                adj.distance = udeq.distance + 1
                adj.predecessor = udeq
                Q.enqueue(adj)
        udeq.color = "black"
    return goal.distance

restart(vertexs)
print(bfsearch(S, K))

def disppath(start, goal, path = list()):
    if start == goal:
        path.append(goal.name)
    elif goal.predecessor == None:
        print(f"No path from {start.name} to {goal.name} exists")
    else:
        disppath(start, goal.predecessor)
        path.append(goal.name)
    return path

print(disppath(S, K))