SPACK_REPO="git@github.com:spack/spack.git"
SPACK_TAG="v0.21.2"

SPACK_INSTALL_DIR="spack"

cd spack-env

if [ ! -d ${SPACK_INSTALL_DIR} ]; then
	git clone ${SPACK_REPO} ${SPACK_INSTALL_DIR}
	cd spack
	git checkout ${SPACK_TAG}
	git pull
	cd ..
fi

source spack/share/spack/setup-env.sh

COMPILER_MODULES="gcc"
module purge
module load ${COMPILER_MODULES}
spack compiler find --scope=user
module purge

spack env activate .
spack concretize -f -j 8
spack install --fresh -v -y
spack module tcl refresh -y --delete-tree
spack env deactivate

