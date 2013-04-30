Automated Solution of Differential Equations by the Finite Element Method -- The FEniCS Book
============================================================================================

This is the source for the "FEniCS Book". The book was published by
Springer in 2012:

  <http://dx.doi.org/10.1007/978-3-642-23099-8>

* To build the book, simply type

    `make final`

* For "quick" build (not including bibliography and index), simply type:

    `make`

* A number of scripts are provided to check for errors:

    `./proofread.sh`      (this checks for common typos and inconsistencies)

    `./spellcheck.sh`     (this runs a spellchecker on all chapters)

    `./check.sh`          (this checks that the book builds without warnings)

* The file named `TODO` contains a list of things that need to be fixed
  by the editors, the publisher and the authors.

* The BPF form is located inside the folder `springer/forms`.

* CTP forms will be submitted separately.

* The repository for the book is located at
  <https://bitbucket.org/fenics-project/fenics-book>

* Tutorial example files reside in 3 different repositories:

    - This repository (the book)
    - The DOLFIN repository (as unit tests)
    - The FEniCS Web repository (as book resources)