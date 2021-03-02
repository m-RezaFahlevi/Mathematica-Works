"""
Author		 : Muhammad Reza Fahlevi
Dated		  : January 12th, 2021
Affiliation	: Departemen Ilmu Komputer,
				 Fakultas Ilmu Komputer - Teknologi Informasi, 
				 Universitas Sumatera Utara, Medan, Indonesia 
"""

import numpy as np

factorial = lambda n : 1 if n == 0 else n * factorial(n - 1)
poisson = lambda x, murate : np.exp(-murate) * (murate ** x) / factorial(x)

def poissontable(r, meanrate) :
	temp = 0
	for xvar in range(r + 1) :
		temp += poisson(xvar, meanrate)
		print(f"p({xvar}; lambda = {meanrate}) = {poisson(xvar, meanrate)}")
	return temp

def main() :
	#xpoisson = int(input("x : "))
	rmost = int(input("atmost : "))
	rate = int(input("lambda_t : "))
	print(f"P({rmost}; {rate}) = {poissontable(rmost, rate)}")

if __name__=="__main__" :
	main() 