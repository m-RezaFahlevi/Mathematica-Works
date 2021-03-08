# from no fuken modules import no fuken class

Adj = dict()

class Stack(object):
    def __init__(self):
        self.stack = []
    
    def ngestack(self, node):
        self.stack.append(node)
    
    def destack(self):
        temp = self.stack[-1]
        self.stack.remove(temp)
        return temp
    
    def dispstack(self):
        return self.stack

class Vertex(object):
    def __init__(node, name, color, distance, finish, predecessor):
        node.name = name
        node.color = color
        node.distance = distance
        node.finish = finish
        node.predecessor = predecessor

A  = Vertex("A", "white", float("inf"), float("inf"), None)
B  = Vertex("B", "white", float("inf"), float("inf"), None)
C  = Vertex("C", "white", float("inf"), float("inf"), None)
D  = Vertex("D", "white", float("inf"), float("inf"), None)
E  = Vertex("E", "white", float("inf"), float("inf"), None)
F  = Vertex("F", "white", float("inf"), float("inf"), None)
G  = Vertex("G", "white", float("inf"), float("inf"), None)
H  = Vertex("H", "white", float("inf"), float("inf"), None)

Adj[A] = [B, C]
Adj[B] = [A, D]
Adj[C] = [A, E, F]
Adj[D] = [B, E]
Adj[E] = [C, D, F, G]
Adj[F] = [C, E, G, H]
Adj[G] = [E, F]
Adj[H] = [F]

vertexs = [A, B, C, D, E, F, G, H]

time = 0
# S = Stack()
# S.ngestack(A)
# S.ngestack(B)
# S.ngestack(C)
# print([s.name for s in S.dispstack()])
# temp = S.destack()
# print(temp.name)

def dfsearch(graph):
    global time
    # global S
    for nodes in graph:
        if nodes.color == "white":
            # S.ngestack(nodes)
            # print([s.name for s in S.dispstack()])
            dfsvisit(nodes)

def dfsvisit(point):
    global time
    # global S
    time += 1
    point.distance = time
    point.color = "gray"
    for points in Adj[point]:
        if points.color == "white":
            points.predecessor = point
            # S.ngestack(points)
            # print([s.name for s in S.dispstack()])
            dfsvisit(points)
    point.color = "black"
    time += 1
    point.finish = time
    # S.destack()
    # print([s.name for s in S.dispstack()])

def disppath(start, goal, path = list()):
    if start == goal:
        path.append(goal.name)
    elif goal.predecessor == None:
        print(f"No path from {start.name} to {goal.name} exists")
    else:
        disppath(start, goal.predecessor)
        path.append(goal.name)
    return path

dfsearch(vertexs)
print(disppath(A, C))