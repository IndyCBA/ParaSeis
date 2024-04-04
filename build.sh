#!/bin/sh
set -e

if [ "${CLEAN_BUILD}" = "1" ]; then
	rm -rf ext/lib/libfepg*.a
	cd ext/fepg
	make realclean
	cd ../fepgsolv
	make realclean
	cd ../../src
	make clall
	cd ..
fi

module purge
module load gcc openmpi
export CC=mpicc CXX=mpicxx FC=mpif90 F77=mpif77 F90=mpif90

module use spack-env/modules
module load amdblis  amdlibflame metis superlu-dist

cd ext/fepg
make
mv libfepg.a ../lib

cd ../fepgsolv
make
mv libfepgsolv.a ../lib
cd ../..

cd src
make

module purge
module unuse spack-env/modules

