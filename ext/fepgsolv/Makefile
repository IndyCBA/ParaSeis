AR              = ar
CC              = mpicc
FC              = mpif90
RNLIB           = ranlib
CFORT           = -Dappend_
FFLAGS          = -O2 -fallow-argument-mismatch
CFLAGS          = -O2 ${CFORT} -DAZ_MPI -I../include

BLAS          = blas1.f  blas2.f blas3.f xerbla.f lsame.f
TIMER         = md_timer_sun.c
COMMUNICATION = md_wrap_mpi_c.c

# Aztec source code

AZ_SRC = az_bilu.c              az_cg.c		        az_cgs.c           \
         az_cgstab.c            az_check.c              az_comm.c          \
         az_converge.c          az_dd_overlap.c         az_dgemv2.c        \
         az_dgemv3.c            az_domain_decomp.c      az_fortran_wrap.c  \
         az_scaling.c           az_flop_cnt.c           az_gmres.c         \
         az_gmresr.c            az_ilu_util.c           az_ilut.c          \
         az_interface.c         az_lu_y12.c             az_matrix_util.c   \
         az_matvec_mult.c       az_old_matvec_mult.c    az_pad_utils.c     \
         az_poly.c              az_precond.c            az_qmrcgs.c        \
         az_rilu.c              az_solve.c              az_sort.c          \
         az_subdomain_solver.c  az_tools.c              az_util.c          \
         az_icc.c 		az_fix_pt.c


Y12M =   y12m.f			y12mae.f		y12maf.f \
	 y12mbe.f 		y12mbf.f 		y12mce.f \
	 y12mcf.f		y12mde.f		y12mdf.f \
	 y12mfe.f		y12mge.f		y12mhe.f \
	 y12cck.f


LA_SRC = la_dgetrf.f		la_dgetri.f		la_ilaenv.f \
	 la_dgetf2.f		la_dlaswp.f		la_dtrtri.f \
	 la_dtrti2.f		la_dgetrs.f		la_dgeco.f \
	 la_dgedi.f		la_dgefa.f		la_dpotf2.f \
	 la_dpotrf.f		la_dlamch.f		la_dlaic1.f \
	 la_ieeeck.f

SRC_F = $(LA_SRC) $(Y12M)  $(BLAS) az_reorder.f
SRC_C = $(AZ_SRC) $(TIMER) $(COMMUNICATION)

OBJ = 	$(SRC_C:.c=.o) $(SRC_F:.f=.o)

all: fepgsolv


#####################################
# Define implicit compilation rules #
#####################################

#%.o:%.f
#	$(FC) $(FFLAGS) -c $<
#%.o:%.c
#	$(CC) $(CFLAGS) -c $<

# solver library

fepgsolv: $(OBJ)
	@echo "Building library $(TARGET)"
	@rm -f libfepgsolv.a
	$(AR) ruv libfepgsolv.a $(OBJ)
	$(RNLIB) libfepgsolv.a

clean:
	@echo "cleaning ..."
	/bin/rm -f *.o

realclean:
	@echo "real cleaning ..."
	/bin/rm -f *.o *.a 
