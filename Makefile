CC=gcc
OBJS= 	blast.o \
	sunzip.o \
	infback9.o \
	inftree9.o \
	zutil.o \


CONTRIBDIR=zlib/contrib/

# gcc -o sunzip blast.o sunzip.o infback9.o inftree9.o -l:libbz2.so.1 -l:libz.so zutil.o

all: sunzip
sunzip: $(OBJS)
	$(CC) -l:libbz2.so.1 -l:libz.so.1 -o $@ $(OBJS) 

blast.o: $(CONTRIBDIR)blast/blast.c
	$(CC) -c -o $@ $(CONTRIBDIR)blast/blast.c

infback9.o: $(CONTRIBDIR)infback9/infback9.c
	$(CC) -c -o $@ $(CONTRIBDIR)infback9/infback9.c

inftree9.o: $(CONTRIBDIR)infback9/inftree9.c
	$(CC) -c -o $@ $(CONTRIBDIR)infback9/inftree9.c

zutil.o: zlib/zutil.c
	$(CC) -c -o $@ zlib/zutil.c

sunzip.o: sunzip.c
	$(CC) -Izlib/contrib/blast/ -Izlib/contrib/infback9 -Ibzip2/ -c -o $@ sunzip.c

clean:
	rm *.o
	rm sunzip
