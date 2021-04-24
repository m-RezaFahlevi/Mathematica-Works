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
    def __init__(self, name, distance, visited, predecessor):
        self.name = name
        self.distance = distance
        self.visited = visited
        self.predecessor = predecessor

S = Vertex("S", float("inf"), "white", None)
T = Vertex("T", float("inf"), "white", None)
X = Vertex("X", float("inf"), "white", None)
Y = Vertex("Y", float("inf"), "white", None)
Z = Vertex("Z", float("inf"), "white", None)

Adj[S] = [(T, 10), (Y, 5)]
Adj[T] = [(X, 1), (Y, 2)]
Adj[X] = [(Z, 4)]
Adj[Y] = [(T, 3), (X, 9), (Z, 2)]
Adj[Z] = [(S, 7), (X, 6)]

vertices = [S, T, X, Y, Z]

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

djikstra(vertices, S)
sol = disppath(S, X) # sol stand for solution
print([s for s in sol], f"cost: {X.distance}")
