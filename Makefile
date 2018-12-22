#!/bin/make -f

#######################################################################
#                                                                     #
#   ---->>   To read documentation use: perldoc Makefile   <<----     #
#                                                                     #
#######################################################################

.PHONY: tar manpages pdfs texts

NEWVERS:=$(lastword $(shell ./bin/newscript --version))
ROOTDIR:=$(shell pwd)
TARBASE:=$(notdir $(ROOTDIR))
TARBALL:=$(ROOTDIR)/newscript-$(NEWVERS).tgz
FILELIST:=$(addprefix $(TARBASE)-$(NEWVERS)/,$(wildcard README.txt docs/*.pdf bin man templates))
DEFAULT: help
help:
	@perldoc Makefile

show:
	@echo "TARBALL=$(TARBASE)"
	@echo "NEWVERS=$(NEWVERS)"

BINS:=newscript phred
TEMPLATES:=apache.txt bash cpp template vlog_ex
update:
	d=bin;       for s in $(BINS);      do rsyncx -auvP $$HLDW/$$d/$$s  $$d/$$s ; rsync -auvP $$d/$$s  $$HLDW/$$d/$$s ; done
	d=templates; for s in $(TEMPLATES); do rsyncx -auvP $$HLDW/$$d/$$s/ $$d/$$s/; rsync -auvP $$d/$$s/ $$HLDW/$$d/$$s/; done

install: tar
	rsync -auvP MANIFEST newscript-$(NEWVERS).tgz* ~/Dropbox/Public/newscript/

tar: manpages pdfs
	@cd ..;ln -s $(TARBASE) $(TARBASE)-$(NEWVERS)
	tar cvzhCXf .. EXCLUDE $(TARBALL) $(FILELIST) 2>&1 | tee MANIFEST
	shasum $(TARBALL) >$(TARBALL).sha; echo "$(notdir $(TARBALL).sha)" >> MANIFEST
	md5 $(TARBALL) >$(TARBALL).md5; echo "$(notdir $(TARBALL).md5)" >> MANIFEST
	gpg -ab $(TARBALL); echo "$(notdir $(TARBALL).asc)" >> MANIFEST
	@cd ..;rm $(TARBASE)-$(NEWVERS)
	@echo "Created $(TARBALL)"

manpages: man/man1/newscript.1 man/man1/phred.1

man/man1/%.1: bin/% Makefile
	@mkdir -p man; mkdir -p man/man1
	pod2man $< >$@

pdfs: newscript.pdf phred.pdf

%.pdf: bin/% Makefile
	pod2pdf \
          --author 'David C Black'\
          --title '$(*F)'\
          --header 'EDA scripts'\
          --podfile bin/$(*F);\
          mv bin/$(*F).pdf docs/$@

texts: newscript.txt phred.txt

%.txt: bin/% Makefile
	pod2text $< >$@

define MAKEFILE_DOCUMENTATION

=pod

=head1 NAME

B<Makefile> - makefile rules

=head1 SYNOPSIS

B<make -f Makefile> {:TARGET:}

=head1 DESCRIPTION

Builds newscript-$NEWVERS tarball.

=head1 USAGE

The following targets are available:

=over

=item help

Provides this help.

=item tar

Creates the tarball.

=back

=head1 COPYRIGHT

Copyright:2003-2007 ESLX Inc. $
Copyright 2003-2010 XtremeEDA Corporation
Copyright 2012-2018 David C Black

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

endef
#EOF
