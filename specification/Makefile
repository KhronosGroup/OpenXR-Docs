# Copyright 2013-2026 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

SHELL = /usr/bin/env bash

QUIET      ?= @
VERYQUIET  ?= @
PYTHON	   ?= python3
ifneq (,$(strip $(BUNDLER)))
ASCIIDOC   ?= bundle exec asciidoctor --trace
HEXAPDF    ?= bundle exec hexapdf
else
ASCIIDOC   ?= asciidoctor
HEXAPDF    ?= hexapdf
endif
RM          = rm -f
RMRF        = rm -rf
MKDIR       = mkdir -p
CP          = cp -p
MV          = mv
ECHO        = @echo

# Use GENXR_OPTIONS to add arguments like -time to scripts/genxr.py invocations
GENXR_ARGS += $(GENXR_OPTIONS) -registry $(REGISTRY)

ifneq (,$(strip $(VERBOSE)))
ASCIIDOC := $(ASCIIDOC) --verbose
else
GENXR_ARGS += -q
endif

ifneq (,$(strip $(VERY_STRICT)))
ADOC_FAILURE_LEVEL := --failure-level INFO --verbose
else
ADOC_FAILURE_LEVEL := --failure-level WARN
endif

VERSIONS := XR_VERSION_1_0 XR_VERSION_1_1 XR_LOADER_VERSION_1_0
VERSIONOPTIONS := $(foreach version,$(VERSIONS),-feature $(version))

SPECREVISION = 1.1.65
REVISION_COMPONENTS = $(subst ., ,$(SPECREVISION))
MAJORMINORVER = $(word 1,$(REVISION_COMPONENTS)).$(word 2,$(REVISION_COMPONENTS))

# Target directory for output files.
OUTDIR   ?= $(GENDIR)/out/$(MAJORMINORVER)

# Target directory for all generated files.
# This can be overridden.
GENDIR   := $(CURDIR)/generated
REFPATH  := $(GENDIR)/refpage

# Path to directory containing handcoded extension appendices
APPENDICES= $(CURDIR)/sources/chapters/extensions

# Generator scripts and options
# GENOPTS can be e.g. '-noprotect'
GENOPTS =

SCRIPTS       := ./scripts
SPECTOOLS     := $(SCRIPTS)/spec_tools
JSAPIMAP      := $(GENDIR)/apimap.cjs
PYAPIMAP      := $(GENDIR)/apimap.py
RBAPIMAP      := $(GENDIR)/apimap.rb
JSXREFMAP     := $(GENDIR)/xrefMap.cjs
PYXREFMAP     := $(GENDIR)/xrefMap.py
JSPAGEMAP     := $(GENDIR)/pageMap.cjs
PYPAGEMAP     := $(GENDIR)/pageMap.py
METADIR       := $(GENDIR)/meta

MAKE_RELATIVE = $(patsubst $(CURDIR)/%,%,$(1))

# Gets built automatically
ASCIIDOCTOR_TARGETS :=

default:
	$(ECHO) "Makefile help - targets:"
	$(ECHO) "header:           build OpenXR header"
	@if [ -d sources/chapters ]; then \
	    echo "html:             HTML version of OpenXR spec"; \
	    echo "pdf:              PDF version of OpenXR spec (Letter [8.5 x 11] paper size)"; \
	    echo "pdfA4:            PDF version of OpenXR spec (A4 paper size)"; \
	    echo "manhtmlpages:     HTML separate per-feature reference pages"; \
	    echo "build-examples:   try compiling all examples"; \
	    echo "check-spec-links: run the checkMarkup and checkSpecLinks scripts"; \
	fi

	@if [ -d sources/extprocess ]; then \
	    echo "extprocess:       HTML version of OpenXR extension process"; \
	fi

	@if [ -f sources/test.c ]; then \
	    echo "header-test:      test-compile the OpenXR header"; fi

	@if [ -d sources/styleguide ]; then \
	    echo "styleguide:       HTML version of styleguide"; fi

	@if [ -d loader ]; then \
	    echo "loader:           HTML version of the loader doc"; fi

	$(ECHO) "all:              build as many of these as possible: header header-test html pdf styleguide loader build-examples check-spec-links"

	@if [ -d sources/chapters ] && [ -d loader ]; then \
	    echo "release-htmlpdf:  build html pdf and copy output to an OpenXR-Registry-like layout"; \
	    echo "release:          build html pdf manhtmlpages loader styleguide extprocess and copy output to an OpenXR-Registry-like layout"; \
	fi
	$(ECHO) "reflow:           reflow AsciiDoctor source files in-place"
	$(ECHO) "clean_dirt:       remove intermediate files"
	$(ECHO) "clean:            remove targets and intermediate files"
	$(ECHO) ""
	$(ECHO) "Variables controlling options:"
	$(ECHO) "Pass QUIET= to disable quiet mode (echos all commands)"
	$(ECHO) "Pass VERYQUIET= to disable very quiet mode (prints full build command for each refpage)"
	$(ECHO) "Pass VERBOSE=1 to invoke asciidoctor with the --verbose option and genxr.py without the -q option"
	$(ECHO) "Pass VERY_STRICT=1 to invoke asciidoctor with the --failure-level INFO option"
	$(ECHO) "Pass RELEASE=1 to turn off all asciidoctor date/timestamps for a reproducible release build"
	@if [ -d sources/chapters ] && [ -d loader ]; then \
	    echo "Pass some string for RELEASE_SPECS_SUFFIX to add a suffix to the version-numbered directory for the release targets"; fi

