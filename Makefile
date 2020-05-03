# Minimal makefile for Doxygen documentation
#

# You can set these variables from the command line.
SOURCEDIR     = ./docsrc
BUILDDIR      = _build


.PHONY: Makefile clean

clean:
	rm -rf ./docs ./cloudFPGA 

clone_local_cfdk_repo:
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Vitis.git cloudFPGA/cFp_Vitis
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git cloudFPGA/cFDK
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_BringUp.git cloudFPGA/cFp_BringUp
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git cloudFPGA/cFp_Triangle

doxygen:
	doxygen Doxyfile

localhtml: clone_local_cfdk_repo doxygen



