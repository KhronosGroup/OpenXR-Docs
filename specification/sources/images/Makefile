#!/usr/bin/make -f
# Copyright 2013-2025 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

# Makefile to optimize images.
# Requires svgo: https://github.com/svg/svgo
# Requires scour: pipx install scour
# Also requires inkscape, drawio, imagemagick (convert), optipng

QUIET	   ?= @
CP         := cp -p
ECHO       := @echo
RM         := rm -f
MKDIR      := mkdir -p

DRAWIO     := drawio
INKSCAPE   := inkscape
MAGICK     := convert
OPTIPNG    := optipng
SVGO       := npx svgo
SCOUR      := scour

SCOUR_ARGS := \
  --enable-id-stripping \
  --strip-xml-prolog \
  --remove-descriptive-elements \
  --enable-comment-stripping \
  --no-line-breaks

SVGO_ARGS  := --final-newline --multipass --config ../../config/svgo-config.mjs

OPTIPNG_FLAGS := -o2 -fix

ifneq (,$(strip $(QUIET)))
OPTIPNG_ARGS += -q
SVGO_ARGS += --quiet
SCOUR_ARGS += --quiet
endif


###
# Default target
all:
.PHONY: all

###
#  Rules used later
define SCOUR_SVGO_RULE =
	$(ECHO) "[scour]     $< -> $@"
	$(QUIET)$(SCOUR) $(SCOUR_ARGS) -i "$<" -o "$@"
	$(ECHO) "[svgo]      $@"
	$(QUIET)$(SVGO) $(SVGO_ARGS) --input "$@"
endef

define SVGO_RULE =
	$(ECHO) "[svgo]      $@"
	$(QUIET)$(SVGO) $(SVGO_ARGS) --input "$<" --output "$@"
endef

define OPTIPNG_RULE =
	$(ECHO) "[optipng]   $< -> $@"
	$(QUIET)$(RM) "$@"
	$(QUIET)$(OPTIPNG) $(OPTIPNG_ARGS) "$<" -out "$@"
endef

define OPTIPNG_RULE_IN_PLACE=
	$(ECHO) "[optipng]   $@"
	$(QUIET)$(OPTIPNG) $(OPTIPNG_ARGS) "$@"
endef

define CP_RULE =
	$(ECHO) "[cp]        $< -> $@"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(CP) "$<" "$@"
endef

define RESIZE_RULE=
	$(ECHO) "[convert]   $< -> $@"
	$(QUIET)$(MAGICK) "$<" $(MAGICK_EXTRA) -resize $(TARGET_SIZE)\> "$@"
endef

define DRAWIO_PDF_RULE=
	$(ECHO) "[drawio]    $< -> $@"
	$(QUIET)$(MKDIR) "$(@D)"
	$(QUIET)$(DRAWIO) --crop --export --output "$@" "$<"
endef

define INKSCAPE_EXPORT_RULE=
	$(ECHO) "[inkscape]   $< -> $@"
	$(QUIET)$(INKSCAPE) --export-plain-svg --actions="file-open:$<; $(INKSCAPE_EXTRA_COMMANDS) export-filename:$@; export-do;"
endef

CONVERSION_TEMP := temp

###
# SVGs to remove drawio-exported warning text and optimize

# These behave badly with Scour, so only use svgo.

SVG_CLEANUP_SOURCES := \
  originals/hand_grip_pose.svg \
  originals/hand_pinch_orientation.svg \
  originals/hand_pinch_pose.svg \
  originals/hand_poke_pose.svg \
  originals/xr_msft_scene_understanding_plane_coordinate_system.svg


SVG_CLEANUP_DESTS := $(SVG_CLEANUP_SOURCES:originals/%=%)
SVG_CLEANUP_TEMP := $(SVG_CLEANUP_SOURCES:originals/%=$(CONVERSION_TEMP)/%)

$(SVG_CLEANUP_TEMP): $(CONVERSION_TEMP)/%.svg : originals/%.svg
	$(INKSCAPE_EXPORT_RULE)

$(SVG_CLEANUP_TEMP): INKSCAPE_EXTRA_COMMANDS = select-by-selector:switch>a; delete; select-by-element:foreignObject; delete;
CLEAN_FILES += $(SVG_CLEANUP_TEMP)

