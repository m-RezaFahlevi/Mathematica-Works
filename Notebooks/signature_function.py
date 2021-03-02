"""
Author		 : Muhammad Reza Fahlevi
Dated		  : January 12th, 2021
Affiliation	: Departemen Ilmu Komputer,
				 Fakultas Ilmu Komputer - Teknologi Informasi, 
				 Universitas Sumatera Utara, Medan, Indonesia 
"""

# %%
print("initialized")

def sigma(n_of_outputs):
	sigm = dict() 
		
	for i in range(1, n_of_outputs + 1):
		sigm[i] = int(input(f"sigma[{i}]: ")) 
	
	return sigm

def signature(lsigma):
	sign_val = 1
	s = len(lsigma)
	
	while s >= 1:
		for r in range(1, s):
			sign_val *= (lsigma[s] - lsigma[r]) / (s - r) 
		s -= 1
	
	return sign_val

# %%
def main():
	number_of_input = int(input("How many input : ")) 
	
	sig = sigma(number_of_input)
	results = signature(sig)
	print(f"signature value : {results}")

# %%
if __name__ == "__main__":
	main() 