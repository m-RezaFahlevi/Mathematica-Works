"""
Author		 : Muhammad Reza Fahlevi
Dated		  : February 14th, 2021
Affiliation	: Departemen Ilmu Komputer,
				 Fakultas Ilmu Komputer - Teknologi Informasi, 
				 Universitas Sumatera Utara, Medan, Indonesia 
"""

factorial = lambda n : 1 if n == 0 or n == 1 else n * factorial(n - 1)
comb = lambda n, r : factorial(n) / (factorial(r) * factorial(n - r)) 
binom = lambda x, n, p : comb(n, x) * (p ** x) *((1 - p) ** (n - x))
hypergeometric = lambda x, N, n, k : comb(k, x) * comb(N - k, n - x) / comb(N, n)  

xrand = int(input("x : "))
Nlot = int(input("N : "))
nlot = int(input("n :"))
kavail = int(input("k :"))

print(f"h(x = {xrand}; {Nlot}, {nlot}, {kavail}) = {hypergeometric(xrand, Nlot, nlot, kavail)}")

meanterm = nlot * kavail / Nlot
correctionfactor = (Nlot - nlot) / (Nlot - 1)
qterm = 1 - (kavail / Nlot)

variance = correctionfactor * meanterm * qterm

print(f"E(X) = {meanterm}")
print(f"Var(X) = {variance}")