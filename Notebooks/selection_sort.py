#%%
from numpy import random
print("Initiliazed")

#%%
def selection_sort(array):
    selected = []
    array_length = len(array)
    while array_length > 0 :
        the_choosen_one = min(array)
        selected.append(the_choosen_one)
        array_length -= 1
        array.remove(the_choosen_one)
    return selected

#%%
def main():
    number = []
    for iteration in range(200):
        number.append(random.randint(100))
    print(f"array : \n{number} \n\narray (sorted) : \n{selection_sort(number)}")

# %%
if __name__ == "__main__":
    main()
# %%