################################################
# Store our build configuration in a file, and force re-generation if it changes.
# Most common thing that changes is the extension list.

APITITLE :=
EXTS := $(sort $(EXTENSIONS))
VERSIONS := $(sort $(VERSIONS))

CONFIG_STAMP_FN := $(GENDIR)/config-stamp

# This is the stuff stored/checked
STAMP_DATA := $(EXTS) $(VERSIONS) "$(APITITLE)"

# Depend on this target to force checking the config for changes.
config_stamp:
	$(QUIET)$(MKDIR) $(dir $(CONFIG_STAMP_FN))
	$(QUIET)if ! $(PYTHON) $(SCRIPTS)/check_stamp.py "$(CONFIG_STAMP_FN)" $(STAMP_DATA); then $(MAKE) clean_generated; $(MAKE) attribs; fi
.PHONY: config_stamp

################################################
## OpenXR header file targets

HEADER_DIR    := $(OUTDIR)/openxr
HEADER        := $(HEADER_DIR)/openxr.h
PLATHEAD      := $(HEADER_DIR)/openxr_platform.h
LOADERHEAD    := $(HEADER_DIR)/openxr_loader_negotiation.h
REFLECTHEADERS:= $(HEADER_DIR)/openxr_reflection.h \
                 $(HEADER_DIR)/openxr_reflection_structs.h \
                 $(HEADER_DIR)/openxr_reflection_parent_structs.h
GENHEADERS    := $(HEADER) $(PLATHEAD) $(LOADERHEAD) $(REFLECTHEADERS)
DEFINESHEAD   := $(HEADER_DIR)/openxr_platform_defines.h

# Platform header (just copy)
$(DEFINESHEAD): ../include/openxr/openxr_platform_defines.h
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(CP) $< $@

# Named target to generate all headers
header: $(GENHEADERS) $(DEFINESHEAD)
.PHONY: header

TESTSRC := sources/test.c
# Test that openxr.h compiles
header-test: header $(TESTSRC)
	$(CC) -Wall -pedantic -std=c99 -c -I$(OUTDIR) $(TESTSRC)
	$(CXX) -Wall -c -std=c++98 -I$(OUTDIR) $(TESTSRC)
	$(CXX) -Wall -c -std=c++11 -I$(OUTDIR) $(TESTSRC)
	rm test.o
.PHONY: header-test

################################################
# Generated files: headers or includes referenced in spec.
# Some nominal targets are just "stamp" files generated.

REGISTRY    := registry/xr.xml
GENXR       := $(SCRIPTS)/genxr.py
BASIC_GENERATED_DEPENDS := \
  $(REGISTRY) \
  $(GENXR) \
  $(SCRIPTS)/reg.py \
  $(SCRIPTS)/generator.py \
  $(SPECTOOLS)/util.py \
  $(SPECTOOLS)/conventions.py \
  $(SCRIPTS)/xrconventions.py \
  config_stamp \
  Makefile

# Stamp files for the generated includes
GENSTAMPS := \
  $(GENDIR)/api/apiinc \
  $(GENDIR)/validity/validinc \
  $(GENDIR)/hostsynctable/hostsyncinc \
  $(GENDIR)/interfaces/interfaceinc \
  $(METADIR)/extinc \

# The actual generated index
GENDEPENDS := $(JSAPIMAP) $(PYAPIMAP) $(RBAPIMAP) $(GENSTAMPS) $(GENDIR)/index.adoc

# The rule for every genxr-generated file
$(GENDEPENDS) $(GENHEADERS): $(BASIC_GENERATED_DEPENDS)
	$(ECHO) "[genxr]       $(REGISTRY) -> $@"
	@if [ "x$(STAMP_NOTE)" != "x" ]; then echo "                                 $(STAMP_NOTE)"; fi
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(PYTHON) $(GENXR) $(GENXR_ARGS) $(VERSIONOPTIONS) $(EXTOPTIONS) -o "$(@D)" $(@F)

# Print an extra note for stamp files
$(GENSTAMPS): STAMP_NOTE = (and additional files in $(@D))

# Extra deps
$(GENDIR)/api/apiinc: $(PYAPIMAP) $(SCRIPTS)/docgenerator.py
$(GENDIR)/validity/validinc: $(SCRIPTS)/validitygenerator.py $(SPECTOOLS)/validity.py $(SPECTOOLS)/attributes.py $(SPECTOOLS)/data_structures.py
$(JSAPIMAP): $(SCRIPTS)/jsgenerator.py $(SCRIPTS)/docgenerator.py
$(PYAPIMAP): $(SCRIPTS)/pygenerator.py $(SCRIPTS)/docgenerator.py
$(RBAPIMAP): $(SCRIPTS)/rubygenerator.py $(SCRIPTS)/docgenerator.py
$(GENHEADERS): $(SCRIPTS)/cgenerator.py
$(REFLECTHEADERS): $(SCRIPTS)/creflectiongenerator.py $(SCRIPTS)/jinja_helpers.py $(wildcard $(SCRIPTS)/template_*)

# The actual generated files depend on their stamp file.
GENAPI = $(wildcard $(GENDIR)/api/*/[A-Za-z]*.adoc)
$(GENAPI): $(GENDIR)/api/apiinc

apiinc: $(GENDIR)/api/apiinc

GENVALIDITY = $(wildcard $(GENDIR)/validity/*/[A-Za-z]*.adoc)
$(GENVALIDITY): $(GENDIR)/validity/validinc

validinc: $(GENDIR)/validity/validinc

