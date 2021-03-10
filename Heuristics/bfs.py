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
H = Vertex("H", "white", float("inf"), None)

Adj[A] = [B, C]
Adj[B] = [A, D]
Adj[C] = [A, E, F]
Adj[D] = [B, E]
Adj[E] = [C, D, F, G]
Adj[F] = [C, E, G, H]
Adj[G] = [E, F]
Adj[H] = [F]

vertexs = [A, B, C, D, E, F, G, H]

# Q = Queue()
# Q.enqueue(A)
# Q.enqueue(B)
# temp = Q.dequeue()
# print(temp.color)

def resetattr(objects):
    objects.color = "white"
    objects.distance =  float("inf")
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
        for vertexs in Adj[udeq]:
            if vertexs.color == "white":
                vertexs.color = "gray"
                vertexs.distance = udeq.distance + 1
                vertexs.predecessor = udeq
                Q.enqueue(vertexs)
        udeq.color = "black"
    return goal.distance

restart(vertexs)
bfsearch(A, H) # compute breadth-first-search

def disppath(start, goal, path = list()):
    if start == goal:
        # print(goal.name)
        path.append(goal.name)
    elif goal.predecessor == None:
        print(f"No path from {start.name} to {goal.name} exists")
    else:
        disppath(start, goal.predecessor)
        # print(goal.name)
        path.append(goal.name)
    return path

print(disppath(A, E))