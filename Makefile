# Minimal makefile for Doxygen documentation
#

# You can set these variables from the command line.
SOURCEDIR     = ./docsrc
BUILDDIR      = _build


.PHONY: Makefile clean

clean:
	rm -rf ./docs ./cloudFPGA 

clone_local_cfdk_repo:
	git -C 'cloudFPGA/cFp_Zoo'       pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_Zoo.git          cloudFPGA/cFp_Zoo
	git -C 'cloudFPGA/cFDK'          pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git         cloudFPGA/cFDK
	git -C 'cloudFPGA/cFp_HelloKale' pull || git clone --depth=1 git@github.com:cloudFPGA/cFp_HelloKale.git    cloudFPGA/cFp_HelloKale
	git -C 'cloudFPGA/cFp_Triangle'  pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git cloudFPGA/cFp_Triangle

doxygen:
	doxygen Doxyfile

localhtml: clone_local_cfdk_repo doxygen



