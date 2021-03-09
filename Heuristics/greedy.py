# from no modules import no class

Adj = dict()
Weight = dict()

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
    def __init__(node, name, color, cost, predecessor):
        node.name = name
        node.color = color
        node.cost = cost
        node.predecessor = predecessor

A = Vertex("Sibiu", "white", float("inf"), None)
B = Vertex("Fagaras", "white", float("inf"), None)
C = Vertex("Rimnicu Vilcea", "white", float("inf"), None)
D = Vertex("Pitesti", "white", float("inf"), None)
E = Vertex("Bucharest", "white", float("inf"), None)

vertexs = [A, B, C, D, E]

Adj[A] = [B, C]
Adj[B] = [A, E]
Adj[C] = [A, D]
Adj[D] = [C, E]
Adj[E] = [B, D]

Weight[A] = [99, 80]
Weight[B] = [99, 211]
Weight[C] = [80, 97]
Weight[D] = [97, 101]
Weight[E] = [211, 101]

# Q = Queue()
# Q.enqueue(A)
# Q.enqueue(B)
# print([q.cost for q in Q.queue])

def greedy(vertex, goal):
    path = list([vertex])
    temp = vertex
    temp.color = "gray"
    Q = Queue()
    while Q.queue != []:
        for adjency in Adj[temp]:
            adjency.predecessor = temp
            Q.enqueue(adjency)
        mincost = min([q.cost for q in Q.queue])
        idx = Weight[temp].index(mincost)
    return path

# print(greedy(A, D))
print([p.name for p in greedy(A, E)])