GENSYNC := \
  $(GENDIR)/hostsynctable/implicit.adoc \
  $(GENDIR)/hostsynctable/parameterlists.adoc \
  $(GENDIR)/hostsynctable/parameters.adoc
$(GENSYNC): $(GENDIR)/hostsynctable/hostsyncinc

hostsyncinc: $(GENDIR)/hostsynctable/hostsyncinc

GENMETA = $(wildcard $(METADIR)/extinc/[A-Za-z]*.adoc)
$(GENMETA): $(METADIR)/extinc

extinc: $(METADIR)/extinc

GENINTERFACE = $(wildcard $(GENDIR)/interfaces/[A-Za-z]*.adoc)
$(GENINTERFACE): $(GENDIR)/interfaces/interfaceinc
interfaceinc: $(GENDIR)/interfaces/interfaceinc

ATTRIBFILE := $(GENDIR)/specattribs.adoc

# This generates a single file containing asciidoc attributes for each
# core version and extension in the spec being built.
# For use with Antora, it also includes a couple of document attributes
# otherwise passed on the asciidoctor command line.
# These should not use the asciidoctor attribute names (e.g. revnumber,
# revdate), so use the Makefile variable names instead (e.g.
# SPECREVISION, SPECDATE).

attribs: $(ATTRIBFILE)

$(ATTRIBFILE):
	$(ECHO) "[make]        config -> $@"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)for attrib in $(VERSIONS) $(EXTS) ; do \
	    echo ":$${attrib}:" ; \
	done > $@
	$(QUIET)(echo ":SPECREVISION: $(SPECREVISION)" ; \
		 echo ":SPECDATE: $(SPECDATE)" ; \
		 echo ":SPECREMARK: $(SPECREMARK)" ; \
		 echo ":APITITLE: $(APITITLE)") >> $@

# The actual generated include files
GENINCLUDE = $(GENAPI) $(GENVALIDITY) $(GENSYNC) $(GENMETA) $(ATTRIBFILE)
.PHONY: generated
generated: $(GENDEPENDS) $(GENINCLUDE)

################################################
# OpenXR Style Guide

SPECSRC = sources/openxr.adoc
SPECFILES = $(wildcard sources/chapters/[A-Za-z]*.adoc)
STYLEGUIDE = $(OUTDIR)/styleguide.html
STYLESRC = sources/styleguide/styleguide.adoc
STYLEFILES = $(wildcard sources/styleguide/[A-Za-z]*.adoc)

styleguide: $(STYLEGUIDE)

# Use the AsciiDoctor rule
ASCIIDOCTOR_TARGETS += $(STYLEGUIDE)

# Target-specific variables and deps customizing the AsciiDoctor rule
$(STYLEGUIDE): SPECSRC=$(STYLESRC)
$(STYLEGUIDE): ADOCOPTS += $(ADOCHTMLOPTS)
$(STYLEGUIDE): $(STYLESRC) $(STYLEFILES) $(GENDIR)/validity/validinc $(GENDIR)/api/apiinc $(RBAPIMAP)


################################################
# OpenXR Loader Guide

LOADERGUIDE = $(OUTDIR)/loader.html
LOADERSRC = loader/loader.adoc
LOADERFILES = $(wildcard loader/[A-Za-z]*.adoc)

loader: $(LOADERGUIDE)

# Use the AsciiDoctor rule
ASCIIDOCTOR_TARGETS += $(LOADERGUIDE)

# Target-specific variables and deps customizing the AsciiDoctor rule
$(LOADERGUIDE): SPECSRC=$(LOADERSRC)
$(LOADERGUIDE): ADOCOPTS += $(ADOCHTMLOPTS)
$(LOADERGUIDE): $(LOADERSRC) $(LOADERFILES) $(RBAPIMAP)


################################################
# OpenXR Extension Process

EXTPROCESSGUIDE = $(OUTDIR)/extprocess.html
EXTPROCESSSRC = sources/extprocess/extension_process.adoc

extprocess: $(EXTPROCESSGUIDE)

# Use the AsciiDoctor rule
ASCIIDOCTOR_TARGETS += $(EXTPROCESSGUIDE)

$(EXTPROCESSGUIDE): SPECSRC=$(EXTPROCESSSRC)
$(EXTPROCESSGUIDE): ADOCOPTS += $(ADOCHTMLOPTS)
$(EXTPROCESSGUIDE): $(EXTPROCESSSRC)

################################################
## Specification targets

COMMONDOCS = $(SPECSRC) $(SPECFILES) $(GENINCLUDE) $(GENDEPENDS)

SPEC_FILENAME_STEM := openxr

## HTML
HTMLSPEC      := $(OUTDIR)/$(SPEC_FILENAME_STEM).html
html: $(HTMLSPEC)

# Use the AsciiDoctor rule
ASCIIDOCTOR_TARGETS += $(HTMLSPEC)

# Target-specific variables and deps customizing the AsciiDoctor rule
# EXTRAATRIBS is for build-time customization
$(HTMLSPEC): ATTRIBOPTS += -a sectanchors $(EXTRAATTRIBS)
$(HTMLSPEC): ADOCOPTS += $(ADOCHTMLOPTS)
$(HTMLSPEC): $(COMMONDOCS)

## PDF
PDFSPEC       := $(OUTDIR)/$(SPEC_FILENAME_STEM).pdf
PDFA4SPEC     := $(OUTDIR)/$(SPEC_FILENAME_STEM).a4.pdf

pdf pdfLetter: $(PDFSPEC)
pdfA4: $(PDFA4SPEC)

