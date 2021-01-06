CC=gcc
AR=ar
CFLAGS=-Wall -g
PHONY=all clean
PROGS=maind mains

.PHONY: $(PHONY)

all: mains maind

#rule for executable creation using static library
mains: main.o libmyMath.a
	$(CC) $(CFLAGS) -o mains main.o libmyMath.a

#rule for executable creation using shared library
maind: main.o libmyMath.so
	$(CC) $(CFLAGS) -o maind main.o ./libmyMath.so

#rule for static library creation
mymaths: libmyMath.a

#create static library (.a)
libmyMath.a: basicMath.o power.o
	$(AR) -rcs libmyMath.a basicMath.o power.o

#rule for shared library creation
mymathd: libmyMath.so

#create shared library (.so)
libmyMath.so: basicMath.o power.o
	$(CC) -shared -o libmyMath.so basicMath.o power.o

main.o: main.c myMath.h
	$(CC) $(CFLAGS) -c main.c

basicMath.o: myMath.h basicMath.c
	$(CC) $(CFLAGS) -c basicMath.c

power.o: myMath.h power.c
	$(CC) $(CFLAGS) -c power.c

mymaths: libmyMath.a

libmyMath.a: basicMath.c power.c

clean:
	rm -f *.o *.so *.a $(PROGS)