all: ex_c

ex_c: ex_c.o diskio.o pff.o
	gcc -o ex_c ex_c.o diskio.o pff.o

diskio.o: diskio.c
	gcc -c diskio.c -Wall -I.

pff.o: pff.c
	gcc -c pff.c -Wall -I.

ex_c.o: ex_c.c
	gcc -c ex_c.c -Wall -I.

clean:
	rm ex_c
	rm *.o

