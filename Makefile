# Minimal makefile for Doxygen documentation
#

# You can set these variables from the command line.
SOURCEDIR     = ./docsrc
BUILDDIR      = _build
REPOS         = repos_for_Dox


.PHONY: Makefile clean

clean:
	rm -rf ./docs ./cloudFPGA 

clone_local_cfdk_repo:
	git -C '${REPOS}/cFp_Zoo'       pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_Zoo.git          ${REPOS}/cFp_Zoo
	git -C '${REPOS}/cFDK'          pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git         ${REPOS}/cFDK
	git -C '${REPOS}/cFp_HelloKale' pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_HelloKale.git    ${REPOS}/cFp_HelloKale
	git -C '${REPOS}/cFp_Triangle'  pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git ${REPOS}/cFp_Triangle

doxygen:
	doxygen Doxyfile

localhtml: clone_local_cfdk_repo doxygen



