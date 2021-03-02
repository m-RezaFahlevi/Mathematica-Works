"""
Author		 : Muhammad Reza Fahlevi
Dated		  : January 12th, 2021
Affiliation	: Departemen Ilmu Komputer,
				 Fakultas Ilmu Komputer - Teknologi Informasi, 
				 Universitas Sumatera Utara, Medan, Indonesia 
"""

factorial = lambda n : 1 if n == 0 or n == 1 else n * factorial(n - 1)
comb = lambda n, r : factorial(n) / (factorial(r) * factorial(n - r)) 
binom = lambda x, n, p : comb(n, x) * (p ** x) *((1 - p) ** (n - x))
hypergeometric = lambda x, N, n, k : comb(k, x) * comb(N - k, n - x) / comb(N, n)  

def binomtable(ntrial, psuccess) :
	N = ntrial
	P = psuccess 
	for xval in range(N + 1):
		print(f"b({xval};{N}, p = {P}) = {binom(xval, N, P)} ")
	return None

def B(r, ntrial, psuccess) :		
	cumulative = 0
	R = r
	for xrandvar in range(R + 1):
		cumulative += binom(xrandvar, ntrial, psuccess)
	return cumulative

def main() :
	inpAtmost = int(input("atmost : ")) 
	inpNtrial = int(input("ntrial : ")) 
	inpProb = float(input("probability p :")) 
	binomtable(inpNtrial, inpProb)
	print(f"B(r = {inpAtmost}; {inpNtrial}, {inpProb}) = {B(inpAtmost, inpNtrial, inpProb)}")

if __name__ == "__main__" :
	main() 