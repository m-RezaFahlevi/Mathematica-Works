# %%
from numpy import random

print("Initialized")

tracking = []
matrix_a = [[1, 9, 4],
            [13, 42, 32],
            [31, 52, 82]]


def factorial(nats):
    fact_nats = 1 if nats == 0 or nats == 1 else nats * factorial(nats - 1)
    return fact_nats


def sigma(n_of_output):
    sigm = dict()

    for i in range(1, n_of_output + 1):
        sigm[i] = int(input(f"sigma[{i}] : "))

    return sigm


def signature(lsigma):
    sign = 1
    s = len(lsigma)

    while s >= 1:
        for r in range(1, s):
            sign = sign * ((lsigma[s] - lsigma[r]) / (s - r))
        s -= 1

    return sign


def rearrangement(n_of_elements, epochs):
    arrangement = []
    temp = 0

    while len(arrangement) != n_of_elements:
        for iteration in range(epochs):
            temp = random.randint(n_of_elements)
            if temp not in arrangement:
                arrangement.append(temp)

    return arrangement


# %%
def main():
    # number_of_input = int(input("How many input : "))
    # sig = sigma(number_of_input)
    # sign_val = signature(sig)
    # print(f"signature : {sign_val}")

    nelements = 4
    permutation_group = []

    while len(tracking) != factorial(nelements):
        permutation = rearrangement(nelements, epochs=10)
        if permutation not in tracking:
            tracking.append(permutation)

    permutation_group.extend(tracking)

    print(len(permutation_group))
    print(permutation_group)

    # initialization
    sig = dict()
    # det = 0
    # prod = 1

    for group in range(factorial(nelements)):
        for idex in range(nelements):
            permutation_group[group][idex] = permutation_group[group][idex] + 1
            sig[idex + 1] = permutation_group[group][idex]
        sign_val = signature(sig)
        print(sig.values())
        print(f"signature: {sign_val}\n")


# %%
if __name__ == "__main__":
    main()
    tracking = []
 # %%
