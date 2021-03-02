"""
Created : October 31th, 2020
Title   : Implementation of Counting Sort Algorithm in Python3 Programming Language
Author  : Muhammad Reza Fahlevi
Source  : Cormen, Thomas H.; Leiserson, Charles E.; Rivest, Ronald L.; Stein, Clifford (2009), "8.2 Counting Sort", Introduction to Algorithms (3rd ed.), MIT Press.
"""

#%%
from numpy import random

def counting_sort(input_array):
    """
    input_array : the array that we want to sorted
    working_storage : it is an array, and it will be used as a temporary working storage
    sorted_array : it is a sorted array of the input_array in ascending order
    """
    sorted_array = [0 for items in range(len(input_array))]
    k = max(input_array)
    working_storage = []
    for iteration in range(k + 1):
        working_storage.append(0)
    for inspect in range(len(input_array)):
        working_storage[input_array[inspect]] = working_storage[input_array[inspect]] + 1
    for scanning in range(1, k + 1):
        working_storage[scanning] = working_storage[scanning] + working_storage[scanning - 1]
    # uncomment one line below if we want to know the initial working_storage after scanning
    # print(f"working_storage : {working_storage}")
    for correct_place in range(len(input_array) - 1, -1, -1):
        sorted_array[working_storage[input_array[correct_place]] - 1] = input_array[correct_place]
        working_storage[input_array[correct_place]] -= 1
        # uncomment one line below if we want to know the proccess
        # print(f"{correct_place} iteration of the loop : {sorted_array}")
    return sorted_array

# %%
def main():
    # array = []
    # for i in range(500):
    #     array.append(random.randint(1000001))
    array = [2, 5, 3, 0, 2, 3, 0, 3]
    print(f"array : \n{array}")
    print(f"array (sorted) : \n{counting_sort(array)}")
#%%
if __name__ == "__main__":
    main()