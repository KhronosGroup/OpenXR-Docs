#!/usr/bin/make -f
# Copyright 2013-2026 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

# Makefile to optimize images.
# Requires svgo: https://github.com/svg/svgo
# Requires scour: pipx install scour
# Also requires inkscape, drawio, imagemagick (convert), optipng, pngquant, zopflipng

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
PNGQUANT   := pngquant
ZOPFLIPNG  := zopflipng

SCOUR_ARGS := \
  --enable-id-stripping \
  --strip-xml-prolog \
  --remove-descriptive-elements \
  --enable-comment-stripping \
  --no-line-breaks

SVGO_ARGS  := --final-newline --multipass --config ../../config/svgo-config.mjs

OPTIPNG_FLAGS := -o2 -fix

PNGQUANT_ARGS := --force --speed 1 --quality 5-20

ZOPFLIPNG_ARGS := -m -y

ifneq (,$(strip $(QUIET)))
OPTIPNG_ARGS += -q
SVGO_ARGS += --quiet
SCOUR_ARGS += --quiet
ZOPFLIPNG_TRAILING_ARGS := > /dev/null
endif


###
# Default target
all:
.PHONY: all

CONVERSION_TEMP := temp

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

define PNGQUANT_RULE =
	$(ECHO) "[pngquant]  $< -> $@"
	$(QUIET)$(RM) "$@"
	$(QUIET)$(PNGQUANT) $(PNGQUANT_ARGS) "$<" --output "$@"
endef

define ZOPFLIPNG_RULE =
	$(ECHO) "[zopflipng] $< -> $@"
	$(QUIET)$(ZOPFLIPNG) $(ZOPFLIPNG_ARGS) "$<" "$@" $(ZOPFLIPNG_TRAILING_ARGS)
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

HANDLED_SRC_PNG += $(RESIZED_DESTS:%=unoptimized/%)
DEFAULT_OUTPUTS += $(RESIZED_DESTS)

LICENSE_DESTS_FROM_UNOPTIMIZED += $(RESIZED_DESTS:%=%.license)

###
# turn to JPEG, with some resize

SHRINK_AND_JPG := XR_FACE_EXPRESSION_BROW_DROP_L_BD.jpg \
  XR_FACE_EXPRESSION_BROW_DROP_R_BD.jpg \
  XR_FACE_EXPRESSION_BROW_INNER_UPWARDS_BD.jpg \
  XR_FACE_EXPRESSION_BROW_OUTER_UPWARDS_L_BD.jpg \
  XR_FACE_EXPRESSION_BROW_OUTER_UPWARDS_R_BD.jpg \
  XR_FACE_EXPRESSION_CHEEK_PUFF_BD.jpg \
  XR_FACE_EXPRESSION_CHEEK_SQUINT_L_BD.jpg \
  XR_FACE_EXPRESSION_CHEEK_SQUINT_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_BLINK_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_BLINK_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_DROP_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_DROP_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_IN_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_IN_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_OUT_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_OUT_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_SQUINT_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_SQUINT_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_UPWARDS_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_UPWARDS_R_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_WIDE_L_BD.jpg \
  XR_FACE_EXPRESSION_EYE_LOOK_WIDE_R_BD.jpg \
  XR_FACE_EXPRESSION_JAW_FORWARD_BD.jpg \
  XR_FACE_EXPRESSION_JAW_L_BD.jpg \
  XR_FACE_EXPRESSION_JAW_OPEN_BD.jpg \
  XR_FACE_EXPRESSION_JAW_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_CLOSE_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_DIMPLE_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_DIMPLE_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_FROWN_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_FROWN_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_FUNNEL_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_LOWER_DROP_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_LOWER_DROP_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_PRESS_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_PRESS_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_PUCKER_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_ROLL_LOWER_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_ROLL_UPPER_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_SHRUG_LOWER_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_SHRUG_UPPER_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_SMILE_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_SMILE_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_STRETCH_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_STRETCH_R_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_UPPER_UPWARDS_L_BD.jpg \
  XR_FACE_EXPRESSION_MOUTH_UPPER_UPWARDS_R_BD.jpg \
  XR_FACE_EXPRESSION_NOSE_SNEER_L_BD.jpg \
  XR_FACE_EXPRESSION_NOSE_SNEER_R_BD.jpg \
  XR_FACE_EXPRESSION_TONGUE_OUT_BD.jpg \
  XR_LIP_EXPRESSION_CH_BD.jpg \
  XR_LIP_EXPRESSION_DD_BD.jpg \
  XR_LIP_EXPRESSION_E_BD.jpg \
  XR_LIP_EXPRESSION_FF_BD.jpg \
  XR_LIP_EXPRESSION_I_BD.jpg \
  XR_LIP_EXPRESSION_LAA_BD.jpg \
  XR_LIP_EXPRESSION_LE_BD.jpg \
  XR_LIP_EXPRESSION_LI_BD.jpg \
  XR_LIP_EXPRESSION_LKK_BD.jpg \
  XR_LIP_EXPRESSION_LNN_BD.jpg \
  XR_LIP_EXPRESSION_LO_BD.jpg \
  XR_LIP_EXPRESSION_LU_BD.jpg \
  XR_LIP_EXPRESSION_O_BD.jpg \
  XR_LIP_EXPRESSION_PP_BD.jpg \
  XR_LIP_EXPRESSION_RR_BD.jpg \
  XR_LIP_EXPRESSION_SS_BD.jpg \
  XR_LIP_EXPRESSION_TH_BD.jpg \
  XR_LIP_EXPRESSION_U_BD.jpg \
  XR_LIP_EXPRESSION_XX_BD.jpg

