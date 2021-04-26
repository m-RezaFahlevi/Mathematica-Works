"""
Author      :   Muhammad Reza Fahlevi
Dated       :   April 24th, 2021
Affiliation :   Departemen Ilmu Komputer,
                Fakultas Ilmu Komputer - Teknologi Informasi,
                Universitas Sumatera Utara, Indonesia
References  :   Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein - Introduction to Algorithms-MIT Press (2009).
                Benjamin Baka. Python Data Structures and Algorithms. 2017. Packt Publishing.
                https://docs.python.org/3.8/tutorial/index.html
"""

# from no module import no class

Adj = dict()

class Queue(object):
    def __init__(self):
        self.queue = list()
    
    def enqueue(self, node):
        self.queue.append(node)
    
    def dequeue(self):
        temp = self.queue[0]
        self.queue.remove(temp)
        return temp
    
    def sorteq(self):
        self.queue.sort(key= lambda node: node.distance)

class Vertex(object):
    def __init__(self, name, distance, predecessor):
        self.name = name
        self.distance = distance
        self.predecessor = predecessor

A = Vertex("A", float("inf"), None)
B = Vertex("B", float("inf"), None)
C = Vertex("C", float("inf"), None)
D = Vertex("D", float("inf"), None)
E = Vertex("E", float("inf"), None)
F = Vertex("F", float("inf"), None)
G = Vertex("G", float("inf"), None)

Adj[A] = [(B, 3), (C, 2), (E, 8)]
Adj[B] = [(A, 3), (C, 5), (D, 4)]
Adj[C] = [(A, 2), (B, 5), (D, 3), (E, 7)]
Adj[D] = [(B, 4), (C, 3), (E, 1), (F, 1), (G, 9)]
Adj[E] = [(A, 8), (C, 7), (D, 1), (G, 4)]
Adj[F] = [(D, 1), (G, 3)]
Adj[G] = [(E, 4), (D, 9), (F, 3)]

vertices = [A, B, C, D, E, F, G]

def relax(unode, vnode, weight):
    temp = unode.distance + weight
    if vnode.distance > temp:
        vnode.distance = temp
        vnode.predecessor = unode

# uncomment print([(q.name, q.distance) for q in Q.queue])
# to see Q.queue for each phase
def djikstra(vert, start):
    start.distance = 0
    s = []
    Q = Queue()
    [Q.enqueue(node) for node in vert]
    while Q.queue != []:
        Q.sorteq()
        # print([(q.name, q.distance) for q in Q.queue])
        minnode = Q.dequeue()
        s.append(minnode)
        for adjnode in Adj[minnode]:
            relax(minnode, adjnode[0], adjnode[1])

def disppath(start, goal, path = list()):
    if start == goal:
        path.append(goal.name)
    elif goal.predecessor == None:
        print(f"No path from {start.name} to {goal.name} exists")
    else:
        disppath(start, goal.predecessor)
        path.append(goal.name)
    return path

djikstra(vertices, A)
sol = disppath(A, G) # sol stand for solution
print([s for s in sol], f"cost: {G.distance}")
