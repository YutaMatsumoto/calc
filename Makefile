CC	= cc
LEX	= flex
YACC	= bison
# LIBS	= -L/usr/local/lib -lfl 
# LIBS 	= -L/usr/lib/x86_64-linux-gnu -lfl
LIBS 	= -L ./flex-2.5.37 -lfl

OBJS	= lex.yy.o calc.tab.o
TESTOBJS	= driver.o lex.yy.o

calc: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

driver: driver.c lex.yy.o 
	$(CC) -o driver $^ $(LIBS)


testscan: $(TESTOBJS) calc.tab.h
	$(CC) -o $@ $(TESTOBJS) $(LIBS)

# calc.tab.c: calc.y
	# $(YACC) -d $<

# lex.yy.c: calc.lex calc.tab.c
lex.yy.c: calc.lex
	$(LEX) $<

clean:
	-rm -f lex.yy.* *.o calc driver testscan *~

.SUFFIXES: .c .o

.c.o:
	$(CC) -c $< -o $@
