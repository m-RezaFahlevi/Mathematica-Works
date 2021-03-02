"""
Author		 : Muhammad Reza Fahlevi
Dated		  : January 12th, 2021
Affiliation	: Departemen Ilmu Komputer,
				 Fakultas Ilmu Komputer - Teknologi Informasi, 
				 Universitas Sumatera Utara, Medan, Indonesia 
"""

def disarium(nahlen) :
	strbit = str(nahlen)
	NDIGITS = len(strbit) 
	ptemp = [int([sbit for sbit in strbit][i]) ** (i + 1) for i in range(NDIGITS)]
	ids = 0
	for i in range(NDIGITS) :
		ids += ptemp[i]
	return ids

MAX = 9999
print(f"Disarium number between 1 to {MAX} \n{[i + 1 for i in range(MAX + 1) if i + 1 == disarium(i + 1)]}") 