# %%
def Naive(N):
    is_prime = True
    if N <= 1 :
        is_prime = False
    else:
        for i in range(2, N, 1):
            if N % i == 0:
                is_prime = False
    return(is_prime)

def main():
    N = 139
    print(f"{N} prime ? : {Naive(N)}")

if __name__=="__main__":
    main()
# %%
