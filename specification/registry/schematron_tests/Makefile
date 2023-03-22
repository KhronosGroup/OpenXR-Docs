
# Copyright (c) 2019-2023, The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

test: ensure_schxlst $(patsubst %.xml,%.xml.srvl,$(wildcard pass.*.xml fail.*.xml))
	@echo "**** Tests succeeded"
.PHONY: test

clean:
	-rm -f *.srvl
.PHONY: clean

common_deps := ../registry.sch ../schematron.sh Makefile

ensure_schxlst:
	@echo "Retrieving/checking SchXslt tool..."
	@export REGISTRY_DIR=.. && . ../schematron.sh && ensureSchXslt
.PHONY: ensure_schxlst

pass.%.xml.srvl: pass.%.xml $(common_deps)
	@echo ""
	@echo "*** Expected schema-pass test:       $<"
	@export REGISTRY_DIR=.. && . ../schematron.sh && if runSchematron $<; then echo "**** OK"; else echo "**** ERROR (unexpected schema-fail)"; exit 1; fi


fail.%.xml.srvl: fail.%.xml $(common_deps)
	@echo ""
	@echo "*** Expected schema-fail test:       $<"
	@export REGISTRY_DIR=.. && . ../schematron.sh && if ! runSchematron $< > /dev/null; then echo "**** OK (expected schema-fail)"; else echo "**** ERROR (unexpected schema-pass)"; exit 1; fi

