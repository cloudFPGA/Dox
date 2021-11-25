# Minimal makefile for Doxygen documentation
#

# You can set these variables from the command line.
SOURCEDIR     = ./docsrc
BUILDDIR      = _build
REPOS         = repos_for_Dox


.PHONY: Makefile clean

clean:
	rm -rf ./docs ./${REPOS} Doxyfile custom doxygen-awesome-css images

clone_local_cfdk_repo:
	git -C '${REPOS}/Dox'           pull || git clone --depth=1 -b master --single-branch --recursive git@github.com:cloudFPGA/Dox.git  ${REPOS}/Dox
	cd ${REPOS}/Dox/doxygen-awesome-css && git checkout v1.6.1
	git -C '${REPOS}/cFp_Zoo'       pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_Zoo.git               		${REPOS}/cFp_Zoo
	git -C '${REPOS}/cFDK'          pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git         		${REPOS}/cFDK
	git -C '${REPOS}/cFp_HelloKale' pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_HelloKale.git    		${REPOS}/cFp_HelloKale
	git -C '${REPOS}/cFp_Triangle'  pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git 		${REPOS}/cFp_Triangle


mv_dox_from_githubcom:
	rsync -arv --exclude=.git --exclude=.gitmodules --exclude=.gitignore --exclude=README.md --exclude=Makefile repos_for_Dox/Dox/ ./

doxygen:
	doxygen Doxyfile

localhtml: clone_local_cfdk_repo mv_dox_from_githubcom doxygen



