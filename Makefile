# Minimal makefile for Doxygen documentation
#

# You can set these variables from the command line.
SOURCEDIR     = ./docsrc
BUILDDIR      = _build


.PHONY: Makefile clean

clean:
	rm -rf ./docs ./repos_for_Doxygen/cFDK

clone_local_cfdk_repo:
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git repos_for_Doxygen/cFDK

doxygen:
	doxygen Doxyfile

localhtml: clone_local_cfdk_repo doxygen