# Use the AsciiDoctor rule
ASCIIDOCTOR_TARGETS += $(PDFSPEC) $(PDFA4SPEC)

# Target-specific variables and deps customizing the AsciiDoctor rule
# EXTRAATRIBS is for build-time customization
$(PDFSPEC) $(PDFA4SPEC): BACKEND_ARGS=--backend pdf --require asciidoctor-pdf -a compress --require ./scripts/pdf-index-customizer.rb $(EXTRAATTRIBS)
$(PDFSPEC): PAGESIZE=LETTER
$(PDFA4SPEC): PAGESIZE=A4
$(PDFSPEC) $(PDFA4SPEC): $(COMMONDOCS)

################################################
## Shared asciidoctor rule

EXTOPTIONS := $(foreach ext,$(EXTS),-extension $(ext))

# Generate Asciidoc attributes for spec revision remark.


# Spell out RFC2822 format as not all date commands support -R
SPECDATE     = $(shell echo `date -u "+%a, %d %b %Y %T %z"`)

# GITBRANCH should be set by the caller in CI environments
# because CI machines often checkout the code in detached HEAD state.
ifeq ($(GITBRANCH),)
# Evaluate only once to avoid slow calls to git.
GITBRANCH  := $(shell echo `git symbolic-ref --short HEAD`)
endif
GITREMARK  ?= from git branch: $(GITBRANCH)

ATTRIBOPTS   = -a revnumber="$(SPECREVISION)" \
               -a revremark="$(SPECREMARK)" \
               -a apititle="$(APITITLE)" \
               -a config=$(CURDIR)/config \
               -a chapters=$(CURDIR)/sources/chapters \
               -a pdf-page-size=$(PAGESIZE) \
               -a pdf-stylesdir=config \
               -a pdf-style=pdf \
               -a generated=$(abspath $(GENDIR)) \
               -a appendices=$(APPENDICES) \
               $(foreach version,$(VERSIONS),-a $(version)) \
               $(EXTATTRIBS)

# Look in $(GENDIR) for explicitly required non-extension Ruby, such
# as apimap.rb
ADOCOPTS = --doctype book \
           -a data-uri \
           -I$(GENDIR) \
           --require $(CURDIR)/scripts/spec-macros.rb \
           $(ADOC_FAILURE_LEVEL) \
           $(ATTRIBOPTS)

ADOCHTMLOPTS := \
           --require $(CURDIR)/scripts/rouge-extend-css.rb \
           --require $(CURDIR)/scripts/genanchorlinks.rb \
           --require $(CURDIR)/scripts/nonbreaking-ext-titles.rb \


ifneq (,$(strip $(RELEASE)))
# No dates or internal commit hashes in release builds for reproducibility
ATTRIBOPTS   += -a revdate!
ATTRIBOPTS   += -a last-update-label!
ATTRIBOPTS   += -a reproducible
SPECREMARK   ?= $(GITREMARK)

else
ATTRIBOPTS   += -a revdate="$(SPECDATE)"
SPECREMARK   ?= $(GITREMARK) \
		commit: $(shell echo `git log -1 --format="%H"`)

endif

ifneq (,$(strip $(KHRONOS_SPEC_LICENSED)))
# Enable photo of JP in dedication: not CC-BY-4.0,
# so only used in generated docs now.
ATTRIBOPTS   += -a include-dedication-photo
endif

CSS_FILENAME := khronos.css

# Default to html5
BACKEND_ARGS := --backend html5 \
                -a stylesdir=$(CURDIR)/config \
                -a stylesheet=$(CSS_FILENAME)

# AsciiDoctor rule - customized by the places where these are described
$(ASCIIDOCTOR_TARGETS):
	$(ECHO) "[asciidoctor] $(SPECSRC) -> $(call MAKE_RELATIVE,$@)"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(ASCIIDOC) $(ADOCOPTS) $(BACKEND_ARGS) --out-file $@ $(SPECSRC)
	$(POSTPROCESS)


################################################
# Reference "man" pages extracted from spec

