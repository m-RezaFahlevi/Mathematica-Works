# %%
from numpy import random
print("initialized")

# %%
def insertion_sort(A):
    for j in range(1, len(A)):
        key = A[j]
        i = j - 1 # Insert A[j] into the sorted sequence A[1..j-1]
        while i >= 0 and A[i] > key:
            A[i + 1] = A[i]
            i -= 1
        A[i + 1] = key
    
    return A

# %%
def linear_search(A, items):
    found = False
    index = []
    for scan in range(len(A)):
        if A[scan] == items:
            found = True
            index.append(scan)
    results = index if found else index

    return results

# %%
def main():
    nats = random.randint(low = 1, high = 51, size = 50, dtype = int)
    print(f"Before sorted : \n{nats}")

    nats = insertion_sort(nats)
    print(f"Sorted: \n{nats}")
    print(linear_search(nats, 32))

# %%
if __name__ == "__main__":
    main()

# %%
