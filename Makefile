IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=src
LDIR =./lib

LIBS=-lm

_DEPS = actions.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = sayhello.o main.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

helloworld: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
