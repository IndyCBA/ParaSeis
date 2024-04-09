EXT         =    ../ext
CC          =    mpicc
F77         =    mpif77
F90         =    mpif90
MPIF77      =    mpif90
FLINKER     =    mpif90
OPTFLAGS    =    -O2 -L${EXT}/lib
OPTFLAGS    =    -O2 -L${EXT}/lib
AR          =     ar rv

CFLAGS    = -O2 -I../include
FFLAGS    = $(OPTFLAGS) -fallow-argument-mismatch

# LIB_BLAS = -qmkl-ilp64=parallel -lmkl_scalapack_ilp64 -lmkl_blacs_openmpi_ilp64
# LIB_BLAS =
LIB_METIS = -lmetis

LIB_FEPG     = ${EXT}/lib/libfepg.a
LIB_FEPGSOLV = ${EXT}/lib/libfepgsolv.a

# LIB_LAPACK = -llapack

LIB_MATH  = -lm

LIBS      = $(LIB_BLAS) $(LIB_FEPG) $(LIB_LAPACK) $(LIB_METIS) $(LIB_FEPGSOLV) $(LIB_LINUX)
LDFLAGS   = -mkl=parallel

COBJ   = incore.o mazsendpart.o mazrecvpart.o msazrecvpart.o\
         timer.o inimpi.o intcommu.o realcommu.o 
FOBJ   = ddm.o esddm.o mstart.o mbft.o nuc8g2.o agq4.o alq4.o mgather.o 

default: ddm

ddm:${COBJ} ${FOBJ}
	$(FLINKER) -o $@ $(FOBJ) $(COBJ) $(LIBS) $(LIB_MATH) $(LDFLAGS)

move: ddm 
	mv ddm ddm.default
cp: ddm 
.c.o:
	$(CC)  $(CFLAGS) -c $*.c
.F.o:
	$(F90) $(FFLAGS) -c $*.F
.f.o:
	$(MPIF77) $(FFLAGS) -c $*.f
clall:
	/bin/rm -f   *.o ddm.o ddm ddm.default
clean:
	/bin/rm -f   *.o