MANHTMLDIR   = $(OUTDIR)/man/html
KHRSOURCES   = $(wildcard $(REFPATH)/*KHR.adoc)
MACROSOURCES = $(wildcard $(REFPATH)/XR_*[A-Z][A-Z].adoc)
VENSOURCES   = $(filter-out $(KHRSOURCES) $(MACROSOURCES),$(wildcard $(REFPATH)/*[A-Z][A-Z].adoc))
CORESOURCES  = $(filter-out $(KHRSOURCES) $(VENSOURCES),$(wildcard $(REFPATH)/[Xx][Rr]*.adoc $(REFPATH)/PFN*.adoc))
MANSOURCES   = $(CORESOURCES) $(VENSOURCES) $(KHRSOURCES)
MANGENERATED = $(wildcard $(REFPATH)/*)
MANHTML      = $(MANSOURCES:$(REFPATH)/%.adoc=$(MANHTMLDIR)/%.html)
MANCSSDIR   := $(MANHTMLDIR)/css
MANDEPS      = $(GENINCLUDE) $(GENDEPENDS) $(MANCSSDIR)/$(CSS_FILENAME)
HTML_SPEC_RELATIVE ?= ../../html/$(SPEC_FILENAME_STEM).html

# Asciidoctor options to build refpages
#
# ADOCREFOPTS *must* be placed after ADOCOPTS in the command line, so
# that it can override spec attribute values.
#
# refprefix includes the refpage (not spec) extension metadata.
# isrefpage is for refpage-specific content
# html_spec_relative is where to find the full specification
ADOCREFOPTS  = -a refprefix='refpage.' \
               -a isrefpage \
               -a html_spec_relative='$(HTML_SPEC_RELATIVE)' \
               -a imagesdir=$(CURDIR)/sources \
               -a source-highlighter=rouge \
               -a rouge-style=github \
               -a linkcss \
               -a copycss=$(MANCSSDIR)/$(CSS_FILENAME) \
               -a stylesdir=css

# Pure makefile lowercase function, generated by a script.
make_lower = $(subst A,a,$(subst B,b,$(subst C,c,$(subst D,d,$(subst E,e,$(subst F,f,$(subst G,g,$(subst H,h,$(subst I,i,$(subst J,j,$(subst K,k,$(subst L,l,$(subst M,m,$(subst N,n,$(subst O,o,$(subst P,p,$(subst Q,q,$(subst R,r,$(subst S,s,$(subst T,t,$(subst U,u,$(subst V,v,$(subst W,w,$(subst X,x,$(subst Y,y,$(subst Z,z,$(1)))))))))))))))))))))))))))
EXTENSIONS_LOWER := $(call make_lower,$(EXTENSIONS))

# Function that turns khr_vulkan_enable into sources/chapters/extensions/khr/khr_vulkan_enable.adoc
make_extension_source = sources/chapters/extensions/$(word 1,$(subst _, ,$(1)))/$(1).adoc

# Call make_extension_source on every enabled extension, after lowercasing and stripping the leading XR prefix.
EXTENSION_SOURCES := $(foreach ext,$(patsubst xr_%,%,$(EXTENSIONS_LOWER)),$(call make_extension_source,$(ext)))

# Manually copy the CSS file. Asciidoctor does not always do this, it seems.
$(MANCSSDIR)/$(CSS_FILENAME): $(CURDIR)/config/$(CSS_FILENAME)
	$(ECHO) "[cp]          $(call MAKE_RELATIVE,$<) -> $(call MAKE_RELATIVE,$@)"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(CP) "$<" "$@"

# Generation of refpage asciidoctor sources by extraction from the
# specification.
#
# Adding '-extpath $(CURDIR)/sources/chapters/extensions' will change
# refpage generation to be like Vulkan - not ready for this yet.
#
# Should have a proper dependency causing the man page sources to be
# generated by running genRef (once), but adding $(MANSOURCES) to the
# targets causes genRef to run once/target.
#
# Should pass in $(EXTOPTIONS) to determine which pages to generate.
# For now, all core and extension refpages are extracted by genRef.py.
#
# Treating the all-in-one ref page source apispec.adoc as the "stamp" for genRef.
GENREF = $(SCRIPTS)/genRef.py
LOGFILE = $(REFPATH)/refpage.log
refpages: $(REFPATH)/apispec.adoc
$(REFPATH)/apispec.adoc: $(SPECFILES) $(EXTENSION_SOURCES) $(GENREF) $(SCRIPTS)/reflib.py $(PYAPIMAP)
	$(ECHO) "[genRef.py]   $(REGISTRY) and spec -> $@"
	$(ECHO) "                                          (and additional files in $(@D))"
	$(QUIET)$(MKDIR) "$(REFPATH)"
	$(QUIET)$(PYTHON) $(GENREF) -genpath $(abspath $(GENDIR)) -basedir $(REFPATH) \
	    -log $(LOGFILE) \
	    -registry $(REGISTRY) $(EXTOPTIONS) $(SPECFILES) $(EXTENSION_SOURCES)
	$(QUIET)grep "ERROR:" $(LOGFILE) || true

# These targets are HTML5 refpages
#
# The recursive $(MAKE) is an apparently unavoidable hack, since the
# actual list of man page sources isn't known until after
# $(REFPATH)/apispec.adoc is generated. $(GENDEPENDS) is generated before
# running the recursive make, so it does not trigger twice
# $(SUBMAKEOPTIONS) suppresses the redundant "Entering / leaving"
# messages make normally prints out, similarly to suppressing make
# command output logging in the individual refpage actions below.
SUBMAKEOPTIONS = --no-print-directory
manhtmlpages: $(REFPATH)/apispec.adoc $(GENDEPENDS)
	$(QUIET)$(MAKE) $(SUBMAKEOPTIONS) -e buildmanpages

# Build the individual refpages, then the symbolic links from aliases
buildmanpages: $(MANHTML) $(MANHTMLDIR)/openxr.html
	$(QUIET)$(MAKE) $(SUBMAKEOPTIONS) -e manaliases

# This target does not at present, since OpenXR does not alias refpage
# content yet.
manaliases: $(PYAPIMAP)

# This is the single-page ref page.
# 'doctype-manpage' allows use of the "book" style but still enable the
# refpage-only portions.
$(MANHTMLDIR)/openxr.html: $(REFPATH)/apispec.adoc $(MANDEPS)
	$(ECHO) "[asciidoctor] $(call MAKE_RELATIVE,$<) -> $(call MAKE_RELATIVE,$@)"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(ASCIIDOC) $(BACKEND_ARGS) $(ADOCOPTS) $(ADOCREFOPTS) -a doctype-manpage -d book -o $@ $<

# The refpage build process normally generates far too much output, so
# use VERYQUIET instead of QUIET
# 'cross-file-links' causes the *link: macros to link to other refpages,
# instead of internal anchors.
$(MANHTML): $(MANHTMLDIR)/%.html: $(REFPATH)/%.adoc $(MANDEPS)
	$(ECHO) "[asciidoctor] $(call MAKE_RELATIVE,$<) -> $(call MAKE_RELATIVE,$@)"
	$(QUIET)$(MKDIR) "$(@D)"
	$(VERYQUIET)$(ASCIIDOC) $(BACKEND_ARGS) $(ADOCOPTS) $(ADOCHTMLOPTS) $(ADOCREFOPTS) \
	    -a cross-file-links -d manpage -o $@ $<

# Defer for now - there is no latexmath in the XR spec, unlike Vulkan
#
# Running translate_math.js on every refpage is slow and most of them
# do not contain math, so do a quick search for latexmath delimiters.
# This is all the individual-page ref pages.
#
#	 $(VERYQUIET)if egrep -q '\\[([]' $@ ; then \
#	     $(TRANSLATEMATH) $@ ; \
#	 fi

################################################
# Embedded example code

# Script that extracts code to .cpp and .c files, and
# generates an associated makefile
EXAMPLES_SCRIPT = $(SCRIPTS)/extract_code.py

# The makefile generated by extract_code.py
EXAMPLES_MAKEFILE = examples.mk

ifeq ($(strip $(QUIET)),@)
EXTRACT_QUIET := --quiet
endif

$(EXAMPLES_MAKEFILE): $(EXAMPLES_SCRIPT)
	$(QUIET)$(PYTHON) $< --makefile=$@ --line_numbers $(EXTRACT_QUIET)

build-examples: $(EXAMPLES_MAKEFILE) header
	$(QUIET)$(MAKE) -f $(EXAMPLES_MAKEFILE)
.PHONY: build-examples

################################################
# Check Markup, Check Spec Links, check XML schema
CHECK_MARKUP_SCRIPT = $(CURDIR)/checkMarkup

# Edit the following line's "ignore_count" when the number of checkSpecLinks errors changes,
# either by reducing (ensuring we keep the improvement)
# or by increasing (if there's an error we can't resolve right now and don't want to break CI)
CHECK_SPEC_LINKS_SCRIPT = $(CURDIR)/scripts/check_spec_links.py --ignore_count=0 -Wall --include_warn -Werror
# -Werror disabled for now because there are ~14 -Wrefpage_missing messages.
# Would like those in the logs, but not in the count for build-breaking.

check-spec-links:
	$(QUIET)if [ -f $(CHECK_MARKUP_SCRIPT) ] && [ -f $(SPECSRC) ]; then $(CHECK_MARKUP_SCRIPT) -Werror; fi
	$(QUIET)if [ -f $(SPECSRC) ]; then $(PYTHON) $(CHECK_SPEC_LINKS_SCRIPT); fi
	$(QUIET)if [ -f checkXml.sh ] && [ -f registry/registry.rnc ]; then env FAIL_IF_COULD_NOT_VALIDATE=false ./checkXml.sh; fi
	$(QUIET)if [ -f checkSchematron.sh ] && [ -f registry/registry.sch ]; then ./checkSchematron.sh; fi
	$(QUIET)$(PYTHON) $(SCRIPTS)/xml_consistency.py
	$(QUIET)$(PYTHON) $(SCRIPTS)/findBareNormatives.py

.PHONY: check-spec-links

# Look for files whose Khronos copyright has not been updated to the
# current year.
# Ignore this line in the Makefile, and also ignore the compare-base.
DATE_YEAR = $(shell date +%Y)
CHECK_DATES = git grep -l  -e 'Copyright.*The Khronos' --and --not \( -e 'Copyright.*$(DATE_YEAR).*The Khronos' --or -e 'grep' \) | grep -v "compare-base/openxr"
check-copyright-dates:
	$(QUIET)if test `$(CHECK_DATES) | wc -l` != 0 ; then \
	    echo "Files with out-of-date Khronos copyrights (must be updated to $(DATE_YEAR)):" ; \
	    $(CHECK_DATES) ; \
	    exit 1 ; \
	 fi

.PHONY: check-copyright-dates

################################################
# Reflow all specification source text

reflow:
	$(QUIET)$(PYTHON) $(CURDIR)/scripts/reflow.py -overwrite

.PHONY: reflow

################################################
# Meta "build approximately everything spec-specific required to pass CI" target

# recursive to cause csl to run first for better errors messages, without adding bogus depends.
all:
	$(QUIET)if [ -f $(SPECSRC) ]; then $(MAKE) check-spec-links; fi
	$(QUIET)$(MAKE) header
	$(QUIET)if [ -f $(TESTSRC) ]; then $(MAKE) header-test; fi
	$(QUIET)if [ -f $(SPECSRC) ]; then $(MAKE) html pdf build-examples; fi
	$(QUIET)if [ -f $(STYLESRC) ]; then $(MAKE) styleguide extprocess; fi
	$(QUIET)if [ -f $(LOADERSRC) ]; then $(MAKE) loader; fi
	$(ECHO) ""
	$(ECHO) "Target 'all': Completed specification build and basic checks successfully."
.PHONY: all


################################################
# Meta builds for releases. Also copies into approximately the right layout for the OpenXR-Registry repo.
REGISTRYOUTDIR = $(GENDIR)/out/registry-release/specs/$(MAJORMINORVER)$(RELEASE_SPECS_SUFFIX)

$(REGISTRYOUTDIR):
	$(QUIET)$(MKDIR) "$@"

$(REGISTRYOUTDIR)/pdf $(REGISTRYOUTDIR)/html $(REGISTRYOUTDIR)/man $(REGISTRYOUTDIR)/headers: | $(REGISTRYOUTDIR)
	$(QUIET)$(MKDIR) "$@"

$(REGISTRYOUTDIR)/headers/openxr: | $(REGISTRYOUTDIR)/headers
	$(QUIET)$(MKDIR) "$@"

release-htmlpdf: html pdf $(REGISTRYOUTDIR)/pdf $(REGISTRYOUTDIR)/html
	$(ECHO) "[hexapdf]     $(call MAKE_RELATIVE,$(REGISTRYOUTDIR)/pdf/$(SPEC_FILENAME_STEM).pdf)"
	$(QUIET)$(HEXAPDF) optimize --force $(PDFSPEC) $(REGISTRYOUTDIR)/pdf/$(SPEC_FILENAME_STEM).pdf
	$(ECHO) "[cp]          $(call MAKE_RELATIVE,$(REGISTRYOUTDIR)/html/$(SPEC_FILENAME_STEM).html)"
	$(QUIET)$(CP) $(HTMLSPEC) $(REGISTRYOUTDIR)/html/$(SPEC_FILENAME_STEM).html
.PHONY: release-htmlpdf


release: release-htmlpdf manhtmlpages loader styleguide extprocess | $(REGISTRYOUTDIR) $(REGISTRYOUTDIR)/man
	$(ECHO) "[cp]          $(call MAKE_RELATIVE,$(REGISTRYOUTDIR))/{styleguide,extprocess,loader}.html"
	$(QUIET)$(CP) $(OUTDIR)/styleguide.html $(OUTDIR)/extprocess.html $(OUTDIR)/loader.html $(REGISTRYOUTDIR)
	$(ECHO) "[cp]          $(REGISTRYOUTDIR)/man/html"
	$(QUIET)$(CP) -R $(MANHTMLDIR) $(REGISTRYOUTDIR)/man/html
.PHONY: release

################################################
## Clean targets

# Files to clean up
PYDIRT = diag.txt dumpReg.txt errwarn.txt *.pyc regdump.txt
MANDIRT = $(REFPATH)/
DIRT = $(PYDIRT) $(MANDIRT) ERRS \#*

# Clean intermediate files
clean_dirt:
	$(RMRF) $(DIRT)

# Generated directories and files to remove
CLEAN_GEN_PATHS := \
    $(PYAPIMAP) \
    $(RBAPIMAP) \
    $(GENDIR)/index.adoc \
    $(GENDIR)/api \
    $(GENDIR)/validity \
    $(GENDIR)/hostsynctable \
    $(METADIR) \
    $(REFPATH) \
    $(ATTRIBFILE)

# Clean intermediate generated files
# Don't remove OUTDIR, since it contains the config stamp and final output targets
clean_generated:
	$(RMRF) $(CLEAN_GEN_PATHS)

# Clean generated targets as well as intermediates.
clean clobber: clean_dirt clean_generated clean_antora
	$(RM) $(HEADER) $(PLATHEAD) $(LOADERHEAD) $(REFLECTHEADERS) $(DEFINESHEAD) $(HTMLSPEC) $(PDFSPEC) $(PDFA4SPEC) $(STYLEGUIDE) $(LOADERGUIDE) $(CONFIG_STAMP_FN)
	# Clean up extracted code
	if [ -f $(EXAMPLES_MAKEFILE) ]; then $(MAKE) -f $(EXAMPLES_MAKEFILE) clean-examples; fi
	$(RM) $(EXAMPLES_MAKEFILE)
	# Clean up man pages and specs
	$(RMRF) $(OUTDIR) $(MANHTMLDIR)

# Files generated by 'setup_antora' target
# Omit
#   antora/<module>/modules/<module>/nav.adoc
# and
#   antora/<module>/modules/<module>/pages/index.adoc
# also checked in.
CLEAN_ANTORA_PATHS = \
	$(ANTORA_FILELIST) \
	antora/openxr/modules/ROOT/nav.adoc \
	antora/openxr/modules/ROOT/images \
	antora/openxr/modules/ROOT/pages/appendices \
	antora/openxr/modules/ROOT/pages/chapters \
	antora/openxr/modules/ROOT/pages/partials \
	antora/openxr/modules/ROOT/pages/$(ANTORA_GENDIR) \
	antora/openxr/modules/ROOT/partials \
	antora/refpages/modules/refpages/nav.adoc \
	antora/refpages/modules/refpages/pages/source \
	antora/refpages/modules/refpages/partials \
	antora/refpages/modules/refpages/images \
	antora/refpages/refpage.diag \
	antora/refpages/refpage.warn \
	$(JSXREFMAP) \
	$(PYXREFMAP) \
	$(JSPAGEMAP) \
	$(PYPAGEMAP)

clean_antora:
	$(QUIET)$(RMRF) $(CLEAN_ANTORA_PATHS)

################################################
# Generate all Antora module content

# After the targets are built, the $(JSXREFMAP) and $(JSPAGEMAP) files
# used by spec macros in the Antora build must be copied into the Antora
# project build tree, which is in a different repository.
setup_antora: xrefMap .WAIT setup_spec_antora setup_refpages_antora

# Cross-references of anchors to spec chapters they lie within
# Used by Antora targets
xrefMap: $(PYXREFMAP) $(JSXREFMAP)

$(PYXREFMAP) $(JSXREFMAP): $(HTMLSPEC)
	$(QUIET)$(PYTHON) $(SCRIPTS)/map_html_anchors.py \
	    $(HTMLSPEC) -pyfile $(PYXREFMAP) -jsfile $(JSXREFMAP)

# Generate Antora spec module content by rewriting spec sources
# Individual files must be specified last
# This target is also used to generate the pageMap, which is combined
# with the xrefMap above to map anchors into the Antora pages they
# are found within.

ANTORA_SPECMODULE = antora/openxr/modules/ROOT

# The list of files is long enough to exceed system limits on argument
# lists, so instead of passing them on the command line they are stored
# in a separate file.
ANTORA_FILELIST = $(GENDIR)/antoraFileList.txt

# Additional individual files to include
ANTORA_EXTRAFILES = \
	$(wildcard config/[A-Za-z]*.adoc) \
	$(wildcard ./images/[A-Za-z]*.jpg) \
	$(wildcard ./images/[A-Za-z]*.png) \
	$(wildcard ./images/[A-Za-z]*.svg) \
	$(JSXREFMAP) \
	$(JSAPIMAP)

# Top-level spec source file
SPECSRC = sources/openxr.adoc

# The pageMap is copied, separately since antora-prep.py creates it.
ANTORA_GENDIR = $(notdir $(GENDIR))
setup_spec_antora pageMap $(JSPAGEMAP) $(PYPAGEMAP): xrefMap $(JSAPIMAP) spec_nav_antora
	$(QUIET)find $(GENDIR) sources/chapters -name '[A-Za-z]*.adoc' \
	    > $(ANTORA_FILELIST)
	$(QUIET)ls -1 $(ANTORA_EXTRAFILES) >> $(ANTORA_FILELIST)
	$(QUIET)$(PYTHON) $(SCRIPTS)/antora-prep.py \
	    -root . \
	    -component $(shell realpath antora/openxr/modules/ROOT) \
	    -xrefMap $(PYXREFMAP) \
	    -module 'openxr::' \
	    -pageHeaders antora/pageHeaders-spec.adoc \
	    -jspagemap $(JSPAGEMAP) \
	    -pypagemap $(PYPAGEMAP) \
	    -filelist $(ANTORA_FILELIST)
	$(QUIET)$(CP) $(JSPAGEMAP) $(ANTORA_SPECMODULE)/partials/$(ANTORA_GENDIR)

# Construct the spec component nav.adoc from the list of included
# chapters in openxr.adoc, so it remains up to date.
# This is a simple transformation turning include directives into xrefs.
# Unfortunately we cannot set or use attributes in nav files, so the
#   {chapters} and {appendices} attributes must be turned into hardcoded
#   paths in the pages/ directory.
SPECNAV = antora/openxr/modules/ROOT/nav.adoc
spec_nav_antora: $(SPECSRC)
	#@ Probably needs edits for OpenXR directory structure - can't just get rid of the attribute name
	cat $(SPECSRC) | \
	    sed -n '/tag::antora-vulkan-nav/,/end::antora-vulkan-nav/p' | \
	    egrep '^include::' | \
	    tr -d '{}' | \
	    sed -e 's/include::/* xref:/' > $(SPECNAV)

#TODO
#TODO# Generate Antora refpages module content by extraction from rewritten
#TODO# spec sources.
#TODO# The sources in the spec component partials/ directory are used since
#TODO# that has all source files, and some of the files not in pages/ have
#TODO# refpage content.
#TODO# At present, this is done by symlinking spec module directories into
#TODO# the corresponding refpages module directories.
#TODO# The pageMap and xrefMap created by setup_spec_antora are used here.
#TODO
#TODOANTORA_REFMODULE = antora/refpages/modules/refpages
#TODO# Where to create the extracted refpage files
#TODOANTORA_EXTRACT_PAGES = $(ANTORA_REFMODULE)/pages/source
#TODOANTORA_LOGPATH = antora/refpages/
#TODO# Same as SPECFILES but pointing to rewritten partials
#TODOANTORA_SPECFILES = $(wildcard $(ANTORA_SPECMODULE)/partials/chapters/[A-Za-z]*.adoc $(ANTORA_SPECMODULE)/partials/chapters/*/[A-Za-z]*.adoc $(ANTORA_SPECMODULE)/partials/appendices/[A-Za-z]*.adoc)
#TODO