$(SVG_CLEANUP_DESTS): %.svg: $(CONVERSION_TEMP)/%.svg
	$(SVGO_RULE)

DEFAULT_OUTPUTS += $(SVG_CLEANUP_DESTS)

LICENSE_DESTS_FROM_ORIGINALS += $(SVG_CLEANUP_SOURCES:originals/%=%.license)

###
# SVGs to optimize

SVG_SOURCES := $(wildcard unoptimized/*.svg)
SVG_DESTS := $(SVG_SOURCES:unoptimized/%=%)
$(SVG_DESTS): %.svg: unoptimized/%.svg
	$(SCOUR_SVGO_RULE)

DEFAULT_OUTPUTS += $(SVG_DESTS)

LICENSE_DESTS_FROM_UNOPTIMIZED += $(SVG_SOURCES:unoptimized/%=%.license)

###
# PNGs that get resized

RESIZE_TO_210 := \
  XR_EYE_SHAPE_EYE_LEFT_BLINK_HTC.png \
  XR_EYE_SHAPE_EYE_LEFT_DOWN.png \
  XR_EYE_SHAPE_EYE_LEFT_LEFT.png \
  XR_EYE_SHAPE_EYE_LEFT_RIGHT.png \
  XR_EYE_SHAPE_EYE_LEFT_SQUEEZE_HTC.png \
  XR_EYE_SHAPE_EYE_LEFT_UP.png \
  XR_EYE_SHAPE_EYE_LEFT_WIDE_HTC.png \
  XR_EYE_SHAPE_EYE_RIGHT_BLINK_HTC.png \
  XR_EYE_SHAPE_EYE_RIGHT_DOWN.png \
  XR_EYE_SHAPE_EYE_RIGHT_LEFT.png \
  XR_EYE_SHAPE_EYE_RIGHT_RIGHT.png \
  XR_EYE_SHAPE_EYE_RIGHT_SQUEEZE_HTC.png \
  XR_EYE_SHAPE_EYE_RIGHT_UP.png \
  XR_EYE_SHAPE_EYE_RIGHT_WIDE_HTC.png \
  XR_LIP_SHAPE_CHEEK_PUFF_LEFT_HTC.png \
  XR_LIP_SHAPE_CHEEK_PUFF_RIGHT_HTC.png \
  XR_LIP_SHAPE_CHEEK_SUCK_HTC.png \
  XR_LIP_SHAPE_JAW_FORWARD_HTC.png \
  XR_LIP_SHAPE_JAW_LEFT_HTC.png \
  XR_LIP_SHAPE_JAW_OPEN_HTC.png \
  XR_LIP_SHAPE_JAW_RIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_APE_SHAPE_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_DOWNLEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_DOWNRIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_INSIDE_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_LEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_OVERLAY_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_OVERTURN_HTC.png \
  XR_LIP_SHAPE_MOUTH_LOWER_RIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_POUT_HTC.png \
  XR_LIP_SHAPE_MOUTH_STRETCHER_LEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_STRETCHER_RIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_RAISER_LEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_RAISER_RIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_INSIDE_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_LEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_OVERTURN_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_RIGHT_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_UPLEFT_HTC.png \
  XR_LIP_SHAPE_MOUTH_UPPER_UPRIGHT_HTC.png \
  XR_LIP_SHAPE_TONGUE_DOWN_HTC.png \
  XR_LIP_SHAPE_TONGUE_LEFT_HTC.png \
  XR_LIP_SHAPE_TONGUE_LONGSTEP1_HTC.png \
  XR_LIP_SHAPE_TONGUE_LONGSTEP2_HTC.png \
  XR_LIP_SHAPE_TONGUE_RIGHT_HTC.png \
  XR_LIP_SHAPE_TONGUE_ROLL_HTC.png \
  XR_LIP_SHAPE_TONGUE_UP_HTC.png \
  o_shape.png

RESIZE_TO_150 := \
  XR_LIP_SHAPE_TONGUE_DOWNLEFT_MORPH_HTC_correct.png \
  XR_LIP_SHAPE_TONGUE_DOWNLEFT_MORPH_HTC_error.png \
  XR_LIP_SHAPE_TONGUE_DOWNRIGHT_MORPH_HTC_correct.png \
  XR_LIP_SHAPE_TONGUE_DOWNRIGHT_MORPH_HTC_error.png \
  XR_LIP_SHAPE_TONGUE_UPLEFT_MORPH_HTC_correct.png \
  XR_LIP_SHAPE_TONGUE_UPLEFT_MORPH_HTC_error.png \
  XR_LIP_SHAPE_TONGUE_UPRIGHT_MORPH_HTC_correct.png \
  XR_LIP_SHAPE_TONGUE_UPRIGHT_MORPH_HTC_error.png

RESIZED_DESTS := $(RESIZE_TO_210) $(RESIZE_TO_150)
$(RESIZED_DESTS): %.png: unoptimized/%.png
	$(RESIZE_RULE)
	$(OPTIPNG_RULE_IN_PLACE)

# Set this variable per group of targets to control the output size
$(RESIZE_TO_210): TARGET_SIZE := 210x210
$(RESIZE_TO_150): TARGET_SIZE := 150x300

DEFAULT_OUTPUTS += $(RESIZED_DESTS)

LICENSE_DESTS_FROM_UNOPTIMIZED += $(RESIZED_DESTS:%=%.license)

###
# Other PNGs that just get optimized

PNG_SOURCES := $(filter-out $(RESIZED_DESTS:%=unoptimized/%),$(wildcard unoptimized/*.png))
PNG_DESTS := $(PNG_SOURCES:unoptimized/%=%)
PNG_LICENSE_DESTS := $(PNG_SOURCES:unoptimized/%=%.license)

$(PNG_DESTS): %.png: unoptimized/%.png
	$(OPTIPNG_RULE)

DEFAULT_OUTPUTS += $(PNG_DESTS)
LICENSE_DESTS_FROM_UNOPTIMIZED += $(PNG_SOURCES:unoptimized/%=%.license)

###
# License files from unoptimized/
$(LICENSE_DESTS_FROM_UNOPTIMIZED): %.license: unoptimized/%.license
	$(CP_RULE)

DEFAULT_OUTPUTS += $(LICENSE_DESTS_FROM_UNOPTIMIZED)

###
# Export from drawio and optimize
DRAWIO_SOURCES := \
  originals/fb_trimesh_states.drawio \
  originals/lifecycle.drawio \
  originals/ext_future_lifecycle.drawio

DRAWIO_PDF_TEMP = $(DRAWIO_SOURCES:originals/%.drawio=$(CONVERSION_TEMP)/%.pdf)
DRAWIO_TEMPSVG_DESTS = $(DRAWIO_SOURCES:originals/%.drawio=$(CONVERSION_TEMP)/%.svg)
DRAWIO_SVG_DESTS = $(DRAWIO_SOURCES:originals/%.drawio=%.svg)

$(DRAWIO_PDF_TEMP): $(CONVERSION_TEMP)/%.pdf : originals/%.drawio
	$(DRAWIO_PDF_RULE)

CLEAN_FILES += $(DRAWIO_PDF_TEMP)

$(DRAWIO_TEMPSVG_DESTS): %.svg : %.pdf
	$(INKSCAPE_EXPORT_RULE)

CLEAN_FILES += $(DRAWIO_TEMPSVG_DESTS)

$(DRAWIO_SVG_DESTS): %.svg : $(CONVERSION_TEMP)/%.svg
	$(SCOUR_SVGO_RULE)

DEFAULT_OUTPUTS += $(DRAWIO_SVG_DESTS)

###
# License files for SVGs exported from drawio files
DRAWIO_LICENSE_DESTS := $(DRAWIO_SOURCES:originals/%.drawio=%.svg.license)
$(DRAWIO_LICENSE_DESTS): %.svg.license: originals/%.drawio.license
	$(CP_RULE)

DEFAULT_OUTPUTS += $(DRAWIO_LICENSE_DESTS)

###
# License files from originals/ (with same extension)
$(LICENSE_DESTS_FROM_ORIGINALS): %.license: originals/%.license
	$(CP_RULE)

DEFAULT_OUTPUTS += $(LICENSE_DESTS_FROM_ORIGINALS)

###
# make "all" depend on all default outputs
all: $(DEFAULT_OUTPUTS)

###
# Single common clean target
CLEAN_FILES += $(DEFAULT_OUTPUTS)
clean:
	$(RM) $(CLEAN_FILES)
.PHONY: clean
