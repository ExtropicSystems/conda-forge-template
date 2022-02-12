# A sample pypi and conda-forge package.

This sample package is meant to represent engineering best-practices. It
includes python code along with both c++ and rust back-end code,
each accessible via python bindings.

A Dockerfile is included to allow for reproducable builds of the package.

Automatic code formatting, standards compliance validation, unit tests
, performance benchmarking, and python version compatibility testing
is included using tox.

Code beautification is accomplished as follows:
  1) python code is beautified using block
  2) c++ code is beautified using clang-format
  3) rust code is beautified using cargo fmt

Linting is accomplished using the following:
  1) package specification are validates using check-manifest
  2) setup.py is validated using python check -m -s
  3) python code is validated using flake8
  4) c++ code is validated using cppcheck
  5) rust code is validated using cargo clippy

Unit tests are accomplished using py.test.

Benchmarks use pytest-benchmark.

##  Basic Usage

  * make docker-image
  * make docker-interactive
    * nox --sessions lint
    * pip install -e .
    * nox --sessions tests

## TODO

  1) cookiecutter-ify
  2) replace the makefile with additional noxfile sessions
  3) replace the pre-commit system commands using bash with ones using python
  4) replace the two bash scripts in packaging/conda with python scripts for better platform portability

