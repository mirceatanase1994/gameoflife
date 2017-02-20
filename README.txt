				Readme Tema 1
			Algoritmi Paraleli si Distribuiti
			     	1 - 11 - 2016

	Partea 1
	Implementarea algoritmului care modeleaza automatul celular am folosit,
asa cum era specificat in indicatii, doua zone de memorie, pentru 2 matrici.
Intr-una (a) salvam matricea inainte de iteratia i, iar in cealalta (temp),
calculam noua matrice folosind formula indicata in enunt. Apoi, copiem 
elementele matricii temp in matricea a.
	Pas cu pas, algoritmul arata astfel:
	-citirea dimensiunilor matricii
	-alocarea celor 2 matrici
	-citirea starii initiale
	-pentru fiecare iteratie
		-bordeaza matricea
		-pentru fiecare element
			-calculeaza suma vecinilor (numarul de vecini alive)
			-calculeaza noua valoare si stocheaza in pozitia 
			 corespunzatoare din matricea temp
		-copiaza matricea temp in matricea a, element cu element
	-afiseaza matricea in fisierul de output, element cu element

	Partea 2
	Am paralelizat portiuni ale algoritmului de la partea 1,
folosind directiva pragma omp parallel for si acolo unde a fost cazul,
clauza private:
		-alocarea matricilor
		-bordarea matricilor
		-buclele imbricate for in care se recalculeaza fiecare 
		 element (cu mentiunea ca variabilele l si alive 
		 vor fi private pentru fiecare thread)
		-copierea element cu element a matricii

 	Partea 3
	Am rulat programul pe fep.grid.pub.ro pentru 1000 de iteratii si
o matrice initiala cu dimensiunile 1000x1000, generata aleatoriu folosind
programul care ne-a fost indicat pe forum, pe care l-am inclus de 
asemenea in aceasta arhiva.
	Scriptul pe care l-am folosit este urmatorul:
#!/bin/bash
>&2 echo "Serial:"
time ./g_serial $1 $2 $3
>&2 echo "Paralel pe 1 thread:"
export OMP_NUM_THREADS=1
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 2 threaduri:"
export OMP_NUM_THREADS=2
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 4 threaduri:"
export OMP_NUM_THREADS=4
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 8 threaduri:"
export OMP_NUM_THREADS=8
time ./g_omp $1 $2 $3
	Outputul scriptului este prezentat in fisierul rezultate.png,
prezent in arhiva, iar rezultatele si graficul se afla in fisierul
results.xlsx. Se observa ca scaderea e exponentiala la fiecare pas
(datorita cresterii exponentiale a numarului de core-uri).
	Mentionez faptul ca valorile alese pentru dimensiunile matricei
si numarul de iteratii sunt destul de mari, deoarece pe dimensiuni mai 
mici speedup-ul nu era atat de evident. De asemenea, atasez matricea 
pe care am testat programul pe fep in fisierul in.txt

	Tanase Mircea Adrian, 335CB