setup_refpages_antora:
	echo "Not transforming refpage source for Antora, yet"

#TODOsetup_refpages_antora: setup_spec_antora xrefMap pageMap $(GENREF) $(SCRIPTS)/reflib.py $(PYAPIMAP)
#TODO	     $(QUIET)$(MKDIR) $(ANTORA_EXTRACT_PAGES)
#TODO	     $(PYTHON) $(GENREF) -basedir $(ANTORA_EXTRACT_PAGES) \
#TODO		 -diag $(ANTORA_LOGPATH)/refpage.diag \
#TODO		 -warn $(ANTORA_LOGPATH)/refpage.warn \
#TODO		 -extpath $(ANTORA_SPECMODULE)/partials/appendices \
#TODO		 -antora \
#TODO		 -xrefMap $(PYXREFMAP) \
#TODO		 -pageMap $(PYPAGEMAP) \
#TODO		 -module 'openxr::' \
#TODO		 -nav $(ANTORA_REFMODULE)/nav.adoc \
#TODO		 $(EXTOPTIONS) $(ANTORA_SPECFILES)
#TODO	     $(QUIET)$(RM) $(ANTORA_REFMODULE)/partials && ln -s $(shell realpath $(ANTORA_SPECMODULE)/partials) $(ANTORA_REFMODULE)/partials
#TODO	     $(QUIET)$(RM) $(ANTORA_REFMODULE)/images && ln -s $(shell realpath $(ANTORA_SPECMODULE)/images) $(ANTORA_REFMODULE)/images
