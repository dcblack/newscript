DESCRIPTION
===========

These files extracted from the tarball containing this `README.txt` file provide
a minimal installation for the scripts `new` and `phred`. You will find the
scripts themselves in a `bin/` directory, a couple of manpages extracted from
the scripts, and a set of sample templates.

To use the scripts, either add the bin/ directory to your search PATH or move
the executables to an appropriate location. You will also need to set the
TEMPLATEPATH environment variable to point to the templates/ directory. The
accompanying whitepaper describes the scripts in more detail.

MANIFEST
========

    +- README.txt
    +- bin/
    |   +- newscript
    |   +- phred
    +- man/
    |   +- man1/
    |       +- newscript.1
    |       +- phred.1
    +- templates/
    |   +- boiler/
    |   |   +- .newrc
    |   |   +- ABOUT_lxNAMExr.txt
    |   +- apache.txt
    |   +- bash/
    |   |   +- .newrc
    |   |   +- lxNAMExr
    |   +- cpp/
    |   |   +- .newrc
    |   |   +- lxNAMExr.cpp
    |   |   +- Makefile
    |   +- template/
    |   |   +- .newrc
    |   |   +- lxNAMExr/
    |   |       +- .newrc
    |   +- vlog_ex/
    |       +- .newrc
    |       +- lxNAMExr/
    |           +- bin/
    |           |   +- run
    |           +- src/
    |               +- lxDUTxr_rtl.v
    |               +- lxNAMExr_top.v
    |               +- lxTESTxr_test.v
    +- Whats_new.pdf

REQUIREMENTS
============

These scripts assume a relatively recent version of Perl 5 and have been
tested under Linux and Mac OS X. In theory, they may work under Windows, but
your mileage may vary.

BUGS
====

Please send bug reports to <dcblack@mac.com> with the understanding
that there are no warranties as to the fitness or condition of this code.
I will fix bugs as I see fit and subject to my time availability. If you wish
to contribute to this project, please send e-mail with description of your
fix/enhancement and a git-merge.

LICENSING
=========

Copyright:2003-2007 ESLX Inc. $
Copyright 2003-2010 XtremeEDA Corporation
Copyright 2012-2018 David C Black

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

END OF REAME.txt