$(SHRINK_AND_JPG): TARGET_SIZE := 210x210

# PNG_TO_JPG :=

# $(PNG_TO_JPG): TARGET_SIZE := 100%

RESIZE_AND_JPG_DESTS := $(SHRINK_AND_JPG) $(PNG_TO_JPG)
$(RESIZE_AND_JPG_DESTS): %.jpg: unoptimized/%.png
	$(RESIZE_RULE)

DEFAULT_OUTPUTS += $(RESIZE_AND_JPG_DESTS)
LICENSE_DESTS_JPG_FROM_UNOPTIMIZED_PNG += $(RESIZE_AND_JPG_DESTS:%=%.license)

$(LICENSE_DESTS_JPG_FROM_UNOPTIMIZED_PNG): %.jpg.license: unoptimized/%.png.license
	$(CP_RULE)
DEFAULT_OUTPUTS += $(LICENSE_DESTS_JPG_FROM_UNOPTIMIZED_PNG)

HANDLED_SRC_PNG += $(RESIZE_AND_JPG_DESTS:%.jpg=unoptimized/%.png)

###
# Do a second resize and jpg, but for PDF (hi-res) usage

LESS_SHRUNK_DIR := hires
LESS_SHRUNK_JPG := $(SHRINK_AND_JPG:%=$(LESS_SHRUNK_DIR)/%)

$(LESS_SHRUNK_DIR):
	$(QUIET)$(MKDIR) $@

$(LESS_SHRUNK_JPG): $(LESS_SHRUNK_DIR)/%.jpg: unoptimized/%.png $(LESS_SHRUNK_DIR)
	$(RESIZE_RULE)
$(LESS_SHRUNK_JPG): TARGET_SIZE := 420x420

DEFAULT_OUTPUTS += $(LESS_SHRUNK_JPG)

LESS_SHRUNK_LICENSES := $(LESS_SHRUNK_JPG:%=%.license)
$(LESS_SHRUNK_LICENSES): $(LESS_SHRUNK_DIR)/%.jpg.license: unoptimized/%.png.license
	$(CP_RULE)
DEFAULT_OUTPUTS += $(LESS_SHRUNK_LICENSES)

###
# pngquant (+zopflipng) is the better way to save size for some

PNGQUANT_ZOPFLI_DESTS := bd_body_tracking_joint_convention.png

# first do pngquant
PNGQUANT_TEMP_DESTS := $(PNGQUANT_ZOPFLI_DESTS:%=$(CONVERSION_TEMP)/%)
$(PNGQUANT_TEMP_DESTS): $(CONVERSION_TEMP)/%: unoptimized/%
	$(QUIET)$(MKDIR) $(CONVERSION_TEMP)
	$(PNGQUANT_RULE)

# then zopflipng
$(PNGQUANT_ZOPFLI_DESTS): %: $(CONVERSION_TEMP)/%
	$(ZOPFLIPNG_RULE)

DEFAULT_OUTPUTS += $(PNGQUANT_ZOPFLI_DESTS)
LICENSE_DESTS_FROM_UNOPTIMIZED += $(PNGQUANT_ZOPFLI_DESTS:%=%.license)

HANDLED_SRC_PNG += $(PNGQUANT_ZOPFLI_DESTS:%=unoptimized/%)

###
# Other PNGs that just get optimized

PNG_SOURCES := $(filter-out $(HANDLED_SRC_PNG),$(wildcard unoptimized/*.png))
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

jpg: $(filter %.jpg,$(DEFAULT_OUTPUTS)) $(filter %.jpg.license,$(DEFAULT_OUTPUTS))
.PHONY: jpg

png: $(filter %.png,$(DEFAULT_OUTPUTS)) $(filter %.png.license,$(DEFAULT_OUTPUTS))
.PHONY: png

license: $(filter %.license,$(DEFAULT_OUTPUTS))
.PHONY: license

###
# Single common clean target
CLEAN_FILES += $(DEFAULT_OUTPUTS)
clean:
	$(RM) $(CLEAN_FILES)
.PHONY: clean

clean-jpg:
	$(RM) $(filter %.jpg,$(DEFAULT_OUTPUTS))
.PHONY: clean-jpg


clean-png:
	$(RM) $(filter %.png,$(DEFAULT_OUTPUTS))
.PHONY: clean-png
