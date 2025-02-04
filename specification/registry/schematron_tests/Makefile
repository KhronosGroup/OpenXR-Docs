#!/usr/bin/env make
# Copyright (c) 2019-2025 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

test: ensure_schxlst $(patsubst %.xml,%.xml.srvl,$(wildcard pass.*.xml fail.*.xml))
	@echo "**** Tests succeeded"
.PHONY: test

clean:
	-rm -f *.srvl
.PHONY: clean

QUIET := @

TO_DEV_NULL := > /dev/null

common_deps := ../registry.sch ../schematron.sh Makefile ensure_schxlst

ensure_schxlst:
	@echo "Retrieving/checking SchXslt tool..."
	$(QUIET)export REGISTRY_DIR=.. && . ../schematron.sh && ensureSchXslt
.PHONY: ensure_schxlst

pass.%.xml.srvl: pass.%.xml $(common_deps)
	@echo "[check] $<"
	$(QUIET)export REGISTRY_DIR=.. && . ../schematron.sh && if   runSchematron $< $(TO_DEV_NULL); then echo "[OK   ] $<"; else echo "[ERROR] $< (unexpected schema-fail)"; rm -f $@; exit 1; fi


fail.%.xml.srvl: fail.%.xml $(common_deps)
	@echo "[check] $<"
	$(QUIET)export REGISTRY_DIR=.. && . ../schematron.sh && if ! runSchematron $< $(TO_DEV_NULL); then echo "[OK   ] $<"; else echo "[ERROR] $< (unexpected schema-pass)"; rm -f $@; exit 1; fi

