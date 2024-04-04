include Makefile.in

AR              = ar
CC              = mpicc
FC              = mpif90
RNLIB           = ranlib
CFORT           = -Dappend_
FFLAGS          = -O2 -fallow-argument-mismatch
CFLAGS          = -O2 ${CFORT} -DAZ_mpi -I../include

# Aztec source code

FEPG_FSRC = charcommu.f intcommu.f realcommu.f fepglib.f inimpi.f switch.f timer.f partimain.f partcoor.f resultcommu.f psolvsub.f part_lm_main.f 

FEPG_CSRC = superlumain.c pmetis.c qsort.c subtime.c

SRC_F = ${FEPG_FSRC}
SRC_C = ${FEPG_CSRC}

OBJ = 	${SRC_C:.c=.o} ${SRC_F:.f=.o}

all: fepg


#####################################
# Define implicit compilation rules #
#####################################

%.o:%.f
	${FC} ${FFLAGS} -c $< ${MPI_INCLUDE_DIR}
%.o:%.c
	${CC} ${CFLAGS} -c $<

# solver library

fepg: ${OBJ}
	@echo "Building library ${TARGET}"
	/bin/rm -f libfepg.a
	${AR} ruv libfepg.a ${OBJ}
	${RNLIB} libfepg.a

clean:
	@echo "cleaning ..."
	/bin/rm -f *.o

realclean:
	@echo "real cleaning ..."
	/bin/rm -f *.o *.a
