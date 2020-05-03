[![Build Status](https://travis.ibm.com/cloudFPGA/Dox.svg?token=8sgWzx3xuqu53CzFUy8K&branch=master)](https://travis.ibm.com/cloudFPGA/Dox) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)


# Dox
The repository for generating Doxygen-related html static pages only for the source code of cloudFPGA project, 
i.e. cloudFPGA Development Kit (cFDK) API.

[Documentation for the source code of cloudFPGA project.](https://pages.github.ibm.com/cloudFPGA/Dox/)

**NOTE**: the generic documentation of the cloudFPGA project, including the desctiprtion of the cloudFPGA components,
tutorials etc, is maintained in a [separate repository](https://github.ibm.com/cloudFPGA/Doc/) and [is available here ](https://pages.github.ibm.com/cloudFPGA/Doc/).


### Automated documentation compilation

We adopt the following tools for automating the documentation of the source code of cloudFPGA project:
* [Travis CI](https://travis-ci.org/) is a hosted continuous integration service used to build and test software projects hosted at GitHub (both on our public and IBM enterprise repositories).
* [Doxygen](http://www.doxygen.nl/) is the de facto standard tool for generating documentation from annotated sources of several programming languages.

The overall documentation compilation process is triggered by a new commit to 
[cloudFPGA Dox repository](https://github.ibm.com/cloudFPGA/Dox). Then `Travis CI` is building the documentation for 
the code (C, C++, VHDL, etc.) on a containerized environment and pushes the generated static HTML files on the 
`gh_pages` branch of [cloudFPGA Dox repository](https://github.ibm.com/cloudFPGA/Dox). The repository is configured 
to match this branch to [GitHub Pages](https://help.github.com/en/github/working-with-github-pages/getting-started-with-github-pages) 
and also bypass [jekyll](https://jekyllrb.com/) processing of `GitHub Pages` by creating an empty file named 
`.nojekyll` on the repository. Eventually the final documentation 
[is available here](https://pages.github.ibm.com/cloudFPGA/Dox/).

#### Update cloudFPGA API Documentation

This repository acts as a building pipeline of tasks that results in the actual documentation in static html pages. 
Thus we don't host any cloudFPGA source code in this repository. 
Instead the actual source code is pulled from the following repositories:

* [cloudFPGA/cFp_Vitis](https://github.ibm.com/cloudFPGA/cFp_Vitis)
* [cloudFPGA/cFDK](https://github.ibm.com/cloudFPGA/cFDK)
* [cloudFPGA/cFp_BringUp](https://github.ibm.com/cloudFPGA/cFp_BringUp)
* [cloudFPGA/cFp_Triangle](https://github.ibm.com/cloudFPGA/cFp_Triangle)

In order to edit the cFDK API documentation, you should apply the changes directly on those repositories, 
i.e. source code, comment blocks, etc., [using the common Doxygen tags](http://www.doxygen.nl/manual/docblocks.html).

Then, to make the changes being reflected onto the html pages, there are two options:
1. Clone this repo, create a minor commit and push. This is useful when you also have some changes for this actual documentation repository (i.e. pipeline of tasks). The `push` request will trigger a new Travis CI building process.
2. Force a `Restart Build` job on [the Travis CI page of this repository](https://travis.ibm.com/cloudFPGA/Dox). This is useful when don't have any changes for this actual documentation repository and you only intend to keep the cFDK API documentation up to date with the source code of the cloudFPGA repositories listed above.

#### Update this documentation

```bash
git clone git@github.ibm.com:cloudFPGA/Dox.git cloudFPGA-Dox
cd cloudFPGA-Dox
< ... make your changes ... >
git push
firefox https://pages.github.ibm.com/cloudFPGA/Dox/ & (view your changes)

**NOTE**: the documentation compilation on Travis CI is expected to take a couple of minutes, so be patient when you submit changes until the time these take effect on the documentation.
