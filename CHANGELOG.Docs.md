# Changelog for OpenXR-Docs and OpenXR-Registry Repos

<!--
Copyright (c) 2019-2025 The Khronos Group Inc.

SPDX-License-Identifier: CC-BY-4.0
-->

Update log for the OpenXR-Docs and OpenXR-Registry repos on GitHub. Updates are
in reverse chronological order starting with the latest public release.

This summarizes the periodic public updates, not individual commits. Updates on
GitHub are generally done as single large patches at the release point,
collecting together the resolution of many Khronos internal issues, along with
any public pull requests that have been accepted.

This changelog only lists changes that affect the registry,
headers, and/or specification text.

## OpenXR Specification 1.1.47 (2025-04-08)

This release features several new vendor extensions, one of which required a
modification to the XML schema for extending interaction profiles to represent
accurate. There are also a few minor fixes and clarifications.

- Registry
  - Addition to XML registry schema: Specify interaction profile additions by
    constructing a predicate, and allow adding new top level /user paths to
    existing profiles. See SDK changelog and style guide for details.
    ([internal MR 2467](https://gitlab.khronos.org/openxr/openxr/merge_requests/2467))
  - Chore: Reserve extension numbers.
    ([internal MR 3729](https://gitlab.khronos.org/openxr/openxr/merge_requests/3729),
    [internal MR 3744](https://gitlab.khronos.org/openxr/openxr/merge_requests/3744),
    [internal MR 3745](https://gitlab.khronos.org/openxr/openxr/merge_requests/3745))
  - Fix: Reflect requirement of `XR_META_hand_tracking_microgestures` for
    `XR_EXT_hand_interaction` in `xr.xml`.
    ([internal MR 3741](https://gitlab.khronos.org/openxr/openxr/merge_requests/3741))
  - Fix: Added missing comment on `XR_EYE_POSITION_COUNT_FB` to remove warning
    during build.
    ([internal MR 3748](https://gitlab.khronos.org/openxr/openxr/merge_requests/3748))
  - Fix: typo in the documentation of `XR_ERROR_SPACE_GROUP_NOT_FOUND_META`
    ([internal MR 3749](https://gitlab.khronos.org/openxr/openxr/merge_requests/3749))
  - Improvement: Fix schematron runner on Mac.
    ([internal MR 3759](https://gitlab.khronos.org/openxr/openxr/merge_requests/3759))
  - New vendor extension: `XR_META_detached_controllers`
    ([internal MR 2467](https://gitlab.khronos.org/openxr/openxr/merge_requests/2467))
  - New vendor extension: `XR_BD_spatial_sensing`
    ([internal MR 3429](https://gitlab.khronos.org/openxr/openxr/merge_requests/3429))
  - New vendor extension: `XR_BD_spatial_anchor`
    ([internal MR 3435](https://gitlab.khronos.org/openxr/openxr/merge_requests/3435))
  - New vendor extension: `XR_BD_spatial_anchor_sharing`
    ([internal MR 3436](https://gitlab.khronos.org/openxr/openxr/merge_requests/3436))
  - New vendor extension: `XR_BD_spatial_scene`
    ([internal MR 3438](https://gitlab.khronos.org/openxr/openxr/merge_requests/3438))
  - New vendor extension: `XR_BD_spatial_mesh`
    ([internal MR 3439](https://gitlab.khronos.org/openxr/openxr/merge_requests/3439))
  - schema: Allow aliases of function pointers, primarily for use in extension
    promotion.
    ([internal MR 2989](https://gitlab.khronos.org/openxr/openxr/merge_requests/2989))
- Specification
  - Addition to XML registry schema: Specify interaction profile additions by
    constructing a predicate, and allow adding new top level /user paths to
    existing profiles. Recommend using the Python module
    `src/scripts/interaction_profile_processor.py` for interpreting this data, if
    you maintain scripts that process the interaction profiles in XML.
    ([internal MR 2467](https://gitlab.khronos.org/openxr/openxr/merge_requests/2467))
  - Fix: inconsistent typo, versions are packed into 64 bits, not 32.
    ([internal MR 3764](https://gitlab.khronos.org/openxr/openxr/merge_requests/3764),
    [internal issue 2478](https://gitlab.khronos.org/openxr/openxr/issues/2478),
    [OpenXR-Docs issue 184](https://github.com/KhronosGroup/OpenXR-Docs/issues/184))
  - Improvement: Clarify that if an environment blend mode is enumerated by
    `xrEnumerateEnvironmentBlendModes`, the runtime must not return
    `XR_ERROR_ENVIRONMENT_BLEND_MODE_UNSUPPORTED` from `xrEndFrame` using that
    blend mode.
    ([internal MR 3761](https://gitlab.khronos.org/openxr/openxr/merge_requests/3761))
  - Improvement: Minor formatting fixes.
    ([internal MR 3763](https://gitlab.khronos.org/openxr/openxr/merge_requests/3763))
  - New vendor extension specification: `XR_META_detached_controllers` allows use
    of controllers even when the user is not holding them.
    ([internal MR 2467](https://gitlab.khronos.org/openxr/openxr/merge_requests/2467))
  - New vendor extension specification: `XR_BD_spatial_sensing` providing the base
    of spatial entities capabilities on ByteDance devices.
    ([internal MR 3429](https://gitlab.khronos.org/openxr/openxr/merge_requests/3429),
    [internal MR 3776](https://gitlab.khronos.org/openxr/openxr/merge_requests/3776))
  - New vendor extension specification: `XR_BD_spatial_anchor` providing the
    ability to define arbitrary anchors on ByteDance devices.
    ([internal MR 3435](https://gitlab.khronos.org/openxr/openxr/merge_requests/3435),
    [internal MR 3769](https://gitlab.khronos.org/openxr/openxr/merge_requests/3769),
    [internal MR 3770](https://gitlab.khronos.org/openxr/openxr/merge_requests/3770),
    [internal MR 3776](https://gitlab.khronos.org/openxr/openxr/merge_requests/3776))
  - New vendor extension specification: Add `XR_BD_spatial_anchor_sharing` allowing
    created spatial anchors to be shared on ByteDance devices.
    ([internal MR 3436](https://gitlab.khronos.org/openxr/openxr/merge_requests/3436))
  - New vendor extension specification: `XR_BD_spatial_scene` providing access to
    scene scanning on ByteDance devices.
    ([internal MR 3438](https://gitlab.khronos.org/openxr/openxr/merge_requests/3438),
    [internal MR 3769](https://gitlab.khronos.org/openxr/openxr/merge_requests/3769),
    [internal MR 3770](https://gitlab.khronos.org/openxr/openxr/merge_requests/3770))
  - New vendor extension specification: `XR_BD_spatial_mesh` providing access to
    meshes on ByteDance devices.
    ([internal MR 3439](https://gitlab.khronos.org/openxr/openxr/merge_requests/3439),
    [internal MR 3770](https://gitlab.khronos.org/openxr/openxr/merge_requests/3770),
    [internal MR 3776](https://gitlab.khronos.org/openxr/openxr/merge_requests/3776))

## OpenXR Specification 1.1.46 (2025-03-04)

This release includes a new ratified Khronos extension, new vendor extensions,
and the ratification of several existing multi-vendor extensions. (Ratification
of `EXT` extensions primarily affects runtime developers; see the extension
process link in the following changelogs for details.) This release also makes
some small usability improvements to the generated components of the
specification.

- Registry
  - Improvement: Ratify a list of shared vendor extensions as well as add support
    for the 'ratified' attribute in XML and html generation. See
    <https://registry.khronos.org/OpenXR/specs/1.1/extprocess.html> for more
    information.
    ([internal MR 3494](https://gitlab.khronos.org/openxr/openxr/merge_requests/3494),
    [internal issue 2404](https://gitlab.khronos.org/openxr/openxr/issues/2404),
    [internal MR 3677](https://gitlab.khronos.org/openxr/openxr/merge_requests/3677))
  - New ratified Khronos extension: `XR_KHR_extended_struct_name_lengths`
    ([internal MR 3254](https://gitlab.khronos.org/openxr/openxr/merge_requests/3254),
    [internal issue 1664](https://gitlab.khronos.org/openxr/openxr/issues/1664))
  - New vendor extension: `XR_LOGITECH_mx_ink_stylus_interaction`
    ([internal MR 3242](https://gitlab.khronos.org/openxr/openxr/merge_requests/3242),
    [internal MR 3583](https://gitlab.khronos.org/openxr/openxr/merge_requests/3583),
    [internal MR 3584](https://gitlab.khronos.org/openxr/openxr/merge_requests/3584),
    [internal MR 3585](https://gitlab.khronos.org/openxr/openxr/merge_requests/3585))
  - New vendor extension: `XR_META_hand_tracking_microgestures`
    ([internal MR 3433](https://gitlab.khronos.org/openxr/openxr/merge_requests/3433),
    [internal MR 3725](https://gitlab.khronos.org/openxr/openxr/merge_requests/3725))
  - Chore: Reserve extension numbers.
    ([internal MR 3701](https://gitlab.khronos.org/openxr/openxr/merge_requests/3701),
    [internal MR 3711](https://gitlab.khronos.org/openxr/openxr/merge_requests/3711),
    [internal MR 3722](https://gitlab.khronos.org/openxr/openxr/merge_requests/3722))
  - Chore: Register Sony author ID.
    ([internal MR 3709](https://gitlab.khronos.org/openxr/openxr/merge_requests/3709))
  - Fix: XML contained incorrect paths for dpad emulation bindings for
    `.../bytedance/pico_neo3_controller`, `.../bytedance/pico4_controller`,
    `.../bytedance/pico_g3_controller`, `.../yvr/touch_controller_yvr`, and
    `.../microsoft/xbox_controller`.
    ([internal MR 3674](https://gitlab.khronos.org/openxr/openxr/merge_requests/3674))
- Specification
  - Clarify: Improve usage examples provided in the `XrActionSet` specification.
    ([internal MR 3653](https://gitlab.khronos.org/openxr/openxr/merge_requests/3653))
  - Improvement: Add missing definition of `XR_MAX_RESULT_STRING_SIZE` and
    `XR_MAX_STRUCTURE_NAME_SIZE` into the specification document.
    ([internal MR 3254](https://gitlab.khronos.org/openxr/openxr/merge_requests/3254))
  - Improvement: Show ratification status of each extension in the common metadata
    block.
    ([internal MR 3494](https://gitlab.khronos.org/openxr/openxr/merge_requests/3494),
    [internal issue 2404](https://gitlab.khronos.org/openxr/openxr/issues/2404),
    [internal MR 3677](https://gitlab.khronos.org/openxr/openxr/merge_requests/3677))
  - Improvement: Update `xrconventions.py` to allow standalone headers to be produced
    for protected extensions.
    ([internal MR 3558](https://gitlab.khronos.org/openxr/openxr/merge_requests/3558),
    [internal MR 3515](https://gitlab.khronos.org/openxr/openxr/merge_requests/3515))
  - New ratified Khronos extension specification:
    `XR_KHR_extended_struct_name_lengths`, providing the ability to retrieve
    structure names longer than the current limit, and unblocking extensions using
    longer structure names in order to conform with naming conventions.
    ([internal MR 3254](https://gitlab.khronos.org/openxr/openxr/merge_requests/3254),
    [internal issue 1664](https://gitlab.khronos.org/openxr/openxr/issues/1664))
  - New vendor extension: `XR_META_hand_tracking_microgestures`, which extends the
    `/interaction_profiles/ext/hand_interaction_ext` interaction profile with
    additional gestures.
    ([internal MR 3433](https://gitlab.khronos.org/openxr/openxr/merge_requests/3433),
    [internal MR 3725](https://gitlab.khronos.org/openxr/openxr/merge_requests/3725))
  - New vendor extension specification: `XR_LOGITECH_mx_ink_stylus_interaction`,
    which adds an interaction profile for a tracked stylus input device.
    ([internal MR 3242](https://gitlab.khronos.org/openxr/openxr/merge_requests/3242),
    [internal MR 3583](https://gitlab.khronos.org/openxr/openxr/merge_requests/3583),
    [internal MR 3584](https://gitlab.khronos.org/openxr/openxr/merge_requests/3584),
    [internal MR 3585](https://gitlab.khronos.org/openxr/openxr/merge_requests/3585))
  - Update: Revise the Extension Process document to reflect available ratification
    of EXT extensions.
    ([internal MR 3494](https://gitlab.khronos.org/openxr/openxr/merge_requests/3494),
    [internal issue 2404](https://gitlab.khronos.org/openxr/openxr/issues/2404),
    [internal MR 3677](https://gitlab.khronos.org/openxr/openxr/merge_requests/3677))
  - scripts: Indicate deprecated enumerants in generated C code embedded in the
    specification.
    ([internal MR 3666](https://gitlab.khronos.org/openxr/openxr/merge_requests/3666))
  - scripts: Indicate promotion status in extension TOC.
    ([internal MR 3666](https://gitlab.khronos.org/openxr/openxr/merge_requests/3666))
  - scripts: Removed usage of externally-hosted icon font in ref pages.
    ([internal MR 3666](https://gitlab.khronos.org/openxr/openxr/merge_requests/3666))
  - scripts: Partial synchronization of spec toolchain scripts with Vulkan.
    ([internal MR 3666](https://gitlab.khronos.org/openxr/openxr/merge_requests/3666))

## OpenXR Specification 1.1.45 (2025-02-05)

This release includes a new multi-vendor extension, a new vendor extension, and
a number of cleanups to the specification and included sample code.

Note that specification release 1.1.44 was skipped to keep up with a monthly
cadence for patch releases.

- Registry
  - Extension reservation: Reserve 15 extensions for EpicGames.
    ([internal MR 3649](https://gitlab.khronos.org/openxr/openxr/merge_requests/3649))
  - Improvement: Clean up spacing in some functions, improving specification and
    header output appearance.
    ([internal MR 3660](https://gitlab.khronos.org/openxr/openxr/merge_requests/3660))
  - New multi-vendor extension: `XR_EXT_frame_synthesis`
    ([internal MR 2200](https://gitlab.khronos.org/openxr/openxr/merge_requests/2200),
    [OpenXR-Docs PR 122](https://github.com/KhronosGroup/OpenXR-Docs/pull/122))
  - New vendor extension: `XR_BD_body_tracking`
    ([internal MR 2867](https://gitlab.khronos.org/openxr/openxr/merge_requests/2867))
- Specification
  - Fix: Correct type name mentioned as element type of
    `XrSpaceLocations::locations` in prose so it matches the XML and header.
    ([internal MR 3639](https://gitlab.khronos.org/openxr/openxr/merge_requests/3639))
  - Fix: Add missing palm pose, grip surface, and hand interaction notices to
    `XR_FB_touch_controller_pro` and `XR_META_touch_controller_plus`.
    ([internal MR 3647](https://gitlab.khronos.org/openxr/openxr/merge_requests/3647))
  - Fix: Correctly initialize a `XrSystemProperties` structure in
    `XR_EXT_user_presence` specification sample code.
    ([internal MR 3659](https://gitlab.khronos.org/openxr/openxr/merge_requests/3659))
  - Fix: Correctly initialize a `XrSystemProperties` structure in
    `XR_EXT_plane_detection` specification sample code.
    ([internal MR 3659](https://gitlab.khronos.org/openxr/openxr/merge_requests/3659))
  - Improvement: Style changes to specification of event structures, to improve
    usability of generated ref pages.
    ([internal MR 3136](https://gitlab.khronos.org/openxr/openxr/merge_requests/3136))
  - Improvement: scripts: Fix extraction of sample code from specification for
    compilation testing.
    ([internal MR 3659](https://gitlab.khronos.org/openxr/openxr/merge_requests/3659))
  - New multi-vendor extension specification: `XR_EXT_frame_synthesis` allows
    submitting motion vector images to improve frame synthesis.
    ([internal MR 2200](https://gitlab.khronos.org/openxr/openxr/merge_requests/2200),
    [OpenXR-Docs PR 122](https://github.com/KhronosGroup/OpenXR-Docs/pull/122))
  - New vendor extension: `XR_BD_body_tracking` allowing applications to receive
    joint-based tracking data for a human body.
    ([internal MR 2867](https://gitlab.khronos.org/openxr/openxr/merge_requests/2867))

## OpenXR Specification 1.1.43 (2024-11-27)

This release has a few clarifications and fixes, as well as several new vendor
extensions.

- Registry
  - Bump version of `XR_KHR_vulkan_swapchain_format_list` and note that it depends
    on either `XR_KHR_vulkan_enable` or `XR_KHR_vulkan_enable2`.
    ([internal MR 3418](https://gitlab.khronos.org/openxr/openxr/merge_requests/3418))
  - Fix: Correctly mark `XR_FB_touch_controller_pro` and
    `XR_META_touch_controller_plus` as promoted to 1.1.
    ([internal MR 3586](https://gitlab.khronos.org/openxr/openxr/merge_requests/3586))
  - Improvement: Small XML formatting/organization cleanups.
    ([internal MR 3610](https://gitlab.khronos.org/openxr/openxr/merge_requests/3610))
  - New vendor extension: `XR_ML_facial_expression`
    ([internal MR 3100](https://gitlab.khronos.org/openxr/openxr/merge_requests/3100))
  - New vendor extension: `XR_META_passthrough_layer_resumed_event`
    ([internal MR 3106](https://gitlab.khronos.org/openxr/openxr/merge_requests/3106))
  - New vendor extensions: `XR_META_colocation_discovery`,
    `XR_META_spatial_entity_sharing`, and `XR_META_spatial_entity_group_sharing`
    ([internal MR 2782](https://gitlab.khronos.org/openxr/openxr/merge_requests/2782))
  - Reservation: Reserve numbers for spatial extensions.
    ([internal MR 3577](https://gitlab.khronos.org/openxr/openxr/merge_requests/3577))
- Specification
  - Clarify: Improve the Input and Semantic Paths chapters by reducing the number
    of undefined or conflated terms used and improving consistency.
    ([internal MR 3443](https://gitlab.khronos.org/openxr/openxr/merge_requests/3443))
  - Fix: Correct extension reference in `XR_KHR_vulkan_swapchain_format_list` and
    clarify "being used" to not just mean "enabled".
    ([internal MR 3418](https://gitlab.khronos.org/openxr/openxr/merge_requests/3418))
  - Fix: The parent of an action space is a XrSession.
    ([internal MR 3601](https://gitlab.khronos.org/openxr/openxr/merge_requests/3601),
    [OpenXR-Docs issue 178](https://github.com/KhronosGroup/OpenXR-Docs/issues/178),
    [internal issue 2395](https://gitlab.khronos.org/openxr/openxr/issues/2395))
  - Improvement: Clarify XR_EXT_future code example for two-call idiom.
    ([internal MR 3578](https://gitlab.khronos.org/openxr/openxr/merge_requests/3578))
  - Improvement: Note the changes made when promoting `XR_FB_touch_controller_pro`
    and `XR_META_touch_controller_plus` to OpenXR 1.1.
    ([internal MR 3586](https://gitlab.khronos.org/openxr/openxr/merge_requests/3586))
  - New vendor extension: `XR_META_passthrough_layer_resumed_event` allowing
    applications to receive feedback from `XR_FB_passthrough`
    ([internal MR 3106](https://gitlab.khronos.org/openxr/openxr/merge_requests/3106))
  - New vendor extension specification: `XR_META_colocation_discovery` - allowing
    advertisement and discovery of other devices, physically colocated, running the
    same app.
    ([internal MR 2782](https://gitlab.khronos.org/openxr/openxr/merge_requests/2782),
    [internal MR 3604](https://gitlab.khronos.org/openxr/openxr/merge_requests/3604),
    [internal MR 3605](https://gitlab.khronos.org/openxr/openxr/merge_requests/3605))
  - New vendor extension specification: `XR_ML_facial_expression` providing access
    to face tracking on supported devices, with a custom subset of blend shapes
    possible.
    ([internal MR 3100](https://gitlab.khronos.org/openxr/openxr/merge_requests/3100))
  - New vendor extension specifications: `XR_META_spatial_entity_sharing`, and
    `XR_META_spatial_entity_group_sharing` - an updated way to share vendor-
    specific spatial entities.
    ([internal MR 2782](https://gitlab.khronos.org/openxr/openxr/merge_requests/2782),
    [internal MR 3605](https://gitlab.khronos.org/openxr/openxr/merge_requests/3605))

## OpenXR Specification 1.1.42 (2024-10-25)

This release contains a collection of specification clarifications, an updated
vendor extension with renamed enumerants, and substantial improvements and fixes
to the XML registry, particularly the description of interaction profiles.

- Registry
  - Fix: Update schema to reflect that `XrPathString_t` should allow dash in
    interaction profile paths.
    ([internal MR 3493](https://gitlab.khronos.org/openxr/openxr/merge_requests/3493))
  - Fix: `XR_VARJO_xr4_controller_interaction` did not properly define its
    interaction profile in XML.
    ([internal MR 3493](https://gitlab.khronos.org/openxr/openxr/merge_requests/3493),
    [internal MR 3548](https://gitlab.khronos.org/openxr/openxr/merge_requests/3548))
  - Fix: Correct XML description of OpenXR 1.1 related additions to the promoted
    Meta Touch Plus, Touch Pro, and Touch (Rift CV1) controller interaction
    profiles.
    ([internal MR 3513](https://gitlab.khronos.org/openxr/openxr/merge_requests/3513),
    [internal issue 2350](https://gitlab.khronos.org/openxr/openxr/issues/2350),
    [internal issue 2375](https://gitlab.khronos.org/openxr/openxr/issues/2375))
  - Fix: Add missing XML description of `EXT_hand_interaction` additions to several
    interaction profiles, and add comments to clarify where profile additions
    should be located.
    ([internal MR 3517](https://gitlab.khronos.org/openxr/openxr/merge_requests/3517),
    [internal MR 3541](https://gitlab.khronos.org/openxr/openxr/merge_requests/3541),
    [internal MR 3552](https://gitlab.khronos.org/openxr/openxr/merge_requests/3552))
  - Fix: Corrections to the Schema chapter of the style guide.
    ([internal MR 3521](https://gitlab.khronos.org/openxr/openxr/merge_requests/3521))
  - Improvement: Small consistency clean-up.
    ([internal MR 3512](https://gitlab.khronos.org/openxr/openxr/merge_requests/3512))
  - Improvement: Clean up `.rnc` schema to improve readability.
    ([internal MR 3521](https://gitlab.khronos.org/openxr/openxr/merge_requests/3521))
  - Scripts: Improve `update_version.py` used in release process.
    ([internal MR 3543](https://gitlab.khronos.org/openxr/openxr/merge_requests/3543))
  - Update: Change naming convention in `XR_HTC_facial_expression`: rename
    `XR_LIP_EXPRESSION_MOUTH_SMILE_RIGHT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_RAISER_RIGHT_HTC`,
    `XR_LIP_EXPRESSION_MOUTH_SMILE_LEFT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_RAISER_LEFT_HTC`,
    `XR_LIP_EXPRESSION_MOUTH_SAD_RIGHT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_STRETCHER_RIGHT_HTC` and
    `XR_LIP_EXPRESSION_MOUTH_SAD_LEFT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_STRETCHER_LEFT_HTC`, providing the old names as
    compatibility aliases.
    ([internal MR 3408](https://gitlab.khronos.org/openxr/openxr/merge_requests/3408))
- Specification
  - Clarify: In "Fundamentals," improve the language regarding forward/backward
    prediction/history time limits, without affecting behavior.
    ([internal MR 3063](https://gitlab.khronos.org/openxr/openxr/merge_requests/3063))
  - Clarify: The path(s) returned by `xrEnumerateBoundSourcesForAction` have no
    inherent semantic meaning nor association with other paths in the
    specification. They are opaque and only suitable for use with
    `xrGetInputSourceLocalizedName`.
    ([internal MR 3495](https://gitlab.khronos.org/openxr/openxr/merge_requests/3495))
  - Fix: Show the correct ratified-specific text in the copyright section for the
    KHR-only spec build.
    ([internal MR 3568](https://gitlab.khronos.org/openxr/openxr/merge_requests/3568),
    [internal issue 2388](https://gitlab.khronos.org/openxr/openxr/issues/2388))
  - Improvement: Clarify `XR_VARJO_xr4_controller_interaction` interaction with
    palm pose extension and grip surface.
    ([internal MR 3493](https://gitlab.khronos.org/openxr/openxr/merge_requests/3493))
  - Improvement: Clarify text and normatives related to `xrGetInstanceProcAddr`,
    without changing required behavior.
    ([internal MR 3512](https://gitlab.khronos.org/openxr/openxr/merge_requests/3512))
  - Update: Change naming convention in `XR_HTC_facial_expression`: rename
    `XR_LIP_EXPRESSION_MOUTH_SMILE_RIGHT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_RAISER_RIGHT_HTC`,
    `XR_LIP_EXPRESSION_MOUTH_SMILE_LEFT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_RAISER_LEFT_HTC`,
    `XR_LIP_EXPRESSION_MOUTH_SAD_RIGHT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_STRETCHER_RIGHT_HTC` and
    `XR_LIP_EXPRESSION_MOUTH_SAD_LEFT_HTC` to
    `XR_LIP_EXPRESSION_MOUTH_STRETCHER_LEFT_HTC`, providing the old names as
    compatibility aliases.
    ([internal MR 3408](https://gitlab.khronos.org/openxr/openxr/merge_requests/3408))

## OpenXR Specification 1.1.41 (2024-09-25)

This release features several new vendor extensions, as well as several
clarifications and improvements to existing specifications.

- Registry
  - Change: Allow structs that can extend multiple other structs in the RelaxNG
    schema, as already permitted by the Vulkan schema.
    ([internal MR 2869](https://gitlab.khronos.org/openxr/openxr/merge_requests/2869))
  - New vendor extension: `XR_HTC_body_tracking`
    ([internal MR 2549](https://gitlab.khronos.org/openxr/openxr/merge_requests/2549))
  - New vendor extension: `XR_ML_spatial_anchors`
    ([internal MR 2803](https://gitlab.khronos.org/openxr/openxr/merge_requests/2803))
  - New vendor extension: `XR_ML_spatial_anchors_storage`
    ([internal MR 2804](https://gitlab.khronos.org/openxr/openxr/merge_requests/2804))
  - New vendor extension: `XR_ML_system_notifications`
    ([internal MR 2946](https://gitlab.khronos.org/openxr/openxr/merge_requests/2946))
  - New vendor extension: `XR_ML_world_mesh_detection`
    ([internal MR 2950](https://gitlab.khronos.org/openxr/openxr/merge_requests/2950))
  - New vendor extension: `XR_ML_view_configuration_depth_range_change`
    ([internal MR 3036](https://gitlab.khronos.org/openxr/openxr/merge_requests/3036))
- Specification
  - New vendor extension specification: `XR_HTC_body_tracking` provides an
    interface for full-body joint tracking.
    ([internal MR 2549](https://gitlab.khronos.org/openxr/openxr/merge_requests/2549))
  - New vendor extension specification: `XR_ML_spatial_anchors` introduces an API
    to interact with Magic Leap spatial anchors.
    ([internal MR 2803](https://gitlab.khronos.org/openxr/openxr/merge_requests/2803))
  - New vendor extension specification: `XR_ML_spatial_anchors_storage` allows for
    storage and retrieval of Magic Leap spatial anchors in local or cloud storage
    ([internal MR 2804](https://gitlab.khronos.org/openxr/openxr/merge_requests/2804))
  - New vendor extension specification: `XR_ML_system_notifications` provides
    control over suppressing system notifications.
    ([internal MR 2946](https://gitlab.khronos.org/openxr/openxr/merge_requests/2946))
  - New vendor extension specification: `XR_ML_world_mesh_detection` provides
    access to a world mesh.
    ([internal MR 2950](https://gitlab.khronos.org/openxr/openxr/merge_requests/2950))
  - New vendor extension specification:
    `XR_ML_view_configuration_depth_range_change` permits the clipping planes to be
    changed by the runtime during the lifetime of an instance.
    ([internal MR 3036](https://gitlab.khronos.org/openxr/openxr/merge_requests/3036))
  - Fix: Corrected swapchain image layout requirements for `XR_KHR_D3D12_enable`,
    `XR_KHR_vulkan_enable`, and `XR_KHR_vulkan_enable2` so that the runtime's
    guarantees are made after `xrWaitSwapchainImage` returns `XR_SUCCESS`, instead
    of after `xrAcquireSwapchainImage`. (Queue access rules are unchanged.)
    ([internal MR 3353](https://gitlab.khronos.org/openxr/openxr/merge_requests/3353),
    [internal issue 2269](https://gitlab.khronos.org/openxr/openxr/issues/2269))
  - Fix: references to core specification from
    `XR_EXT_composition_layer_inverted_alpha` and
    `XR_FB_composition_layer_alpha_blend`.
    ([internal MR 3470](https://gitlab.khronos.org/openxr/openxr/merge_requests/3470))
  - Fix: markup for internal anchors for revision history subsections.
    ([internal MR 3470](https://gitlab.khronos.org/openxr/openxr/merge_requests/3470))
  - Fix: remove a normative keyword from `XR_META_headset_id` version history.
    ([internal MR 3470](https://gitlab.khronos.org/openxr/openxr/merge_requests/3470))
  - Improvement: Clean up formatting of source adoc files.
    ([internal MR 3461](https://gitlab.khronos.org/openxr/openxr/merge_requests/3461))


## OpenXR Specification 1.1.40 (2024-08-22)

This release features a new ratified graphics API binding extension,
`XR_KHR_metal_enable`, as well as an update to the wording about environments
and environment blend modes, making it clear they can be used for physical as
well as synthetic passthrough. There are also an assortment of smaller fixes and
clarifications.

- Registry
  - Add: New ratified Khronos extension: `XR_KHR_metal_enable`.
    ([internal MR 2721](https://gitlab.khronos.org/openxr/openxr/merge_requests/2721))
  - Chore: Reserve 15 extension id numbers for ByteDance.
    ([internal MR 3409](https://gitlab.khronos.org/openxr/openxr/merge_requests/3409))
  - Fix: Clarified that views in `XR_VARJO_quad_views` needs to have identical
    poses for each eye.
    ([internal MR 3396](https://gitlab.khronos.org/openxr/openxr/merge_requests/3396))
  - Fix: Add missing interaction profile extensions for OpenXR 1.1 promoted Meta
    interaction profiles.
    ([internal MR 3398](https://gitlab.khronos.org/openxr/openxr/merge_requests/3398))
  - Fix: Correctly mark the Magic Leap home button as a system button in the XML.
    ([internal MR 3405](https://gitlab.khronos.org/openxr/openxr/merge_requests/3405))
  - Fix: Add `XR_ERROR_VALIDATION_FAILURE` to all functions from
    `XR_EXT_conformance_automation`.
    ([internal MR 3417](https://gitlab.khronos.org/openxr/openxr/merge_requests/3417))
- Specification
  - Add: New ratified Khronos extension specification: `XR_KHR_metal_enable`.
    ([internal MR 2721](https://gitlab.khronos.org/openxr/openxr/merge_requests/2721))
  - Clarify: Clarify the definition of "environment" in the context of "environment
    blend mode".
    ([internal MR 3301](https://gitlab.khronos.org/openxr/openxr/merge_requests/3301))
  - Clarify: Devices may use environment blend mode to control passthrough and
    synthentic environments.
    ([internal MR 3301](https://gitlab.khronos.org/openxr/openxr/merge_requests/3301))
  - Clarify: Clarified that views in `XR_VARJO_quad_views` needs to have identical
    poses for each eye.
    ([internal MR 3396](https://gitlab.khronos.org/openxr/openxr/merge_requests/3396))
  - Fix: Correct the maximum extension number in the appendix.
    ([internal MR 3397](https://gitlab.khronos.org/openxr/openxr/merge_requests/3397))
  - Fix: Add missing interaction profile extensions for OpenXR 1.1 promoted Meta
    interaction profiles.
    ([internal MR 3398](https://gitlab.khronos.org/openxr/openxr/merge_requests/3398))
  - Fix: Remove incorrect implicit valid usage from loader interface APIs.
    ([internal MR 3416](https://gitlab.khronos.org/openxr/openxr/merge_requests/3416))
  - Fix: Fix a typo in the spec for xrCreateApiLayerInstance.
    ([internal MR 3416](https://gitlab.khronos.org/openxr/openxr/merge_requests/3416))

**Note**: There is no 1.1.39 release: it was skipped to keep the monthly patch
version increment cadence given the lack of a release in July.

## OpenXR Specification 1.1.38 (2024-06-09)

This is a fairly small release, with one new extension and a handful of fixes.

- Registry
  - Addition: New multi-vendor extension: `XR_EXT_composition_layer_inverted_alpha`
    ([internal MR 3085](https://gitlab.khronos.org/openxr/openxr/merge_requests/3085),
    [internal MR 3385](https://gitlab.khronos.org/openxr/openxr/merge_requests/3385))
  - Chore: Reserve an extension for Logitech.
    ([internal MR 3384](https://gitlab.khronos.org/openxr/openxr/merge_requests/3384))
  - Chore: Register author tag for Deep Mirror.
    ([OpenXR-Docs PR 171](https://github.com/KhronosGroup/OpenXR-Docs/pull/171))
  - Fix: `XrCompositionLayerPassthroughFB` has a "parentstruct" of
    `XrCompositionLayerBaseHeader` (it is based on this type), rather than
    "structextends" (in the next chain). Bump extension revision.
    ([internal MR 3305](https://gitlab.khronos.org/openxr/openxr/merge_requests/3305))
  - Fix: `XR_EXT_plane_detection`: Fix extents description and plane axis to match
    CTS and implementations.
    ([internal MR 3374](https://gitlab.khronos.org/openxr/openxr/merge_requests/3374),
    [internal issue 2281](https://gitlab.khronos.org/openxr/openxr/issues/2281))
  - Fix: Correct typo in `XR_FB_keyboard_tracking` flag description.
    ([internal MR 3393](https://gitlab.khronos.org/openxr/openxr/merge_requests/3393))
- Specification
  - Addition: New multi-vendor extension specification:
    `XR_EXT_composition_layer_inverted_alpha`
    ([internal MR 3085](https://gitlab.khronos.org/openxr/openxr/merge_requests/3085))
  - Addition: Support emitting more comment attributes/elements from XML, and
    enable it for standalone headers.
    ([internal MR 3377](https://gitlab.khronos.org/openxr/openxr/merge_requests/3377))
  - Fix: Note errata regarding third field name in
    `XrCompositionLayerPassthroughFB`. Bump extension revision due to XML fix.
    ([internal MR 3305](https://gitlab.khronos.org/openxr/openxr/merge_requests/3305))
  - Fix: `XR_EXT_plane_detection`: Fix extents description and plane axis to match
    CTS and implementations.
    ([internal MR 3374](https://gitlab.khronos.org/openxr/openxr/merge_requests/3374),
    [internal issue 2281](https://gitlab.khronos.org/openxr/openxr/issues/2281))
  - Fix: Correct typo in `XR_FB_keyboard_tracking` flag description.
    ([internal MR 3393](https://gitlab.khronos.org/openxr/openxr/merge_requests/3393))
  - Fix: Correct typo in loader design document.
    ([internal MR 3393](https://gitlab.khronos.org/openxr/openxr/merge_requests/3393))

## OpenXR Specification 1.1.37 (2024-05-23)

This release adds new defines for easier use of both OpenXR 1.0 and 1.1 with
up-to-date headers, as well as some minor fixes, cleanups, and clarifications.

- Registry
  - Addition: New `XR_API_VERSION_1_0` and `XR_API_VERSION_1_1` defines to allow
    applications to easily specify OpenXR "major" and "minor" version while passing
    through the "patch" version.
    ([internal MR 3329](https://gitlab.khronos.org/openxr/openxr/merge_requests/3329),
    [internal MR 3354](https://gitlab.khronos.org/openxr/openxr/merge_requests/3354),
    [internal issue 2254](https://gitlab.khronos.org/openxr/openxr/issues/2254))
  - Addition: Register Razer vendor ID.
    ([internal MR 3340](https://gitlab.khronos.org/openxr/openxr/merge_requests/3340))
  - Fix: Add "palm_pose" to "touch_controller_pro" and "touch_controller_plus" in
    XML.
    ([internal MR 3363](https://gitlab.khronos.org/openxr/openxr/merge_requests/3363))
  - Improvement: Add Schematron rule to avoid triggering edge cases of vendor tags
    ending with X.
    ([internal MR 3341](https://gitlab.khronos.org/openxr/openxr/merge_requests/3341))
  - Reservation: Reserve extension numbers for a few new EXT extensions.
    ([internal MR 3285](https://gitlab.khronos.org/openxr/openxr/merge_requests/3285),
    [internal MR 3292](https://gitlab.khronos.org/openxr/openxr/merge_requests/3292))
  - Update: Bump version of `XR_FB_composition_layer_alpha_blend` due to spec text
    clarification.
    ([internal MR 3317](https://gitlab.khronos.org/openxr/openxr/merge_requests/3317))
- Specification
  - Addition: Document new `XR_API_VERSION_1_0` and `XR_API_VERSION_1_1`
    macros/defines.
    ([internal MR 3354](https://gitlab.khronos.org/openxr/openxr/merge_requests/3354),
    [internal issue 2254](https://gitlab.khronos.org/openxr/openxr/issues/2254))
  - Fix: Typo in "Buffer Size Parameters" section.
    ([internal MR 3322](https://gitlab.khronos.org/openxr/openxr/merge_requests/3322))
  - Fix: Resolve several diagrams shown cropped in browsers.
    ([internal MR 3355](https://gitlab.khronos.org/openxr/openxr/merge_requests/3355))
  - Fix: Correct formatting of versions in some generated spec text.
    ([internal MR 3362](https://gitlab.khronos.org/openxr/openxr/merge_requests/3362))
  - Fix: Adjust specification release build process to restore internal links in
    PDF.
    ([internal MR 3371](https://gitlab.khronos.org/openxr/openxr/merge_requests/3371),
    [OpenXR-Docs issue 170](https://github.com/KhronosGroup/OpenXR-Docs/issues/170))
  - Improvement: Resize and optimize images to reduce spec page size.
    ([internal MR 2833](https://gitlab.khronos.org/openxr/openxr/merge_requests/2833),
    [internal MR 3355](https://gitlab.khronos.org/openxr/openxr/merge_requests/3355))
  - Improvement: Add in missing explicit section anchors.
    ([internal MR 3322](https://gitlab.khronos.org/openxr/openxr/merge_requests/3322))
  - Improvement: Fix references to Docker container in spec build instructions.
    ([internal MR 3352](https://gitlab.khronos.org/openxr/openxr/merge_requests/3352),
    [internal issue 2283](https://gitlab.khronos.org/openxr/openxr/issues/2283),
    [OpenXR-SDK-Source issue 476](https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/476))
  - Improvement: Inline several SVG diagrams to support searchable and screen-
    reader-accessible text.
    ([internal MR 3355](https://gitlab.khronos.org/openxr/openxr/merge_requests/3355))
  - Improvement: General script cleanups and improvements.
    ([internal MR 3362](https://gitlab.khronos.org/openxr/openxr/merge_requests/3362))
  - Update: Bump version of `XR_FB_composition_layer_alpha_blend` due to spec text
    clarification.
    ([internal MR 3317](https://gitlab.khronos.org/openxr/openxr/merge_requests/3317))

## OpenXR Specification 1.1.36 (2024-04-15)

This is a substantial update to the OpenXR specification.

- Major Update
  - New ratified core OpenXR 1.1 specification.
    ([internal MR 3053](https://gitlab.khronos.org/openxr/openxr/merge_requests/3053),
    [internal MR 3046](https://gitlab.khronos.org/openxr/openxr/merge_requests/3046),
    [internal MR 3187](https://gitlab.khronos.org/openxr/openxr/merge_requests/3187),
    [internal MR 3199](https://gitlab.khronos.org/openxr/openxr/merge_requests/3199))
  - New ratified Khronos extension specification: `XR_KHR_locate_spaces`. Promoted
    to core OpenXR 1.1.
    ([internal MR 2272](https://gitlab.khronos.org/openxr/openxr/merge_requests/2272),
    [internal issue 1706](https://gitlab.khronos.org/openxr/openxr/issues/1706),
    [internal MR 3178](https://gitlab.khronos.org/openxr/openxr/merge_requests/3178),
    [internal MR 3196](https://gitlab.khronos.org/openxr/openxr/merge_requests/3196),
    [internal MR 3300](https://gitlab.khronos.org/openxr/openxr/merge_requests/3300))
  - New ratified Khronos extension specification: `XR_KHR_maintenance1`. Promoted
    to core OpenXR 1.1.
    ([internal MR 3053](https://gitlab.khronos.org/openxr/openxr/merge_requests/3053),
    [internal MR 3046](https://gitlab.khronos.org/openxr/openxr/merge_requests/3046),
    [internal MR 3187](https://gitlab.khronos.org/openxr/openxr/merge_requests/3187),
    [internal MR 3199](https://gitlab.khronos.org/openxr/openxr/merge_requests/3199))
  - Fundamentals chapter: Add assorted structures and values to core OpenXR 1.1.
    Some are versions of structures from existing extensions.
    ([internal MR 3046](https://gitlab.khronos.org/openxr/openxr/merge_requests/3046),
    [internal MR 3061](https://gitlab.khronos.org/openxr/openxr/merge_requests/3061))
  - Fundamentals chapter: Promote `XR_EXT_uuid` to core OpenXR 1.1.
    ([internal MR 3046](https://gitlab.khronos.org/openxr/openxr/merge_requests/3046))
  - Fundamentals chapter: Rename "Common Object Types" section to "Common Data
    Types" and clarify its introduction.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Clarify `XrDuration` (and related constant)
    specification.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Clarify and expand the "buffer size" section about the
    two-call idiom.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Improve documentation for convenience macros acting on
    `XrResult`, and clarify text about common return code name suffixes.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Clarify and expand documentation of "offsets" and
    "extents".
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Clarify description of extension list.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062))
  - Fundamentals chapter: Miscellaneous minor cleanup, clarification, and normative
    language fixes.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062),
    [internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062),
    [internal MR 3210](https://gitlab.khronos.org/openxr/openxr/merge_requests/3210))
  - Fundamentals chapter: Clarify the section on events and event polling.
    ([internal MR 3062](https://gitlab.khronos.org/openxr/openxr/merge_requests/3062),
    [internal MR 3163](https://gitlab.khronos.org/openxr/openxr/merge_requests/3163),
    [internal MR 3276](https://gitlab.khronos.org/openxr/openxr/merge_requests/3276))
  - Semantic Paths chapter: Promote the "grip_surface" pose identifier to core
    OpenXR 1.1, renamed from `XR_EXT_palm_pose`.
    ([internal MR 3050](https://gitlab.khronos.org/openxr/openxr/merge_requests/3050),
    [internal MR 3303](https://gitlab.khronos.org/openxr/openxr/merge_requests/3303))
  - Semantic Paths chapter: Promote many interaction profiles from extensions to
    core OpenXR 1.1.
    ([internal MR 3051](https://gitlab.khronos.org/openxr/openxr/merge_requests/3051),
    [internal MR 3127](https://gitlab.khronos.org/openxr/openxr/merge_requests/3127),
    [internal MR 3265](https://gitlab.khronos.org/openxr/openxr/merge_requests/3265),
    [internal MR 3279](https://gitlab.khronos.org/openxr/openxr/merge_requests/3279),
    [internal MR 3294](https://gitlab.khronos.org/openxr/openxr/merge_requests/3294))
  - Semantic Paths chapter: Add several legacy interaction profiles to represent
    specific controllers shipped under the Oculus/Meta Touch name and previously
    grouped into a single Oculus Touch interaction profile.
    ([internal MR 3127](https://gitlab.khronos.org/openxr/openxr/merge_requests/3127),
    [internal MR 3299](https://gitlab.khronos.org/openxr/openxr/merge_requests/3299))
  - Spaces chapter: Promote a refined version of `XR_EXT_local_floor` to core
    OpenXR 1.1.
    ([internal MR 3048](https://gitlab.khronos.org/openxr/openxr/merge_requests/3048),
    [internal MR 3074](https://gitlab.khronos.org/openxr/openxr/merge_requests/3074),
    [internal MR 3134](https://gitlab.khronos.org/openxr/openxr/merge_requests/3134),
    [internal MR 3155](https://gitlab.khronos.org/openxr/openxr/merge_requests/3155),
    [internal MR 3156](https://gitlab.khronos.org/openxr/openxr/merge_requests/3156),
    [internal MR 3157](https://gitlab.khronos.org/openxr/openxr/merge_requests/3157),
    [internal MR 3171](https://gitlab.khronos.org/openxr/openxr/merge_requests/3171),
    [internal MR 3172](https://gitlab.khronos.org/openxr/openxr/merge_requests/3172),
    [internal MR 3175](https://gitlab.khronos.org/openxr/openxr/merge_requests/3175))
  - Spaces chapter: General improvements to the Spaces chapter.
    ([internal MR 3169](https://gitlab.khronos.org/openxr/openxr/merge_requests/3169),
    [internal MR 3189](https://gitlab.khronos.org/openxr/openxr/merge_requests/3189))
  - View Configurations chapter: Promote
    `XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO_WITH_FOVEATED_INSET` to core OpenXR
    1.1, renamed and refined from `XR_VARJO_quad_views`.
    ([internal MR 3049](https://gitlab.khronos.org/openxr/openxr/merge_requests/3049),
    [internal MR 3173](https://gitlab.khronos.org/openxr/openxr/merge_requests/3173))
  - Rendering chapter: Formally deprecate
    `XR_COMPOSITION_LAYER_CORRECT_CHROMATIC_ABERRATION_BIT`, previously noted to
    have no effect on any known runtimes and as planned for deprecation.
    ([internal MR 3096](https://gitlab.khronos.org/openxr/openxr/merge_requests/3096))
  - Input chapter: Re-organize and clarify the Input chapter.
    ([internal MR 3179](https://gitlab.khronos.org/openxr/openxr/merge_requests/3179),
    [internal MR 3183](https://gitlab.khronos.org/openxr/openxr/merge_requests/3183),
    [internal MR 3185](https://gitlab.khronos.org/openxr/openxr/merge_requests/3185),
    [internal MR 3205](https://gitlab.khronos.org/openxr/openxr/merge_requests/3205),
    [internal MR 3207](https://gitlab.khronos.org/openxr/openxr/merge_requests/3207))
  - Core Revisions chapter: Add new informative (non-normative) chapter detailing
    substantial core revisions, summarize changes in OpenXR 1.1 core, and
    differences between extensions and the functionality promoted to core.
    ([internal MR 3199](https://gitlab.khronos.org/openxr/openxr/merge_requests/3199),
    [internal MR 3280](https://gitlab.khronos.org/openxr/openxr/merge_requests/3280))
  - Appendix: Update Contributors section.
    ([internal MR 3111](https://gitlab.khronos.org/openxr/openxr/merge_requests/3111))
  - Tooling: Update scripts for 1.1, handling extension promotion, and partially
    synchronize shared scripts with Vulkan.
    ([internal MR 3056](https://gitlab.khronos.org/openxr/openxr/merge_requests/3056),
    [internal MR 3139](https://gitlab.khronos.org/openxr/openxr/merge_requests/3139),
    [internal MR 3188](https://gitlab.khronos.org/openxr/openxr/merge_requests/3188),
    [internal MR 3190](https://gitlab.khronos.org/openxr/openxr/merge_requests/3190),
    [internal MR 3219](https://gitlab.khronos.org/openxr/openxr/merge_requests/3219),
    [internal MR 3226](https://gitlab.khronos.org/openxr/openxr/merge_requests/3226),
    [internal MR 3262](https://gitlab.khronos.org/openxr/openxr/merge_requests/3262),
    [internal MR 3263](https://gitlab.khronos.org/openxr/openxr/merge_requests/3263),
    [internal MR 3260](https://gitlab.khronos.org/openxr/openxr/merge_requests/3260),
    [internal MR 3266](https://gitlab.khronos.org/openxr/openxr/merge_requests/3266),
    [internal MR 3295](https://gitlab.khronos.org/openxr/openxr/merge_requests/3295))
- Registry
  - New ratified OpenXR version: `XR_VERSION_1_1` - OpenXR 1.1.
    ([internal MR 3053](https://gitlab.khronos.org/openxr/openxr/merge_requests/3053))
  - New ratified Khronos extension: `XR_KHR_locate_spaces`
    ([internal MR 2272](https://gitlab.khronos.org/openxr/openxr/merge_requests/2272),
    [internal issue 1706](https://gitlab.khronos.org/openxr/openxr/issues/1706))
  - New ratified Khronos extension: `XR_KHR_maintenance1`
    ([internal MR 3053](https://gitlab.khronos.org/openxr/openxr/merge_requests/3053))
  - New multi-vendor extension: `XR_EXT_future`
    ([internal MR 2610](https://gitlab.khronos.org/openxr/openxr/merge_requests/2610))
  - New vendor extension: `XR_META_environment_depth`
    ([internal MR 2771](https://gitlab.khronos.org/openxr/openxr/merge_requests/2771),
    [internal MR 3271](https://gitlab.khronos.org/openxr/openxr/merge_requests/3271))
  - Update the XML schema to change how dependencies are described (replacing
    `requiresCore` and `requires` attributes of `extension`, and `feature` and
    `extension` attributes of `require`, with a new `depends` attribute.). This is
    a **breaking change** of the XML schema, though in an infrequently processed
    attribute. This corresponds to the change made in Vulkan 1.3.241.
    ([internal MR 3260](https://gitlab.khronos.org/openxr/openxr/merge_requests/3260))
  - Mark `XR_OCULUS_android_session_state_enable` as deprecated.
    ([internal MR 3255](https://gitlab.khronos.org/openxr/openxr/merge_requests/3255))
- Specification
  - New multi-vendor extension specification: `XR_EXT_future`
    ([internal MR 2610](https://gitlab.khronos.org/openxr/openxr/merge_requests/2610))
  - New vendor extension specification: `XR_META_environment_depth`
    ([internal MR 2771](https://gitlab.khronos.org/openxr/openxr/merge_requests/2771),
    [internal MR 3271](https://gitlab.khronos.org/openxr/openxr/merge_requests/3271))
  - Fix: Small clarification on post-conditions for loader negotiation functions.
    ([internal MR 2117](https://gitlab.khronos.org/openxr/openxr/merge_requests/2117))
  - Fix: Correct broken QR code specification link in extension ref page.
    ([internal MR 3308](https://gitlab.khronos.org/openxr/openxr/merge_requests/3308))
  - Fix: Adjust markup of non-normative note admonition blocks.
    ([internal MR 3315](https://gitlab.khronos.org/openxr/openxr/merge_requests/3315))
  - Fix: Adjust Makefile so builds that do not emit any errors during ref page
    generation do not fail when looking for those errors.
    ([internal MR 3226](https://gitlab.khronos.org/openxr/openxr/merge_requests/3226))
  - Improvement: Switch code highlighter to "rouge", use customized Khronos
    stylesheet for both main spec and ref pages for consistent style and improved
    accessibility.
    ([internal MR 3309](https://gitlab.khronos.org/openxr/openxr/merge_requests/3309))
  - Improvement: Replace JavaScript in main specification source with build-time
    postprocessing.
    ([internal MR 3309](https://gitlab.khronos.org/openxr/openxr/merge_requests/3309))
  - Improvement: Make reference pages use shared external CSS for faster load
    times.
    ([internal MR 3309](https://gitlab.khronos.org/openxr/openxr/merge_requests/3309))
  - Improvement: Update the internal anchors in the specification to a standardized format.
    ([internal MR 3315](https://gitlab.khronos.org/openxr/openxr/merge_requests/3315))
  - Improvement: Specification build system cleanup, silence warnings that are not
    relevant.
    ([internal MR 3308](https://gitlab.khronos.org/openxr/openxr/merge_requests/3308))
  - Loader design: Allow checking multiple records from the broker, all
    corresponding to the same runtime, for compatibility purposes.
    ([internal MR 3269](https://gitlab.khronos.org/openxr/openxr/merge_requests/3269),
    [internal issue 2226](https://gitlab.khronos.org/openxr/openxr/issues/2226))
  - New multi-vendor extension specification: `XR_EXT_future`
    ([internal MR 2610](https://gitlab.khronos.org/openxr/openxr/merge_requests/2610))
  - New vendor extension specification: `XR_META_environment_depth`
    ([internal MR 2771](https://gitlab.khronos.org/openxr/openxr/merge_requests/2771),
    [internal MR 3271](https://gitlab.khronos.org/openxr/openxr/merge_requests/3271))
  - `XR_FB_face_tracking2`: Correct the number of blend shapes mentioned in the
    prose.
    ([internal MR 3277](https://gitlab.khronos.org/openxr/openxr/merge_requests/3277))

## OpenXR Specification 1.0.34 (2024-02-16)

This release features clarifications to the specification, as well as a number
of new multi-vendor and vendor extensions, and additional functionality in the
reflection header.

- Registry
  - Extension reservation: Register author ID and reserve extensions for Leia.
    ([internal MR 3203](https://gitlab.khronos.org/openxr/openxr/merge_requests/3203))
  - Fix: Remove erroneous interaction profile component additions from extensions.
    ([internal MR 3223](https://gitlab.khronos.org/openxr/openxr/merge_requests/3223))
  - New multi-vendor extension: `XR_EXT_user_presence`
    ([internal MR 2706](https://gitlab.khronos.org/openxr/openxr/merge_requests/2706),
    [internal issue 1585](https://gitlab.khronos.org/openxr/openxr/issues/1585))
  - New vendor extension: `XR_META_recommended_layer_resolution`
    ([internal MR 2570](https://gitlab.khronos.org/openxr/openxr/merge_requests/2570))
  - New vendor extension: `XR_META_automatic_layer_filter`
    ([internal MR 2696](https://gitlab.khronos.org/openxr/openxr/merge_requests/2696))
  - New vendor extension: `XR_META_spatial_entity_mesh`
    ([internal MR 2773](https://gitlab.khronos.org/openxr/openxr/merge_requests/2773))
  - New vendor extension: `XR_FB_face_tracking2`
    ([internal MR 2811](https://gitlab.khronos.org/openxr/openxr/merge_requests/2811))
  - New vendor extension: `XR_VARJO_xr4_controller_interaction`
    ([internal MR 3078](https://gitlab.khronos.org/openxr/openxr/merge_requests/3078))
  - `XR_FB_scene`: Update to spec version 4.
    ([internal MR 2774](https://gitlab.khronos.org/openxr/openxr/merge_requests/2774))
  - `XR_META_headset_id` and `XR_FB_spatial_entity`: Drop `XR_EXT_uuid` dependency,
    they use the data structure but do not require any runtime support specific to
    `XR_EXT_uuid`
    ([internal MR 2577](https://gitlab.khronos.org/openxr/openxr/merge_requests/2577))
- Specification
  - Clarification: Change normative "should" statements to "may" for the
    interaction of user engagement sensors and the session lifecycle, in order to
    represent the intended and actual optionality of that behavior. Specifically,
    it is valid but completely optional for runtimes to use the user engagement
    sensor (if it exists) to move to `XR_SESSION_STATE_STOPPING`.
    ([internal MR 3022](https://gitlab.khronos.org/openxr/openxr/merge_requests/3022))
  - Clarification: Swapchain usage flags errors should return
    `XR_ERROR_FEATURE_UNSUPPORTED` as well.
    ([internal MR 3194](https://gitlab.khronos.org/openxr/openxr/merge_requests/3194))
  - New multi-vendor extension specification: `XR_EXT_user_presence`
    ([internal MR 2706](https://gitlab.khronos.org/openxr/openxr/merge_requests/2706),
    [internal issue 1585](https://gitlab.khronos.org/openxr/openxr/issues/1585))
  - New vendor extension specification: `XR_META_recommended_layer_resolution`
    ([internal MR 2570](https://gitlab.khronos.org/openxr/openxr/merge_requests/2570))
  - New vendor extension specification: `XR_META_automatic_layer_filter`
    ([internal MR 2696](https://gitlab.khronos.org/openxr/openxr/merge_requests/2696))
  - New vendor extension specification: `XR_META_spatial_entity_mesh`
    ([internal MR 2773](https://gitlab.khronos.org/openxr/openxr/merge_requests/2773))
  - New vendor extension specification: `XR_FB_face_tracking2`
    ([internal MR 2811](https://gitlab.khronos.org/openxr/openxr/merge_requests/2811))
  - New vendor extension specification: `XR_VARJO_xr4_controller_interaction`
    ([internal MR 3078](https://gitlab.khronos.org/openxr/openxr/merge_requests/3078))
  - Spec: Move originals of images to separate folder.
    ([internal MR 3218](https://gitlab.khronos.org/openxr/openxr/merge_requests/3218))
  - Spec: Fix issue where some comments before defines were missing a newline.
    ([internal MR 3227](https://gitlab.khronos.org/openxr/openxr/merge_requests/3227))
  - Style guide: Fix several leftover references to `Vk`/`Vulkan`.
    ([internal MR 2967](https://gitlab.khronos.org/openxr/openxr/merge_requests/2967))
  - `XR_FB_scene`: Update to spec version 4.
    ([internal MR 2774](https://gitlab.khronos.org/openxr/openxr/merge_requests/2774))
  - `XR_META_headset_id` and `XR_FB_spatial_entity`: Bump spec versions to drop
    `XR_EXT_uuid` dependency from spec.
    ([internal MR 2577](https://gitlab.khronos.org/openxr/openxr/merge_requests/2577))
  - external: Update Jinja2 Python module shipped with repository (for spec/header
    generation) to 2.11.3.
    ([internal MR 3221](https://gitlab.khronos.org/openxr/openxr/merge_requests/3221),
    [internal MR 3237](https://gitlab.khronos.org/openxr/openxr/merge_requests/3237))

## OpenXR Specification 1.0.33 (2024-01-03)

This release primarily adds new ratified functionality to the specification
describing the loader interaction with runtimes and API layers. This
functionality was previously described in non-normative text in the loader
design document, but was universally adopted for compatibility. It is now part
of the normative, ratified core specification. This change only affects vendors
of runtimes and API layers as well as contributors to the OpenXR loader:
applications do not directly use this API, the loader uses it on their behalf. A
number of other small fixes are also included.

- Registry
  - Extension reservation: Update author ID and reserve extensions for Varjo.
    ([internal MR 3083](https://gitlab.khronos.org/openxr/openxr/merge_requests/3083))
  - Extension reservation: Reserve 10 extension ids each for `ANDROIDX` &
    `ANDROIDSYS`.
    ([internal MR 3086](https://gitlab.khronos.org/openxr/openxr/merge_requests/3086))
  - Khronos ratified addition: Specify the existing loader negotiation functions
    (without modification) in the XML, moving from `loader_interfaces.h` to a new
    generated header `openxr_loader_negotiation.h`.
    ([internal MR 2807](https://gitlab.khronos.org/openxr/openxr/merge_requests/2807),
    [internal issue 1953](https://gitlab.khronos.org/openxr/openxr/issues/1953))
  - `XR_KHR_android_thread_settings`: Fix the description of
    `XrAndroidThreadTypeKHR` enum values - they were swapped relative to their
    implicit meaning from their name.
    ([internal MR 3077](https://gitlab.khronos.org/openxr/openxr/merge_requests/3077))
  - `XR_MNDX_egl_enable`: Update version to 2 to reflect function pointer type
    change released in 1.0.29.
    ([OpenXR-Docs PR 159](https://github.com/KhronosGroup/OpenXR-Docs/pull/159))
- Specification
  - Khronos ratified specification addition: move loader negotiation functions into
    the specification proper (from the loader design doc), moving corresponding
    functions from `loader_interfaces.h` to `openxr_loader_negotiation.h`. (The
    exact ratified core specification text is 1.0.29 with these changes added,
    available internally. Non-substantive core specification updates/fixes have
    occurred since then.)
    ([internal MR 2807](https://gitlab.khronos.org/openxr/openxr/merge_requests/2807),
    [internal issue 1953](https://gitlab.khronos.org/openxr/openxr/issues/1953),
    [internal MR 3101](https://gitlab.khronos.org/openxr/openxr/merge_requests/3101))
  - Scripts: Adjust Makefile so we now error on any checkSpecLinks warning when
    running that target.
    ([internal MR 3072](https://gitlab.khronos.org/openxr/openxr/merge_requests/3072))
  - `XR_HTC_anchor`: Fix parameter name error in prose description.
    ([internal MR 3072](https://gitlab.khronos.org/openxr/openxr/merge_requests/3072))
  - `XR_KHR_android_thread_settings`: Fix the description of
    `XrAndroidThreadTypeKHR` enum values - they were swapped relative to their
    implicit meaning from their name.
    ([internal MR 3077](https://gitlab.khronos.org/openxr/openxr/merge_requests/3077))
  - `XR_MNDX_egl_enable`: Update revision info and version to 2 to reflect function
    pointer type change released in 1.0.29.
    ([OpenXR-Docs PR 159](https://github.com/KhronosGroup/OpenXR-Docs/pull/159))
  - loader design doc: Fix minor typos.
    ([internal MR 3065](https://gitlab.khronos.org/openxr/openxr/merge_requests/3065),
    [internal MR 3103](https://gitlab.khronos.org/openxr/openxr/merge_requests/3103))
- Misc
  - Update/correct names.
  - Ship a `.mailmap` file in the public repositories, maintained separately
    from the larger one used in the private monorepo, to correct names/emails
    and unify contributor identities.
  - Update Khronos Group copyright dates.

## OpenXR Specification 1.0.32 (2023-11-29)

This release contains a number of vendor extensions, plus a new ratified
revision to the `XR_KHR_loader_init` extension that specifies forwarding the
init calls to API layers. **Vendors of API layers**, primarily on Android, must
verify they can handle being passed `XR_NULL_HANDLE` for the instance parameter
of `xrGetInstanceProcAddr`, to avoid bugs when using the updated loader. This
release also features the remaining "checkSpecLinks" consistency warning fixes
in the manually-written specification text in extensions.

- Registry
  - `XR_KHR_loader_init`: New Khronos ratified revision, adds support for
    forwarding loader init calls to API layers
    ([internal MR 2703](https://gitlab.khronos.org/openxr/openxr/merge_requests/2703))
  - Extension reservation: Reserve extension id for `XR_KHR_maintenance1`
    ([internal MR 3010](https://gitlab.khronos.org/openxr/openxr/merge_requests/3010))
  - Extension reservation: Reserve extension id for `XR_KHR_game_controller`
    ([internal MR 3019](https://gitlab.khronos.org/openxr/openxr/merge_requests/3019))
  - New vendor extension: `XR_HTC_anchor`
    ([internal MR 2667](https://gitlab.khronos.org/openxr/openxr/merge_requests/2667))
  - New vendor extension: `XR_META_touch_controller_plus`
    ([internal MR 2702](https://gitlab.khronos.org/openxr/openxr/merge_requests/2702))
  - New vendor extension: `XR_ML_marker_understanding`
    ([internal MR 2750](https://gitlab.khronos.org/openxr/openxr/merge_requests/2750))
  - New vendor extension: `XR_ML_localization_map`
    ([internal MR 2802](https://gitlab.khronos.org/openxr/openxr/merge_requests/2802),
    [internal MR 3045](https://gitlab.khronos.org/openxr/openxr/merge_requests/3045),
    [internal MR 3047](https://gitlab.khronos.org/openxr/openxr/merge_requests/3047))
- Specification
  - `XR_KHR_loader_init`: New Khronos ratified revision, now additionally specifies
    forwarding loader init calls to API layers
    ([internal MR 2703](https://gitlab.khronos.org/openxr/openxr/merge_requests/2703))
  - Fix "checkSpecLinks" warnings about member and parameter references in
    extensions to the specification. This has changed the documentation of a number
    of structures and functions across several extensions, although the C
    prototypes/definitions in the spec as well as the header file contents have
    stayed constant.
    ([internal MR 2970](https://gitlab.khronos.org/openxr/openxr/merge_requests/2970))
  - New vendor extension specification: `XR_HTC_anchor`
    ([internal MR 2667](https://gitlab.khronos.org/openxr/openxr/merge_requests/2667))
  - New vendor extension specification: `XR_META_touch_controller_plus`
    ([internal MR 2702](https://gitlab.khronos.org/openxr/openxr/merge_requests/2702))
  - New vendor extension specification: `XR_ML_marker_understanding`
    ([internal MR 2750](https://gitlab.khronos.org/openxr/openxr/merge_requests/2750))
  - New vendor extension specification: `XR_ML_localization_map`
    ([internal MR 2802](https://gitlab.khronos.org/openxr/openxr/merge_requests/2802),
    [internal MR 3045](https://gitlab.khronos.org/openxr/openxr/merge_requests/3045),
    [internal MR 3047](https://gitlab.khronos.org/openxr/openxr/merge_requests/3047))

## OpenXR Specification 1.0.31 (2023-10-18)

This release features two new vendor extensions, some XML revisions to other
vendor extensions, and a substantial amount of fixes to the prose of the core
specification and some extensions. All specially-formatted mentions of a
parameter or field name (that is, names marked up with the `pname` macro in the
AsciiDoctor source) are now being checked by a script to be sure they are known.
With the fixes in this release, nearly all such name mentions now either (1)
match the function or structure in whose description they are mentioned, or (2)
have been qualified with the function or structure to which they do belong.
Misspellings, missing fields/parameters, and extraneous parameters have been
fixed as well. (Some fixes of this type to vendor extensions are still pending
and will be in an upcoming patch release.) While this has changed the prose, it
has not resulted in substantive changes to the XML, and therefore the code
snippets in the specification as well as the header files remain accurate and
unaffected by these fixes.

- Registry
  - Extension reservation: Reserve extensions for NVIDIA.
    ([internal MR 2952](https://gitlab.khronos.org/openxr/openxr/merge_requests/2952))
  - Extension reservation: Reserve extensions for Meta.
    ([internal MR 2959](https://gitlab.khronos.org/openxr/openxr/merge_requests/2959))
  - Extension reservation: Reserve extensions for Android.
    ([internal MR 2966](https://gitlab.khronos.org/openxr/openxr/merge_requests/2966))
  - Extension reservation: Reserve an extension for `XR_KHR_egl_enable`.
    ([internal MR 2982](https://gitlab.khronos.org/openxr/openxr/merge_requests/2982))
  - New vendor extension: `XR_MSFT_scene_marker`
    ([internal MR 2601](https://gitlab.khronos.org/openxr/openxr/merge_requests/2601))
  - New vendor extension: `XR_ML_user_calibration`
    ([internal MR 2849](https://gitlab.khronos.org/openxr/openxr/merge_requests/2849))
  - Schematron: Allow chained structs that extend a two-call-idiom struct to carry
    only a `*CapacityInput` member.
    ([internal MR 2892](https://gitlab.khronos.org/openxr/openxr/merge_requests/2892),
    [internal issue 2059](https://gitlab.khronos.org/openxr/openxr/issues/2059))
  - `XR_FB_render_model`: Fix `structextends` attribute and remove `returnedonly`
    attribute of `XrRenderModelCapabilitiesRequestFB`, to match the specification
    prose.
    ([internal MR 2765](https://gitlab.khronos.org/openxr/openxr/merge_requests/2765),
    [OpenXR-Docs issue 153](https://github.com/KhronosGroup/OpenXR-Docs/issues/153),
    [internal issue 2017](https://gitlab.khronos.org/openxr/openxr/issues/2017))
  - xml: Fixed a few errors in MSFT extensions discovered by Schematron checks.
    ([internal MR 2892](https://gitlab.khronos.org/openxr/openxr/merge_requests/2892))
- Specification
  - Add note about missing vendor suffix on interaction profile paths to all
    extensions introducing interaction profiles that are missing the suffix. These
    would not meet current style guide requirements.
    ([internal MR 2921](https://gitlab.khronos.org/openxr/openxr/merge_requests/2921),
    [internal issue 2074](https://gitlab.khronos.org/openxr/openxr/issues/2074))
  - Clarify semantics of `XrRect2Df` and `XrRect2Di`.
    ([internal MR 2760](https://gitlab.khronos.org/openxr/openxr/merge_requests/2760))
  - Fix next chain wording on `XrSystemProperties`.
    ([internal MR 2957](https://gitlab.khronos.org/openxr/openxr/merge_requests/2957))
  - Fix "checkSpecLinks" warnings about member and parameter references in the
    specification. This has changed the documentation of a number of structures and
    functions across the spec, although the C prototypes/definitions in the spec as
    well as the header file contents have stayed constant.
    ([internal MR 2960](https://gitlab.khronos.org/openxr/openxr/merge_requests/2960),
    [internal MR 2968](https://gitlab.khronos.org/openxr/openxr/merge_requests/2968),
    [internal MR 2969](https://gitlab.khronos.org/openxr/openxr/merge_requests/2969),
    [internal MR 3001](https://gitlab.khronos.org/openxr/openxr/merge_requests/3001))
  - New vendor extension specification: `XR_MSFT_scene_marker`
    ([internal MR 2601](https://gitlab.khronos.org/openxr/openxr/merge_requests/2601))
  - New vendor extension specification: `XR_ML_user_calibration`
    ([internal MR 2849](https://gitlab.khronos.org/openxr/openxr/merge_requests/2849))
  - Remove unused MathJax script from the HTML spec.
    ([internal MR 2125](https://gitlab.khronos.org/openxr/openxr/merge_requests/2125))
  - Replace usages of contractions, and update `checkMarkup` to ensure they do not
    return.
    ([internal MR 2971](https://gitlab.khronos.org/openxr/openxr/merge_requests/2971))
  - Update stylesheet for HTML spec to improve accessibility.
    ([internal MR 2125](https://gitlab.khronos.org/openxr/openxr/merge_requests/2125))
  - scripts: Adjust to be able to handle generating "freeform" ref pages for
    Android permission names, linked using `reflink:`
    ([internal MR 2947](https://gitlab.khronos.org/openxr/openxr/merge_requests/2947))
  - scripts: Small fixes and cleanups
    ([internal MR 2998](https://gitlab.khronos.org/openxr/openxr/merge_requests/2998),
    [internal MR 2894](https://gitlab.khronos.org/openxr/openxr/merge_requests/2894))
  - xml: Fixed a few errors in MSFT extensions discovered by Schematron checks.
    ([internal MR 2892](https://gitlab.khronos.org/openxr/openxr/merge_requests/2892))

## OpenXR Specification 1.0.30 (2023-09-20)

This release is primarily a quality improvement release, fixing a range of
issues in the registry and specification, in addition to a new vendor extension
and an updated vendor extension.

- Registry
  - Add missing enum tags for enum-sized array struct members.
    ([internal MR 2731](https://gitlab.khronos.org/openxr/openxr/merge_requests/2731))
  - Fix EGL "get proc addr" function pointer typedef.
    ([internal MR 2939](https://gitlab.khronos.org/openxr/openxr/merge_requests/2939))
  - New vendor extension: `XR_YVR_controller_interaction`
    ([internal MR 2841](https://gitlab.khronos.org/openxr/openxr/merge_requests/2841))
  - `XR_BD_controller_interaction`: Add support for G3 devices
    ([internal MR 2872](https://gitlab.khronos.org/openxr/openxr/merge_requests/2872))
  - Fix specification errors highlighted by fixed tooling.
    ([internal MR 2923](https://gitlab.khronos.org/openxr/openxr/merge_requests/2923))
- Specification
  - Clarify how prior frame state is reset when a session starts running.
    ([internal MR 2759](https://gitlab.khronos.org/openxr/openxr/merge_requests/2759),
    [internal issue 2029](https://gitlab.khronos.org/openxr/openxr/issues/2029))
  - Clean up normative language in FB vendor extensions.
    ([internal MR 2563](https://gitlab.khronos.org/openxr/openxr/merge_requests/2563))
  - Clean up normative language in the Rendering chapter.
    ([internal MR 2801](https://gitlab.khronos.org/openxr/openxr/merge_requests/2801))
  - Fix formatting and markup errors in the loader design document.
    ([internal MR 2866](https://gitlab.khronos.org/openxr/openxr/merge_requests/2866))
  - Fix generated broken links from valid usage in ref pages to the next chain
    fundamentals.
    ([internal MR 2931](https://gitlab.khronos.org/openxr/openxr/merge_requests/2931),
    [internal issue 1369](https://gitlab.khronos.org/openxr/openxr/issues/1369))
  - Fix broken links and update URLs in specification, extension process, style
    guide, and loader doc.
    ([internal MR 2935](https://gitlab.khronos.org/openxr/openxr/merge_requests/2935))
  - New vendor extension specification: `XR_YVR_controller_interaction`
    ([internal MR 2841](https://gitlab.khronos.org/openxr/openxr/merge_requests/2841))
  - `XR_BD_controller_interaction`: Add support for G3 devices
    ([internal MR 2872](https://gitlab.khronos.org/openxr/openxr/merge_requests/2872))
  - `XR_EXT_debug_utils`: Fix XML to reflect that
    `XrDebugUtilsMessengerCallbackDataEXT` parameters `messageId` and
    `functionName` are optional.
    ([internal MR 2864](https://gitlab.khronos.org/openxr/openxr/merge_requests/2864))
  - scripts: Fix member name lookups in `entity_db`, enabling numerous spec
    warnings that had been hidden.
    ([internal MR 2923](https://gitlab.khronos.org/openxr/openxr/merge_requests/2923))
  - Fix specification errors (core and extension) highlighted by fixed tooling.
    ([internal MR 2923](https://gitlab.khronos.org/openxr/openxr/merge_requests/2923))

## OpenXR Specification 1.0.29 (2023-08-25)

This release contains several fixes to the specification, as well as
enhancements to the loader documentation/specification to support architecture
and ABI specific active runtime manifest names on Linux and Android.

- Registry
  - Change `PFNEGLGETPROCADDRESSPROC` (for `eglGetProcAddress`) to a locally
    defined type to avoid compiler errors.
    ([internal MR 2468](https://gitlab.khronos.org/openxr/openxr/merge_requests/2468))
  - Extension reservation: Register author ID and reserve vendor extensions for
    YVR.
    ([internal MR 2832](https://gitlab.khronos.org/openxr/openxr/merge_requests/2832))
  - New vendor extension: `XR_META_passthrough_preferences`
    ([internal MR 2694](https://gitlab.khronos.org/openxr/openxr/merge_requests/2694))
  - `XR_HTCX_vive_tracker_interaction`: Added new role paths for wrists and ankles.
    ([internal MR 2728](https://gitlab.khronos.org/openxr/openxr/merge_requests/2728))
- Specification
  - Change `PFNEGLGETPROCADDRESSPROC` (for `eglGetProcAddress`) to a locally
    defined type to avoid compiler errors.
    ([internal MR 2468](https://gitlab.khronos.org/openxr/openxr/merge_requests/2468))
  - Fix specification text mentions of `eyeVisibility` field in Khronos composition
    layer extensions, to match the XML and headers.
    ([internal MR 2878](https://gitlab.khronos.org/openxr/openxr/merge_requests/2878))
  - Improvement: Add note to OpenXR styleguide to discourage use of callback
    functions in OpenXR extensions.
    ([internal MR 2734](https://gitlab.khronos.org/openxr/openxr/merge_requests/2734))
  - Loader spec: Clarify and deduplicate the loader specification's listing of
    android manifest search paths.
    ([internal MR 2829](https://gitlab.khronos.org/openxr/openxr/merge_requests/2829),
    [internal issue 2046](https://gitlab.khronos.org/openxr/openxr/issues/2046))
  - Loader spec: Fix description of `<queries>` element contents: existing
    description would fail to install.
    ([internal MR 2840](https://gitlab.khronos.org/openxr/openxr/merge_requests/2840),
    [internal issue 2053](https://gitlab.khronos.org/openxr/openxr/issues/2053))
  - Makefile: Remove obsolete cygwin support in spec building target, no longer
    needed and actually caused it to not work under MSYS2.
    ([internal MR 2885](https://gitlab.khronos.org/openxr/openxr/merge_requests/2885))
  - New vendor extension specification: `XR_META_passthrough_preferences`
    ([internal MR 2694](https://gitlab.khronos.org/openxr/openxr/merge_requests/2694))
  - Style guide: Document the XML schema of `xr.xml`
    ([internal MR 2875](https://gitlab.khronos.org/openxr/openxr/merge_requests/2875))
  - `XR_HTCX_vive_tracker_interaction`: Added new role paths for wrists and ankles.
    ([internal MR 2728](https://gitlab.khronos.org/openxr/openxr/merge_requests/2728))
  - `XR_OPPO_controller_interaction`: Fix formatting of path lists.
    ([internal MR 2831](https://gitlab.khronos.org/openxr/openxr/merge_requests/2831),
    [OpenXR-Docs issue 156](https://github.com/KhronosGroup/OpenXR-Docs/issues/156),
    [internal issue 2047](https://gitlab.khronos.org/openxr/openxr/issues/2047))
  - scripts: Provide better feedback on interface struct erroneously having a
    values attribute.
    ([internal MR 2856](https://gitlab.khronos.org/openxr/openxr/merge_requests/2856))
  - scripts: Update regex in xrconventions to allow words in type naming that
    succeed digits but start with a "D"
    ([internal MR 2857](https://gitlab.khronos.org/openxr/openxr/merge_requests/2857))
  - scripts: Fix formatting of "basetype" (generally typedef) names to once again
    be monospace "code".
    ([internal MR 2890](https://gitlab.khronos.org/openxr/openxr/merge_requests/2890),
    [internal issue 2048](https://gitlab.khronos.org/openxr/openxr/issues/2048))

## OpenXR Specification 1.0.28 (2023-07-10)

This release features a number of new extensions, including several multi-vendor
extensions, among other improvements and clarifications.

- Registry
  - Added defines to `xr.xml` for extension enum base and enum stride.
    ([internal MR 2693](https://gitlab.khronos.org/openxr/openxr/merge_requests/2693),
    [OpenXR-Docs issue 148](https://github.com/KhronosGroup/OpenXR-Docs/issues/148),
    [internal issue 1979](https://gitlab.khronos.org/openxr/openxr/issues/1979))
  - Extension reservation: Reserve an extension for `XR_EXT_future`
    ([internal MR 2631](https://gitlab.khronos.org/openxr/openxr/merge_requests/2631))
  - Extension reservation: Register `ANDROID` author ID and reserve 15 extensions
    for it.
    ([internal MR 2690](https://gitlab.khronos.org/openxr/openxr/merge_requests/2690))
  - Extension reservation: Reserve extensions for "user presence" and "locate
    spaces"
    ([internal MR 2705](https://gitlab.khronos.org/openxr/openxr/merge_requests/2705))
  - Extension reservation: Reserve 25 extensions for Magic Leap.
    ([internal MR 2778](https://gitlab.khronos.org/openxr/openxr/merge_requests/2778))
  - Extension reservation: Reserve extension for `XR_KHR_extendable_action_binding`
    ([internal MR 2779](https://gitlab.khronos.org/openxr/openxr/merge_requests/2779))
  - Fix spelling.
    ([internal MR 2766](https://gitlab.khronos.org/openxr/openxr/merge_requests/2766))
  - Fixed the error code specification for `xrGetControllerModelPropertiesMSFT`
    function.
    ([internal MR 2600](https://gitlab.khronos.org/openxr/openxr/merge_requests/2600))
  - New multi-vendor extension: `XR_EXT_hand_interaction`
    ([internal MR 2116](https://gitlab.khronos.org/openxr/openxr/merge_requests/2116))
  - New multi-vendor extension: `XR_EXT_plane_detection`
    ([internal MR 2510](https://gitlab.khronos.org/openxr/openxr/merge_requests/2510),
    [internal MR 2791](https://gitlab.khronos.org/openxr/openxr/merge_requests/2791))
  - New multi-vendor extension: `XR_EXT_hand_tracking_data_source`
    ([internal MR 2568](https://gitlab.khronos.org/openxr/openxr/merge_requests/2568))
  - New vendor extension: `XR_META_passthrough_color_lut`
    ([internal MR 2507](https://gitlab.khronos.org/openxr/openxr/merge_requests/2507))
  - New vendor extension: `XR_META_virtual_keyboard`
    ([internal MR 2555](https://gitlab.khronos.org/openxr/openxr/merge_requests/2555))
  - New vendor extension: `XR_OPPO_controller_interaction`
    ([OpenXR-Docs PR 146](https://github.com/KhronosGroup/OpenXR-Docs/pull/146))
  - Update Magic Leap contact
    ([internal MR 2699](https://gitlab.khronos.org/openxr/openxr/merge_requests/2699))
  - `XR_FB_face_tracking`: Non-functional registry change, fixing a problem with
    standalone headers.
    ([internal MR 2663](https://gitlab.khronos.org/openxr/openxr/merge_requests/2663))
  - `XR_FB_scene`: Introduce `XrSemanticLabelsSupportInfoFB` and bump spec version
    to 3.
    ([internal MR 2682](https://gitlab.khronos.org/openxr/openxr/merge_requests/2682))
  - `XR_FB_spatial_entity` and `XR_FB_scene`: Add `XR_ERROR_SIZE_INSUFFICIENT`
    return code to functions which use the two-call idiom.
    ([internal MR 2718](https://gitlab.khronos.org/openxr/openxr/merge_requests/2718))
  - `XR_FB_touch_controller_pro`: Fix XML to require the `touch_controller_pro`
    interaction profile for the extension
    ([internal MR 2806](https://gitlab.khronos.org/openxr/openxr/merge_requests/2806))
  - registry: Remove extraneous whitespace from some commands.
    ([OpenXR-SDK-Source PR 397](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/397))
  - schematron: Improve self tests.
    ([internal MR 2680](https://gitlab.khronos.org/openxr/openxr/merge_requests/2680))
  - schematron: Require vendor tag on interaction profile paths introduced by
    extensions.
    ([internal MR 2684](https://gitlab.khronos.org/openxr/openxr/merge_requests/2684))
  - scripts: Allow schematron to check an alternate XML file.
    ([internal MR 2670](https://gitlab.khronos.org/openxr/openxr/merge_requests/2670))
- Specification
  - Added normative language clarifying that `XrViewConfigurationType` usage must
    be 'activated' by `xrBeginSession` (or by extensions). This was previously
    described clearly but non-normatively.
    ([internal MR 2700](https://gitlab.khronos.org/openxr/openxr/merge_requests/2700))
  - Clarify the behavior of functions which initiate an asynchronous request when
    the function fails immediately.
    ([internal MR 2716](https://gitlab.khronos.org/openxr/openxr/merge_requests/2716))
  - Clarify that we **do** intend to capture most invalid usage with return codes,
    unlike Vulkan, which is where we borrowed some of this language from.
    ([internal MR 2762](https://gitlab.khronos.org/openxr/openxr/merge_requests/2762))
  - Corrected the extension enum base to 10^9.
    ([internal MR 2693](https://gitlab.khronos.org/openxr/openxr/merge_requests/2693),
    [OpenXR-Docs issue 148](https://github.com/KhronosGroup/OpenXR-Docs/issues/148),
    [internal issue 1979](https://gitlab.khronos.org/openxr/openxr/issues/1979))
  - Fix nesting level of "Valid Usage" sections and headings, which resulted in a
    re-numbering of sections between 2.7 and 3.
    ([internal MR 2761](https://gitlab.khronos.org/openxr/openxr/merge_requests/2761),
    [OpenXR-Docs issue 149](https://github.com/KhronosGroup/OpenXR-Docs/issues/149),
    [internal issue 1989](https://gitlab.khronos.org/openxr/openxr/issues/1989))
  - Fix nesting level of some sections and headings in the Rendering chapter, which
    resulted in a re-numbering of sections between 10.4 and 11.
    ([internal MR 2761](https://gitlab.khronos.org/openxr/openxr/merge_requests/2761),
    [OpenXR-Docs issue 149](https://github.com/KhronosGroup/OpenXR-Docs/issues/149),
    [internal issue 1989](https://gitlab.khronos.org/openxr/openxr/issues/1989))
  - Fix flags-type boilerplate to mention `XrCompositionLayerFlagBits` in the body
    of the ref page of `XrCompositionLayerFlags` for a more usable ref page
    experience.
    ([internal MR 2813](https://gitlab.khronos.org/openxr/openxr/merge_requests/2813))
  - Fix markup of a `subpathname:` which was marked as a `pathname:`.
    ([internal MR 2673](https://gitlab.khronos.org/openxr/openxr/merge_requests/2673))
  - Loader docs: Specify the required `queries` elements for an OpenXR application
    on Android, so that runtime and layer components loaded in the application
    process may access their own package in API >29.
    ([internal MR 2708](https://gitlab.khronos.org/openxr/openxr/merge_requests/2708))
  - New multi-vendor extension specification: `XR_EXT_hand_interaction`
    ([internal MR 2116](https://gitlab.khronos.org/openxr/openxr/merge_requests/2116))
  - New multi-vendor extension specification: `XR_EXT_plane_detection`
    ([internal MR 2510](https://gitlab.khronos.org/openxr/openxr/merge_requests/2510),
    [internal MR 2781](https://gitlab.khronos.org/openxr/openxr/merge_requests/2781),
    [internal MR 2791](https://gitlab.khronos.org/openxr/openxr/merge_requests/2791))
  - New multi-vendor extension specification: `XR_EXT_hand_tracking_data_source`
    ([internal MR 2568](https://gitlab.khronos.org/openxr/openxr/merge_requests/2568))
  - New vendor extension specification: `XR_META_passthrough_color_lut`
    ([internal MR 2507](https://gitlab.khronos.org/openxr/openxr/merge_requests/2507))
  - New vendor extension specification: `XR_META_virtual_keyboard`
    ([internal MR 2555](https://gitlab.khronos.org/openxr/openxr/merge_requests/2555))
  - New vendor extension specification: `XR_OPPO_controller_interaction`
    ([OpenXR-Docs PR 146](https://github.com/KhronosGroup/OpenXR-Docs/pull/146))
  - Refine the spec language for a few MSFT extensions, including a clarification
    for controller model's dependency to an active grip pose action, and a
    correction to the `xrTryCreateSpatialGraphStaticNodeBindingMSFT` function's
    behavior.
    ([internal MR 2600](https://gitlab.khronos.org/openxr/openxr/merge_requests/2600))
  - Remove incorrect/unused exception in the structure type value format rule.
    ([internal MR 2762](https://gitlab.khronos.org/openxr/openxr/merge_requests/2762))
  - `XR_EXT_debug_utils`: Remove erroneous member documentation.
    ([internal MR 2763](https://gitlab.khronos.org/openxr/openxr/merge_requests/2763),
    [OpenXR-Docs issue 151](https://github.com/KhronosGroup/OpenXR-Docs/issues/151),
    [internal issue 2015](https://gitlab.khronos.org/openxr/openxr/issues/2015))
  - `XR_EXT_debug_utils`: Clarify requirement on ending label regions.
    ([internal MR 2763](https://gitlab.khronos.org/openxr/openxr/merge_requests/2763),
    [OpenXR-Docs issue 150](https://github.com/KhronosGroup/OpenXR-Docs/issues/150),
    [internal issue 2014](https://gitlab.khronos.org/openxr/openxr/issues/2014))
  - `XR_FB_scene`: Introduce XrSemanticLabelsSupportInfoFB and bump spec version to
    3.
    ([internal MR 2682](https://gitlab.khronos.org/openxr/openxr/merge_requests/2682))
  - `XR_FB_scene`: Fixed specification language for `XrRoomLayoutFB` and
    `XrBoundary2DFB` which incorrectly described the input capacity parameter as
    referring to the number of bytes when, in fact, it refers to the number of
    elements in the array.
    ([internal MR 2713](https://gitlab.khronos.org/openxr/openxr/merge_requests/2713))
  - `XR_FB_scene`: Clarified the meaning of the 2D and 3D bounding boxes obtained
    by `xrGetSpaceBoundingBox2DFB` and `xrGetSpaceBoundingBox3DFB`.
    ([internal MR 2714](https://gitlab.khronos.org/openxr/openxr/merge_requests/2714))
  - `XR_FB_scene`: Clarify the behavior of `xrGetSpaceRoomLayoutFB` during the
    first call of the two-call idiom when the user retrieves the required buffer
    length.
    ([internal MR 2715](https://gitlab.khronos.org/openxr/openxr/merge_requests/2715))
  - `XR_FB_scene` and `XR_MSFT_scene_understanding`: Fix incorrect documentation
    which refers to some struct fields as pointers when they are not pointers.
    ([internal MR 2805](https://gitlab.khronos.org/openxr/openxr/merge_requests/2805))
  - `XR_FB_spatial_entity_container`: Clarify two-call idiom: Mention that
    `uuidCapcityInput` can be 0.
    ([internal MR 2772](https://gitlab.khronos.org/openxr/openxr/merge_requests/2772))
  - `XR_FB_spatial_entity_query`: Fixed two typos in the documentation: (1)
    `XrEventDataSpaceQueryResultsAvailableFB` said to retrieve results with
    `xrQuerySpacesFB`, but the correct function is `xrRetrieveSpaceQueryResultsFB`
    and (2) removed an extraneous "if" in `xrQuerySpacesFB`.
    ([internal MR 2681](https://gitlab.khronos.org/openxr/openxr/merge_requests/2681))
  - scripts: Update some of our spec toolchain to partially sync with Vulkan, and
    change the way we mark up extension names.
    ([internal MR 2656](https://gitlab.khronos.org/openxr/openxr/merge_requests/2656))
  - scripts: Update header generation to only output enum values from extensions
    that are being emitted.
    ([internal MR 2671](https://gitlab.khronos.org/openxr/openxr/merge_requests/2671))
  - scripts: Improve code quality.
    ([internal MR 2757](https://gitlab.khronos.org/openxr/openxr/merge_requests/2757),
    [internal MR 2816](https://gitlab.khronos.org/openxr/openxr/merge_requests/2816))
  - scripts: Add `findBareNormatives.sh` and `reserve_extensions.py`, which are
    useful in the extension development process.
    ([internal MR 2783](https://gitlab.khronos.org/openxr/openxr/merge_requests/2783),
    [internal MR 2799](https://gitlab.khronos.org/openxr/openxr/merge_requests/2799))
  - spec: Trim extra empty line for define group
    ([internal MR 2724](https://gitlab.khronos.org/openxr/openxr/merge_requests/2724))
  - style guide: Update to match current conventions more closely.
    ([internal MR 1412](https://gitlab.khronos.org/openxr/openxr/merge_requests/1412))
  - style guide: Require vendor tag on interaction profile paths introduced by
    extensions.
    ([internal MR 2684](https://gitlab.khronos.org/openxr/openxr/merge_requests/2684))

## OpenXR Specification 1.0.27 (2023-03-21)

This release contains a large list of improvements, including interaction
profile definitions in machine-readable format in the XML, consistent tool-based
formatting of the XML, several spec cleanups and clarifications, and a wide
variety of new vendor and multi-vendor extensions.

- Registry
  - Add interaction profile definitions to `xr.xml`
    ([internal MR 2485](https://gitlab.khronos.org/openxr/openxr/merge_requests/2485))
  - Chore: Format the full XML API registry with
    [PrettyRegistryXML](https://github.com/rpavlik/PrettyRegistryXml), making some
    small changes by hand to clean up.
    ([internal MR 2540](https://gitlab.khronos.org/openxr/openxr/merge_requests/2540),
    [internal MR 2329](https://gitlab.khronos.org/openxr/openxr/merge_requests/2329),
    [OpenXR-SDK-Source PR 373](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/373),
    [OpenXR-Docs PR 14](https://github.com/KhronosGroup/OpenXR-Docs/pull/14),
    [OpenXR-CTS PR 50](https://github.com/KhronosGroup/OpenXR-CTS/pull/50),
    [OpenXR-SDK PR 12](https://github.com/KhronosGroup/OpenXR-SDK/pull/12))
  - Document how to generate a standalone header file for an extension.
    ([internal MR 2627](https://gitlab.khronos.org/openxr/openxr/merge_requests/2627))
  - Extension reservation: Register author ID and reserve vendor extensions for
    Logitech.
    ([internal MR 2504](https://gitlab.khronos.org/openxr/openxr/merge_requests/2504))
  - Extension reservation: Reserve an extension number for a multi-vendor
    extension.
    ([internal MR 2520](https://gitlab.khronos.org/openxr/openxr/merge_requests/2520))
  - Extension reservation: Reserve an extension for `XR_EXT_hand_tracking_usage`
    ([internal MR 2550](https://gitlab.khronos.org/openxr/openxr/merge_requests/2550))
  - Extension reservation: Reserve extension id 430 for `XR_EXT_plane_detection`
    ([internal MR 2565](https://gitlab.khronos.org/openxr/openxr/merge_requests/2565))
  - Extension reservation: Reserve vendor extensions for Monado.
    ([internal MR 2613](https://gitlab.khronos.org/openxr/openxr/merge_requests/2613))
  - Extension reservation: Reserve vendor extensions for ACER.
    ([OpenXR-Docs PR 142](https://github.com/KhronosGroup/OpenXR-Docs/pull/142))
  - Extension reservation: Reserve a vendor extension for OPPO.
    ([OpenXR-Docs PR 145](https://github.com/KhronosGroup/OpenXR-Docs/pull/145))
  - New vendor extension: `XR_FB_composition_layer_depth_test`
    ([internal MR 2208](https://gitlab.khronos.org/openxr/openxr/merge_requests/2208),
    [internal issue 1657](https://gitlab.khronos.org/openxr/openxr/issues/1657))
  - New vendor extension: `XR_META_foveation_eye_tracked`
    ([internal MR 2239](https://gitlab.khronos.org/openxr/openxr/merge_requests/2239),
    [internal MR 2273](https://gitlab.khronos.org/openxr/openxr/merge_requests/2273),
    [internal MR 2332](https://gitlab.khronos.org/openxr/openxr/merge_requests/2332))
  - New vendor extension: `XR_QCOM_tracking_optimization_settings`
    ([internal MR 2261](https://gitlab.khronos.org/openxr/openxr/merge_requests/2261),
    [internal issue 1703](https://gitlab.khronos.org/openxr/openxr/issues/1703))
  - New vendor extension: `XR_META_local_dimming`
    ([internal MR 2267](https://gitlab.khronos.org/openxr/openxr/merge_requests/2267),
    [internal MR 2595](https://gitlab.khronos.org/openxr/openxr/merge_requests/2595))
  - New vendor extension: `XR_FB_spatial_entity_sharing`
    ([internal MR 2274](https://gitlab.khronos.org/openxr/openxr/merge_requests/2274))
  - New vendor extension: `XR_FB_scene_capture`
    ([internal MR 2286](https://gitlab.khronos.org/openxr/openxr/merge_requests/2286))
  - New vendor extension: `XR_FB_spatial_entity_storage_batch`
    ([internal MR 2312](https://gitlab.khronos.org/openxr/openxr/merge_requests/2312))
  - New vendor extension: `XR_FB_haptic_amplitude_envelope`
    ([internal MR 2326](https://gitlab.khronos.org/openxr/openxr/merge_requests/2326))
  - New vendor extension: `XR_FB_touch_controller_pro`
    ([internal MR 2327](https://gitlab.khronos.org/openxr/openxr/merge_requests/2327),
    [internal issue 1916](https://gitlab.khronos.org/openxr/openxr/issues/1916))
  - New vendor extension: `XR_FB_haptic_pcm`
    ([internal MR 2329](https://gitlab.khronos.org/openxr/openxr/merge_requests/2329))
  - New vendor extension: `FB_face_tracking`
    ([internal MR 2334](https://gitlab.khronos.org/openxr/openxr/merge_requests/2334),
    [internal MR 2539](https://gitlab.khronos.org/openxr/openxr/merge_requests/2539))
  - New vendor extension: `XR_FB_eye_tracking_social`
    ([internal MR 2336](https://gitlab.khronos.org/openxr/openxr/merge_requests/2336),
    [internal MR 2576](https://gitlab.khronos.org/openxr/openxr/merge_requests/2576))
  - New vendor extension: `XR_FB_body_tracking`
    ([internal MR 2339](https://gitlab.khronos.org/openxr/openxr/merge_requests/2339),
    [internal MR 2575](https://gitlab.khronos.org/openxr/openxr/merge_requests/2575))
  - New vendor extension: `XR_OCULUS_external_camera`
    ([internal MR 2397](https://gitlab.khronos.org/openxr/openxr/merge_requests/2397),
    [internal MR 2344](https://gitlab.khronos.org/openxr/openxr/merge_requests/2344))
  - New vendor extension: `XR_FB_spatial_entity_user`
    ([internal MR 2407](https://gitlab.khronos.org/openxr/openxr/merge_requests/2407))
  - New vendor extension: `XR_FB_touch_controller_proximity`
    ([internal MR 2412](https://gitlab.khronos.org/openxr/openxr/merge_requests/2412))
  - New vendor extension: `XR_ML_global_dimmer`
    ([internal MR 2461](https://gitlab.khronos.org/openxr/openxr/merge_requests/2461))
  - New vendor extension: `XR_ML_frame_end_info`
    ([internal MR 2462](https://gitlab.khronos.org/openxr/openxr/merge_requests/2462),
    [internal MR 2536](https://gitlab.khronos.org/openxr/openxr/merge_requests/2536))
  - New vendor extension: `XR_ML_compat`
    ([internal MR 2473](https://gitlab.khronos.org/openxr/openxr/merge_requests/2473))
  - New vendor extension: `XR_EXT_local_floor`
    ([internal MR 2503](https://gitlab.khronos.org/openxr/openxr/merge_requests/2503),
    [internal issue 746](https://gitlab.khronos.org/openxr/openxr/issues/746),
    [internal issue 1606](https://gitlab.khronos.org/openxr/openxr/issues/1606),
    [OpenXR-Docs issue 103](https://github.com/KhronosGroup/OpenXR-Docs/issues/103))
  - New vendor extension: `XR_BD_controller_interaction`
    ([internal MR 2527](https://gitlab.khronos.org/openxr/openxr/merge_requests/2527))
  - New vendor extension: `XR_MNDX_force_feedback_curl`
    ([OpenXR-Docs PR 136](https://github.com/KhronosGroup/OpenXR-Docs/pull/136))
  - Register author ID for Matthieu Bucchianeri.
    ([OpenXR-Docs PR 143](https://github.com/KhronosGroup/OpenXR-Docs/pull/143))
  - Rename tag name to a short one for ByteDance.
    ([internal MR 2502](https://gitlab.khronos.org/openxr/openxr/merge_requests/2502))
  - Schema: Add initial tests for Schematron rules.
    ([internal MR 2512](https://gitlab.khronos.org/openxr/openxr/merge_requests/2512))
  - Schema: Add author ID schematron checks and change duplicate name/number report
    to an assert
    ([internal MR 2514](https://gitlab.khronos.org/openxr/openxr/merge_requests/2514))
  - Schema: Fix Relax-NG checks of naming convention, and add naming convention
    checks to Schematron.
    ([internal MR 2538](https://gitlab.khronos.org/openxr/openxr/merge_requests/2538))
  - Schematron: Update extension naming rule to allow for vendor tags to be
    followed by an X for experimental and a version number
    ([internal MR 2518](https://gitlab.khronos.org/openxr/openxr/merge_requests/2518))
  - scripts: Let `deprecated` override `provisional` when choosing extension table
    of contents section.
    ([internal MR 2547](https://gitlab.khronos.org/openxr/openxr/merge_requests/2547))
  - scripts: Fix leftover exclusion of `extensions/meta` from `checkMarkup` now
    that it no longer generated files.
    ([internal MR 2560](https://gitlab.khronos.org/openxr/openxr/merge_requests/2560))
- Specification
  - Add missing "IP Status" data to `XR_FB_display_refresh_rate`.
    ([internal MR 2439](https://gitlab.khronos.org/openxr/openxr/merge_requests/2439))
  - Added the function call for `xrPollEvent` to the typical XR app sample.
    ([internal MR 2605](https://gitlab.khronos.org/openxr/openxr/merge_requests/2605))
  - Clarify that passing `0` for `elementCapacityInput` in two-call idiom functions
    is explicitly valid usage, but there may be other reasons that an error is
    returned.
    ([internal MR 2492](https://gitlab.khronos.org/openxr/openxr/merge_requests/2492))
  - Clarify that system vendor ids match USB vendor ids.
    ([internal MR 2634](https://gitlab.khronos.org/openxr/openxr/merge_requests/2634))
  - Clean up markup of various two-call idiom mentions in the core.
    ([internal MR 2619](https://gitlab.khronos.org/openxr/openxr/merge_requests/2619))
  - Fix use of normatives in paragraph introducing the concept of extensions.
    ([internal MR 2466](https://gitlab.khronos.org/openxr/openxr/merge_requests/2466))
  - Fix a language error in `xrDestroySpace` description language: it destroys a
    space, not creates one.
    ([internal MR 2516](https://gitlab.khronos.org/openxr/openxr/merge_requests/2516))
  - Fix broken internal links in `XR_FB_triangle_mesh` specification.
    ([internal MR 2593](https://gitlab.khronos.org/openxr/openxr/merge_requests/2593))
  - Fix typo in description of function pointer naming in Appendix.
    ([internal MR 2599](https://gitlab.khronos.org/openxr/openxr/merge_requests/2599))
  - Fix typos in Fundamentals chapter
    ([internal MR 2608](https://gitlab.khronos.org/openxr/openxr/merge_requests/2608))
  - Fixed sample code which was missing specifying the view configuration type to
    locate with `xrLocateViews`
    ([internal MR 2624](https://gitlab.khronos.org/openxr/openxr/merge_requests/2624))
  - Include documentation of `XR_TRUE` and `XR_FALSE` values in spec and reference
    pages.
    ([internal MR 2466](https://gitlab.khronos.org/openxr/openxr/merge_requests/2466))
  - Make structure initialization in sample code more consistent.
    ([internal MR 2557](https://gitlab.khronos.org/openxr/openxr/merge_requests/2557))
  - New vendor extension specification: `XR_FB_composition_layer_depth_test`
    ([internal MR 2208](https://gitlab.khronos.org/openxr/openxr/merge_requests/2208),
    [internal issue 1657](https://gitlab.khronos.org/openxr/openxr/issues/1657))
  - New vendor extension specification: `XR_META_foveation_eye_tracked`
    ([internal MR 2239](https://gitlab.khronos.org/openxr/openxr/merge_requests/2239),
    [internal MR 2273](https://gitlab.khronos.org/openxr/openxr/merge_requests/2273),
    [internal MR 2332](https://gitlab.khronos.org/openxr/openxr/merge_requests/2332))
  - New vendor extension specification: `XR_QCOM_tracking_optimization_settings`
    ([internal MR 2261](https://gitlab.khronos.org/openxr/openxr/merge_requests/2261),
    [internal issue 1703](https://gitlab.khronos.org/openxr/openxr/issues/1703))
  - New vendor extension specification: `XR_META_local_dimming`
    ([internal MR 2267](https://gitlab.khronos.org/openxr/openxr/merge_requests/2267))
  - New vendor extension specification: `XR_FB_spatial_entity_sharing`
    ([internal MR 2274](https://gitlab.khronos.org/openxr/openxr/merge_requests/2274))
  - New vendor extension specification: `XR_FB_scene_capture`
    ([internal MR 2286](https://gitlab.khronos.org/openxr/openxr/merge_requests/2286))
  - New vendor extension specification: `XR_FB_spatial_entity_storage_batch`
    ([internal MR 2312](https://gitlab.khronos.org/openxr/openxr/merge_requests/2312))
  - New vendor extension specification: `XR_FB_haptic_amplitude_envelope`
    ([internal MR 2326](https://gitlab.khronos.org/openxr/openxr/merge_requests/2326))
  - New vendor extension specification: `XR_FB_touch_controller_pro`
    ([internal MR 2327](https://gitlab.khronos.org/openxr/openxr/merge_requests/2327))
  - New vendor extension specification: `XR_FB_haptic_pcm`
    ([internal MR 2329](https://gitlab.khronos.org/openxr/openxr/merge_requests/2329))
  - New vendor extension specification: `XR_FB_face_tracking`
    ([internal MR 2334](https://gitlab.khronos.org/openxr/openxr/merge_requests/2334),
    [internal MR 2608](https://gitlab.khronos.org/openxr/openxr/merge_requests/2608))
  - New vendor extension specification: `XR_FB_eye_tracking_social`
    ([internal MR 2336](https://gitlab.khronos.org/openxr/openxr/merge_requests/2336))
  - New vendor extension specification: `XR_FB_body_tracking`
    ([internal MR 2339](https://gitlab.khronos.org/openxr/openxr/merge_requests/2339))
  - New vendor extension specification: `XR_OCULUS_external_camera`
    ([internal MR 2397](https://gitlab.khronos.org/openxr/openxr/merge_requests/2397))
  - New vendor extension specification: `XR_FB_spatial_entity_user`
    ([internal MR 2407](https://gitlab.khronos.org/openxr/openxr/merge_requests/2407))
  - New vendor extension specification: `XR_FB_touch_controller_proximity`
    ([internal MR 2412](https://gitlab.khronos.org/openxr/openxr/merge_requests/2412))
  - New vendor extension specification: `XR_ML_global_dimmer`
    ([internal MR 2461](https://gitlab.khronos.org/openxr/openxr/merge_requests/2461))
  - New vendor extension specification: `XR_ML_frame_end_info`
    ([internal MR 2462](https://gitlab.khronos.org/openxr/openxr/merge_requests/2462),
    [internal MR 2536](https://gitlab.khronos.org/openxr/openxr/merge_requests/2536),
    [internal MR 2561](https://gitlab.khronos.org/openxr/openxr/merge_requests/2561))
  - New vendor extension specification: `XR_ML_compat`
    ([internal MR 2473](https://gitlab.khronos.org/openxr/openxr/merge_requests/2473))
  - New vendor extension specification: `XR_EXT_local_floor`
    ([internal MR 2503](https://gitlab.khronos.org/openxr/openxr/merge_requests/2503),
    [internal issue 746](https://gitlab.khronos.org/openxr/openxr/issues/746),
    [internal issue 1606](https://gitlab.khronos.org/openxr/openxr/issues/1606),
    [OpenXR-Docs issue 103](https://github.com/KhronosGroup/OpenXR-Docs/issues/103))
  - New vendor extension specification: `XR_BD_controller_interaction`
    ([internal MR 2527](https://gitlab.khronos.org/openxr/openxr/merge_requests/2527))
  - New vendor extension specification: `XR_MNDX_force_feedback_curl`
    ([OpenXR-Docs PR 136](https://github.com/KhronosGroup/OpenXR-Docs/pull/136))
  - Reserve Monado vendor ID
    ([internal MR 2633](https://gitlab.khronos.org/openxr/openxr/merge_requests/2633))
  - Style guide: Adjust examples to avoid broken links.
    ([internal MR 2597](https://gitlab.khronos.org/openxr/openxr/merge_requests/2597))
  - Style guide: Make vendor IDs start above 0x10000.
    ([internal MR 2633](https://gitlab.khronos.org/openxr/openxr/merge_requests/2633))
  - Update specification license to the most recent v10 "KhronosSpecCopyright",
    with notice about vendor extensions conditionally included.
    ([internal MR 2573](https://gitlab.khronos.org/openxr/openxr/merge_requests/2573),
    [internal issue 1880](https://gitlab.khronos.org/openxr/openxr/issues/1880),
    [internal MR 2612](https://gitlab.khronos.org/openxr/openxr/merge_requests/2612))
  - Update spec PDF diff tool for PyPDF2 v3
    ([internal MR 2608](https://gitlab.khronos.org/openxr/openxr/merge_requests/2608))
  - Update `XR_VARJO_foveated_rendering` sample code with a missing initialization
    ([internal MR 2636](https://gitlab.khronos.org/openxr/openxr/merge_requests/2636))
  - Update URL for glTF 2.0 specification in vendor extensions.
    ([internal MR 2648](https://gitlab.khronos.org/openxr/openxr/merge_requests/2648))
  - Update URLs with branch names in scripts.
    ([internal MR 2648](https://gitlab.khronos.org/openxr/openxr/merge_requests/2648))
  - Updated session lifecycle diagram to clarify the exiting conditions when app is
    running without non-XR experience.
    ([internal MR 2594](https://gitlab.khronos.org/openxr/openxr/merge_requests/2594),
    [internal issue 1729](https://gitlab.khronos.org/openxr/openxr/issues/1729))
  - scripts: Fix generating wrong alias when having `enum` with `extends` in
    `xr.xml` using `genxr.py`
    ([internal MR 2509](https://gitlab.khronos.org/openxr/openxr/merge_requests/2509))
  - scripts: Clean up makefile and update link to Vulkan spec.
    ([internal MR 2596](https://gitlab.khronos.org/openxr/openxr/merge_requests/2596))

## OpenXR Specification 1.0.26 (2022-11-18)

This release contains some spec clarifications, improvements to tooling, and a
variety of new vendor and multi-vendor extensions.

- Registry
  - Add a warning to `XR_COMPOSITION_LAYER_CORRECT_CHROMATIC_ABERRATION_BIT` saying
    that it is not in use and planned for deprecation
    ([internal MR 2378](https://gitlab.khronos.org/openxr/openxr/merge_requests/2378),
    [internal issue 1751](https://gitlab.khronos.org/openxr/openxr/issues/1751))
  - Add new `XR_EXT_active_action_set_priority` vendor extension.
    ([internal MR 2288](https://gitlab.khronos.org/openxr/openxr/merge_requests/2288),
    [internal issue 1699](https://gitlab.khronos.org/openxr/openxr/issues/1699))
  - Add new `XR_HTC_passthrough` vendor extension.
    ([internal MR 2349](https://gitlab.khronos.org/openxr/openxr/merge_requests/2349))
  - Add new `XR_HTC_foveation` vendor extension.
    ([internal MR 2377](https://gitlab.khronos.org/openxr/openxr/merge_requests/2377))
  - Add new `XR_META_headset_id` vendor extension.
    ([internal MR 2410](https://gitlab.khronos.org/openxr/openxr/merge_requests/2410))
  - Improve Schematron rules for the registry XML and update the tool version used.
    ([internal MR 2418](https://gitlab.khronos.org/openxr/openxr/merge_requests/2418),
    [internal MR 2426](https://gitlab.khronos.org/openxr/openxr/merge_requests/2426),
    [internal MR 2457](https://gitlab.khronos.org/openxr/openxr/merge_requests/2457),
    [internal MR 2460](https://gitlab.khronos.org/openxr/openxr/merge_requests/2460),
    [internal MR 2465](https://gitlab.khronos.org/openxr/openxr/merge_requests/2465))
  - Register author ID and reserve vendor extensions for ByteDance.
    ([internal MR 2482](https://gitlab.khronos.org/openxr/openxr/merge_requests/2482),
    [OpenXR-Docs PR 137](https://github.com/KhronosGroup/OpenXR-Docs/pull/137))
  - Register author ID for danwillm and reserve vendor extensions.
    ([OpenXR-Docs PR 138](https://github.com/KhronosGroup/OpenXR-Docs/pull/138))
  - Reserve vendor extensions for Microsoft.
    ([internal MR 2478](https://gitlab.khronos.org/openxr/openxr/merge_requests/2478))
  - `XR_EXTX_overlay`: Fix XML markup to correct generated valid usage for the
    event structure.
    ([internal MR 2307](https://gitlab.khronos.org/openxr/openxr/merge_requests/2307))
  - `XR_EXT_performance_settings`: Fix XML markup to correct generated valid usage,
    bump revision.
    ([internal MR 2306](https://gitlab.khronos.org/openxr/openxr/merge_requests/2306))
  - `XR_HTCX_vive_tracker_interaction`: Fix XML markup to correct generated valid
    usage for the event structure.
    ([internal MR 2310](https://gitlab.khronos.org/openxr/openxr/merge_requests/2310))
  - `XR_HTC_facial_tracking`: Update vendor extension to version 2.
    ([internal MR 2416](https://gitlab.khronos.org/openxr/openxr/merge_requests/2416))
  - specification/scripts: Added new functionality in codegen scripts to support
    creating single extension headers. Usage: `python3 scripts/genxr.py -registry
    registry/xr.xml -standaloneExtension XR_FB_color_space standalone_header`
    ([internal MR 2417](https://gitlab.khronos.org/openxr/openxr/merge_requests/2417))
- Specification
  - Clarify the valid swapchain face count values for layer types.
    ([internal MR 2354](https://gitlab.khronos.org/openxr/openxr/merge_requests/2354),
    [internal issue 1750](https://gitlab.khronos.org/openxr/openxr/issues/1750))
  - Clarify error codes returned in vendor extension `XR_META_performance_metrics`.
    ([internal MR 2422](https://gitlab.khronos.org/openxr/openxr/merge_requests/2422))
  - Clarify function `xrEnumerateInstanceExtensionProperties` by removing
    conflicting and redundant language about two-call idiom.
    ([internal MR 2441](https://gitlab.khronos.org/openxr/openxr/merge_requests/2441))
  - Clarify language around swapchain creation format matching usage.
    ([internal MR 2446](https://gitlab.khronos.org/openxr/openxr/merge_requests/2446))
  - Document new `XR_EXT_active_action_set_priority` vendor extension.
    ([internal MR 2288](https://gitlab.khronos.org/openxr/openxr/merge_requests/2288),
    [internal issue 1699](https://gitlab.khronos.org/openxr/openxr/issues/1699))
  - Document new `XR_HTC_passthrough` vendor extension.
    ([internal MR 2349](https://gitlab.khronos.org/openxr/openxr/merge_requests/2349))
  - Document new `XR_HTC_foveation` vendor extension.
    ([internal MR 2377](https://gitlab.khronos.org/openxr/openxr/merge_requests/2377))
  - Document new `XR_META_headset_id` vendor extension.
    ([internal MR 2410](https://gitlab.khronos.org/openxr/openxr/merge_requests/2410))
  - Fix naming of member descriptions for `XrInputSourceLocalizedNameGetInfo`.
    ([internal MR 2419](https://gitlab.khronos.org/openxr/openxr/merge_requests/2419),
    [internal issue 1614](https://gitlab.khronos.org/openxr/openxr/issues/1614),
    [OpenXR-Docs issue 106](https://github.com/KhronosGroup/OpenXR-Docs/issues/106))
  - Loader spec: Update to note that the Android installable broker no longer checks for
    permission. The permission, normally auto-granted, was removed due to causing
    conflicts with installation order.
    ([internal MR 2452](https://gitlab.khronos.org/openxr/openxr/merge_requests/2452),
    [internal issue 1836](https://gitlab.khronos.org/openxr/openxr/issues/1836))
  - Move the documentation of `XrSwapchainUsageFlags`/`XrSwapchainUsageFlagBits` to
    its usage, next to `XrSwapchainCreateFlags`, and mark up normative language.
    ([internal MR 2435](https://gitlab.khronos.org/openxr/openxr/merge_requests/2435))
  - Move flag bit documentation to the `FlagBit` type ref pages, and move the
    typedefs for the `Flags` types into new corresponding flag ref pages. This
    resolves an unneeded inconsistency between core and extensions as well as
    between core and other related specifications like Vulkan.
    ([internal MR 2435](https://gitlab.khronos.org/openxr/openxr/merge_requests/2435))
  - Optimize images included in the specification.
    ([internal MR 2493](https://gitlab.khronos.org/openxr/openxr/merge_requests/2493))
  - `XR_EXT_performance_settings`: Updated generated valid usage through XML
    change, bump revision accordingly.
    ([internal MR 2306](https://gitlab.khronos.org/openxr/openxr/merge_requests/2306))
  - `XR_HTC_facial_tracking`: Update vendor extension to fix an error in the blink
    blend shape ranges, increasing its revision to 2.
    ([internal MR 2416](https://gitlab.khronos.org/openxr/openxr/merge_requests/2416))
  - `XR_KHR_vulkan_enable2` - Add missing member documentation for `type`, `next`,
    and `createFlags` in `XrVulkanInstanceCreateInfoKHR`
    ([internal MR 2435](https://gitlab.khronos.org/openxr/openxr/merge_requests/2435))

## OpenXR Specification 1.0.25 (2022-09-02)

This release contains a few specification clarifications and consistency improvements,
as well as some new vendor extensions. The spec generation toolchain scripts have
been synchronized with Vulkan, which adds some additional detail to the generated
spec document. The loader design document has also been updated to correct an error
and document the loader's API layer functionality now available on Android.

- Registry
  - Add new `XR_ML_ml2_controller_interaction` vendor extension.
    ([internal MR 2344](https://gitlab.khronos.org/openxr/openxr/merge_requests/2344))
  - Clarification: Note that all specialized swapchain image structures are
    "returnedonly", which removes some unneeded generated implicit valid usage.
    ([internal MR 2303](https://gitlab.khronos.org/openxr/openxr/merge_requests/2303))
  - Clarification: Note that all event structs are "returnedonly", which removes
    some unneeded generated implicit valid usage.
    ([internal MR 2305](https://gitlab.khronos.org/openxr/openxr/merge_requests/2305))
  - Register author ID for Oppo.
    ([OpenXR-Docs PR 129](https://github.com/KhronosGroup/OpenXR-Docs/pull/129))
  - Register author ID for Fred Emmott.
    ([OpenXR-Docs PR 131](https://github.com/KhronosGroup/OpenXR-Docs/pull/131))
  - Register author ID for Acer.
    ([OpenXR-Docs PR 132](https://github.com/KhronosGroup/OpenXR-Docs/pull/132))
  - Reserve extension numbers for anticipated cross-vendor and Khronos extensions.
    ([internal MR 2337](https://gitlab.khronos.org/openxr/openxr/merge_requests/2337),
    [internal MR 2338](https://gitlab.khronos.org/openxr/openxr/merge_requests/2338),
    [internal MR 2389](https://gitlab.khronos.org/openxr/openxr/merge_requests/2389))
  - Reserve a vendor extension for Huawei.
    ([internal MR 2356](https://gitlab.khronos.org/openxr/openxr/merge_requests/2356))
  - Reserve vendor extensions for MNDX.
    ([OpenXR-Docs PR 133](https://github.com/KhronosGroup/OpenXR-Docs/pull/133))
  - Update `XR_MSFT_scene_understanding` and
    `XR_MSFT_scene_understanding_serialization` vendor extensions to list error
    codes that may be returned by functions.
    ([internal MR 2316](https://gitlab.khronos.org/openxr/openxr/merge_requests/2316))
  - `XR_FB_color_space`: Mark `XrSystemColorSpacePropertiesFB` as "returned-only"
    for consistency and to correct the implicit valid usage.
    ([internal MR 2304](https://gitlab.khronos.org/openxr/openxr/merge_requests/2304))
  - `XR_FB_display_refresh_rate`: Mark `XrEventDataDisplayRefreshRateChangedFB` as
    "returned only" for consistency.
    ([internal MR 2308](https://gitlab.khronos.org/openxr/openxr/merge_requests/2308))
  - `XR_FB_hand_tracking_mesh`: Fix two-call-idiom markup for
    `XrHandTrackingMeshFB`, affecting implicit valid usage, and increment the
    revision.
    ([internal MR 2311](https://gitlab.khronos.org/openxr/openxr/merge_requests/2311))
  - `XR_FB_passthrough`: Add `XrSystemPassthroughProperties2FB` and
    `XR_PASSTHROUGH_LAYER_DEPTH_BIT_FB`, update spec version to 3.
    ([internal MR 2333](https://gitlab.khronos.org/openxr/openxr/merge_requests/2333))
  - `XR_FB_render_model`: Mark `XrRenderModelCapabilitiesRequestFB` as "returned-
    only" for consistency and to correct the implicit valid usage.
    ([internal MR 2309](https://gitlab.khronos.org/openxr/openxr/merge_requests/2309))
- Specification
  - Clarify that orientation behaves the same as position when tracking loss occurs
    for static spaces.
    ([internal MR 2235](https://gitlab.khronos.org/openxr/openxr/merge_requests/2235))
  - Clarify the interaction of `xrGetInputSourceLocalizedName` and
    `xrEnumerateBoundSourcesForAction`, the paths they operate on, and details of a
    "bound source" for an action.
    ([internal MR 2251](https://gitlab.khronos.org/openxr/openxr/merge_requests/2251),
    [internal issue 1671](https://gitlab.khronos.org/openxr/openxr/issues/1671))
  - Clarify when pose actions with multiple bindings may change source
    ([internal MR 2277](https://gitlab.khronos.org/openxr/openxr/merge_requests/2277))
  - Clarify: Add language to OpenXR patch versions to clarify that it may be used
    to gate runtime implementation changes
    ([internal MR 2290](https://gitlab.khronos.org/openxr/openxr/merge_requests/2290),
    [internal issue 1713](https://gitlab.khronos.org/openxr/openxr/issues/1713))
  - Document new `XR_ML_ml2_controller_interaction` vendor extension with the Magic
    Leap 2 controller interaction profile.
    ([internal MR 2344](https://gitlab.khronos.org/openxr/openxr/merge_requests/2344))
  - Loader design doc: Correct a wrong description of extension implementation
    chosen by the loader when duplicates.
    ([internal MR 2324](https://gitlab.khronos.org/openxr/openxr/merge_requests/2324),
    [internal issue 1731](https://gitlab.khronos.org/openxr/openxr/issues/1731))
  - Loader design doc: Add Android support for API Layers in the application APK.
    ([internal MR 2350](https://gitlab.khronos.org/openxr/openxr/merge_requests/2350))
  - `XR_FB_color_space`: Mark `XrSystemColorSpacePropertiesFB` as "returned-only"
    for consistency and to correct the implicit valid usage, bumping the revision
    number.
    ([internal MR 2304](https://gitlab.khronos.org/openxr/openxr/merge_requests/2304))
  - `XR_FB_hand_tracking_mesh`: Fix `XrHandTrackingMeshFB` two-call-idiom implicit
    valid usage, and increment the revision.
    ([internal MR 2311](https://gitlab.khronos.org/openxr/openxr/merge_requests/2311))
  - `XR_FB_passthrough`: Add `XrSystemPassthroughProperties2FB` and
    `XR_PASSTHROUGH_LAYER_DEPTH_BIT_FB`.
    ([internal MR 2333](https://gitlab.khronos.org/openxr/openxr/merge_requests/2333),
    [internal MR 2393](https://gitlab.khronos.org/openxr/openxr/merge_requests/2393))
  - `XR_FB_render_model`: Mark `XrRenderModelCapabilitiesRequestFB`, as "returned-
    only" for consistency and to correct the implicit valid usage, incrementing the
    revision number.
    ([internal MR 2309](https://gitlab.khronos.org/openxr/openxr/merge_requests/2309))
  - `XR_MSFT_scene_understanding_serialization`: Update vendor extension to
    document when `xrDeserializeSceneMSFT` must return
    `XR_ERROR_COMPUTE_NEW_SCENE_NOT_COMPLETED_MSFT`.
    ([internal MR 2316](https://gitlab.khronos.org/openxr/openxr/merge_requests/2316))
  - scripts: Synchronize scripts with Vulkan, and move all generated files into a
    single target directory.
    ([internal MR 2335](https://gitlab.khronos.org/openxr/openxr/merge_requests/2335),
    [internal issue 1693](https://gitlab.khronos.org/openxr/openxr/issues/1693),
    [internal MR 2393](https://gitlab.khronos.org/openxr/openxr/merge_requests/2393),
    [internal MR 2400](https://gitlab.khronos.org/openxr/openxr/merge_requests/2400))

## OpenXR Specification 1.0.24 (2022-06-23)

- Registry
  - Add new `XR_EXT_palm_pose` multi-vendor extension.
    ([internal MR 2112](https://gitlab.khronos.org/openxr/openxr/merge_requests/2112))
  - Add new `XR_FB_scene` vendor extension.
    ([internal MR 2237](https://gitlab.khronos.org/openxr/openxr/merge_requests/2237))
  - Fix structure definition in `XR_FB_spatial_entity_container`.
    ([internal MR 2278](https://gitlab.khronos.org/openxr/openxr/merge_requests/2278))
  - scripts: Teach xr_conventions that 2D, 3D, etc. are words for the purposes of
    structure type enum generation.
    ([internal MR 2237](https://gitlab.khronos.org/openxr/openxr/merge_requests/2237))
- Specification
  - Clarify inconsistent specified semantics for array getters/two-call idiom,
    resolving ambiguity in favor of the fundamentals section on buffer size
    parameters.
    ([OpenXR-Docs PR 104](https://github.com/KhronosGroup/OpenXR-Docs/pull/104),
    [OpenXR-Docs issue 94](https://github.com/KhronosGroup/OpenXR-Docs/issues/94),
    [internal issue 1599](https://gitlab.khronos.org/openxr/openxr/issues/1599),
    [internal issue 1612](https://gitlab.khronos.org/openxr/openxr/issues/1612))
  - Document new `XR_EXT_palm_pose` multi-vendor extension.
    ([internal MR 2112](https://gitlab.khronos.org/openxr/openxr/merge_requests/2112))
  - Document new `XR_FB_scene` vendor extension.
    ([internal MR 2237](https://gitlab.khronos.org/openxr/openxr/merge_requests/2237))
  - Fix documentation for `xrApplyHapticFeedback` to specify the correct action
    type.
    ([internal MR 2268](https://gitlab.khronos.org/openxr/openxr/merge_requests/2268))
  - Fix structure definition in `XR_FB_spatial_entity_container`.
    ([internal MR 2278](https://gitlab.khronos.org/openxr/openxr/merge_requests/2278))

## OpenXR Specification 1.0.23 (2022-05-27)

This release includes a large number of new vendor and multi-vendor extensions,
as well as some updates to existing extensions. It also adds some details about
app manifest requirements on Android.

- Registry
  - Add new `XR_ULTRALEAP_hand_tracking_forearm` vendor extension.
    ([internal MR 2154](https://gitlab.khronos.org/openxr/openxr/merge_requests/2154))
  - Add new `XR_EXT_dpad_binding` multi-vendor extension.
    ([internal MR 2159](https://gitlab.khronos.org/openxr/openxr/merge_requests/2159))
  - Add "externally synchronized" markup for `xrBeginFrame` and `xrEndFrame` so
    they get the matching box and their session parameters are included in the list
    of externally-synchronized parameters in the "Threading" section.
    ([internal MR 2179](https://gitlab.khronos.org/openxr/openxr/merge_requests/2179),
    [OpenXR-Docs issue 23](https://github.com/KhronosGroup/OpenXR-Docs/issues/23),
    [internal issue 1216](https://gitlab.khronos.org/openxr/openxr/issues/1216))
  - Add new `XR_FB_spatial_entity` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Add new `XR_FB_spatial_entity_storage` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Add new `XR_FB_spatial_entity_query` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Add new `XR_FB_composition_layer_settings` vendor extension.
    ([internal MR 2221](https://gitlab.khronos.org/openxr/openxr/merge_requests/2221))
  - Add new `XR_FB_spatial_entity_container` vendor extension.
    ([internal MR 2236](https://gitlab.khronos.org/openxr/openxr/merge_requests/2236))
  - Add new `XR_HTC_vive_wrist_tracker_interaction` vendor extension.
    ([internal MR 2252](https://gitlab.khronos.org/openxr/openxr/merge_requests/2252))
  - Add XR_HTC_hand_interaction extension.
    ([internal MR 2254](https://gitlab.khronos.org/openxr/openxr/merge_requests/2254))
  - Add new `XR_VARJO_view_offset` vendor extension.
    ([internal MR 2255](https://gitlab.khronos.org/openxr/openxr/merge_requests/2255))
  - Add new `XR_META_performance_metrics` vendor extension.
    ([internal MR 2256](https://gitlab.khronos.org/openxr/openxr/merge_requests/2256))
  - Add new `XR_META_vulkan_swapchain_create_info` vendor extension.
    ([internal MR 2257](https://gitlab.khronos.org/openxr/openxr/merge_requests/2257))
  - Change the XML type of `XR_MIN_COMPOSITION_LAYERS_SUPPORTED` so it outputs an
    includable snippet for the spec text.
    ([internal MR 2201](https://gitlab.khronos.org/openxr/openxr/merge_requests/2201),
    [internal issue 1652](https://gitlab.khronos.org/openxr/openxr/issues/1652),
    [OpenXR-Docs issue 117](https://github.com/KhronosGroup/OpenXR-Docs/issues/117))
  - Fix registry consistency script and codegen scripts to allow extension of KHR
    and EXT enumerations with vendor-specific members.
    ([internal MR 2213](https://gitlab.khronos.org/openxr/openxr/merge_requests/2213),
    [internal MR 2243](https://gitlab.khronos.org/openxr/openxr/merge_requests/2243))
  - Fix warning print statement arguments in header generation/validation script.
    ([internal MR 2244](https://gitlab.khronos.org/openxr/openxr/merge_requests/2244))
  - Reserve the extension number for multi-vendor hand interaction profile
    extension.
    ([internal MR 2206](https://gitlab.khronos.org/openxr/openxr/merge_requests/2206))
  - Reserve vendor extensions 304-317 for Qualcomm
    ([internal MR 2258](https://gitlab.khronos.org/openxr/openxr/merge_requests/2258))
  - Reserve vendor extensions 318-370 for HTC.
    ([internal MR 2266](https://gitlab.khronos.org/openxr/openxr/merge_requests/2266))
  - `KHR_composition_layer_depth`: Update spec version to 6 for updated spec text.
    ([internal MR 2207](https://gitlab.khronos.org/openxr/openxr/merge_requests/2207),
    [internal issue 1651](https://gitlab.khronos.org/openxr/openxr/issues/1651))
  - `XR_EXT_eye_gaze_interaction`: Update the spec version for spec text change.
    ([internal MR 2227](https://gitlab.khronos.org/openxr/openxr/merge_requests/2227))
  - `XR_EXT_uuid`: Add enum tags to `XR_UUID_SIZE_EXT` to ensure it is defined
    before `XrUuidEXT` in generated header
    ([internal MR 2234](https://gitlab.khronos.org/openxr/openxr/merge_requests/2234),
    [internal issue 1673](https://gitlab.khronos.org/openxr/openxr/issues/1673))
  - `XR_FB_hand_aim_tracking`, `XR_FB_hand_tracking_capsule`,
    `XR_FB_hand_tracking_mesh`: Fix documentation to specify correct `next` chain
    usage.
    ([internal MR 2229](https://gitlab.khronos.org/openxr/openxr/merge_requests/2229))
  - `XR_FB_hand_tracking_capsules`: Update `XrHandCapsuleFB` and
    `XrHandTrackingCapsulesStateFB` to use
    `XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB` and
    `XR_HAND_TRACKING_CAPSULE_COUNT_FB` enums when defining arrays so they match
    the usual practice for vendor extensions
    ([internal MR 2216](https://gitlab.khronos.org/openxr/openxr/merge_requests/2216))
  - `XR_FB_passthrough_keyboard_hands`: Add
    `XR_PASSTHROUGH_LAYER_PURPOSE_TRACKED_KEYBOARD_MASKED_HANDS_FB`, update spec
    version to 2.
    ([internal MR 2270](https://gitlab.khronos.org/openxr/openxr/merge_requests/2270))
  - `XR_FB_passthrough`: add `XrPassthroughBrightnessContrastSaturationFB`, update
    spec version to 2
    ([internal MR 2222](https://gitlab.khronos.org/openxr/openxr/merge_requests/2222))
  - `XR_FB_render_model`: Add capability support levels, bump spec version to 2.
    ([internal MR 2264](https://gitlab.khronos.org/openxr/openxr/merge_requests/2264))
  - `XR_FB_space_warp`: Add
    `XR_COMPOSITION_LAYER_SPACE_WARP_INFO_FRAME_SKIP_BIT_FB` into
    `XrCompositionLayerSpaceWarpInfoFlagBitsFB`, update spec version to 2.
    ([internal MR 2193](https://gitlab.khronos.org/openxr/openxr/merge_requests/2193))
  - `XR_HTC_vive_focus3_controller_interaction`: Support component path
    "/input/squeeze/value", update spec version to 2.
    ([internal MR 2253](https://gitlab.khronos.org/openxr/openxr/merge_requests/2253))
  - `XR_KHR_D3D11_enable` and `XR_KHR_D3D12_enable`: Update to describe error
    conditions for `XR_ERROR_GRAPHICS_DEVICE_INVALID`.
    ([internal MR 2176](https://gitlab.khronos.org/openxr/openxr/merge_requests/2176),
    [internal issue 1617](https://gitlab.khronos.org/openxr/openxr/issues/1617))
  - `XR_MSFT_spatial_graph_bridge`: Update to revision 2.
    ([internal MR 2182](https://gitlab.khronos.org/openxr/openxr/merge_requests/2182))
- Specification
  - Add spec language for `XR_MIN_COMPOSITION_LAYERS_SUPPORTED`.
    ([internal MR 2201](https://gitlab.khronos.org/openxr/openxr/merge_requests/2201),
    [internal issue 1652](https://gitlab.khronos.org/openxr/openxr/issues/1652),
    [OpenXR-Docs issue 117](https://github.com/KhronosGroup/OpenXR-Docs/issues/117))
  - Add a few level 4 headers so the sub chapters in extensions can be referenced
    with anchors.
    ([internal MR 2205](https://gitlab.khronos.org/openxr/openxr/merge_requests/2205))
  - Add text in the appendix describing adding
    `org.khronos.openxr.intent.category.IMMERSIVE_HMD` category to intent-filter
    for `AndroidManifest.xml`, to indicate an immersive application.
    ([internal MR 2219](https://gitlab.khronos.org/openxr/openxr/merge_requests/2219))
  - Change instances of Samsung Electronics authorship references to only have
    first and last name of author, and to spell out Samsung Electronics instead of
    just Samsung.
    ([internal MR 2211](https://gitlab.khronos.org/openxr/openxr/merge_requests/2211))
  - Clarify that `XR_SPACE_VELOCITY_LINEAR_VALID_BIT` and
    `XR_SPACE_VELOCITY_ANGULAR_VALID_BIT` work just like
    `XR_SPACE_LOCATION_POSITION_VALID_BIT` and
    `XR_SPACE_LOCATION_ORIENTATION_VALID_BIT`: Don't read the corresponding field
    if it's not set.
    ([internal MR 2185](https://gitlab.khronos.org/openxr/openxr/merge_requests/2185),
    [OpenXR-Docs issue 35](https://github.com/KhronosGroup/OpenXR-Docs/issues/35),
    [internal issue 1264](https://gitlab.khronos.org/openxr/openxr/issues/1264))
  - Document new `XR_HTC_hand_interaction` extension.
    ([internal MR 2254](https://gitlab.khronos.org/openxr/openxr/merge_requests/2254))
  - Document new `XR_ULTRALEAP_hand_tracking_forearm` vendor extension.
    ([internal MR 2154](https://gitlab.khronos.org/openxr/openxr/merge_requests/2154))
  - Document new `XR_EXT_dpad_binding` multi-vendor extension.
    ([internal MR 2159](https://gitlab.khronos.org/openxr/openxr/merge_requests/2159))
  - Document new `XR_FB_spatial_entity` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Document new `XR_FB_spatial_entity_storage` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Document new `XR_FB_spatial_entity_query` vendor extension.
    ([internal MR 2194](https://gitlab.khronos.org/openxr/openxr/merge_requests/2194))
  - Document out of range `XrSwapchainSubImage` `imageArrayIndex`
    ([internal MR 2220](https://gitlab.khronos.org/openxr/openxr/merge_requests/2220))
  - Document new `XR_FB_composition_layer_settings` vendor extension.
    ([internal MR 2221](https://gitlab.khronos.org/openxr/openxr/merge_requests/2221))
  - Document new `XR_FB_spatial_entity_container` vendor extension.
    ([internal MR 2236](https://gitlab.khronos.org/openxr/openxr/merge_requests/2236))
  - Document new `XR_HTC_vive_wrist_tracker_interaction` vendor extension.
    ([internal MR 2252](https://gitlab.khronos.org/openxr/openxr/merge_requests/2252))
  - Document new `XR_VARJO_view_offset` vendor extension.
    ([internal MR 2255](https://gitlab.khronos.org/openxr/openxr/merge_requests/2255))
  - Document new `XR_META_performance_metrics` vendor extension.
    ([internal MR 2256](https://gitlab.khronos.org/openxr/openxr/merge_requests/2256))
  - Document new `XR_META_vulkan_swapchain_create_info` vendor extension.
    ([internal MR 2257](https://gitlab.khronos.org/openxr/openxr/merge_requests/2257))
  - `XR_EXT_debug_utils`: Update sample to remove invalid usage of `xrEndSession`.
    ([internal MR 2242](https://gitlab.khronos.org/openxr/openxr/merge_requests/2242))
  - `XR_EXT_eye_gaze_interaction`: Remove error-prone `XrEyeGazeSampleTimeEXT`
    validation requirement, and update the spec version.
    ([internal MR 2227](https://gitlab.khronos.org/openxr/openxr/merge_requests/2227))
  - `XR_FB_hand_aim_tracking`, `XR_FB_hand_tracking_capsule`,
    `XR_FB_hand_tracking_mesh`: Fix documentation to specify correct `next` chain
    usage.
    ([internal MR 2229](https://gitlab.khronos.org/openxr/openxr/merge_requests/2229))
  - `XR_FB_hand_tracking_capsules`: Update `XrHandCapsuleFB` and
    `XrHandTrackingCapsulesStateFB` to use correct `_FB` enums when defining arrays
    so they match the usual practice for vendor extensions.
    ([internal MR 2216](https://gitlab.khronos.org/openxr/openxr/merge_requests/2216))
  - `XR_FB_passthrough_keyboard_hands`: Introduce
    `XR_PASSTHROUGH_LAYER_PURPOSE_TRACKED_KEYBOARD_MASKED_HANDS_FB`
    ([internal MR 2270](https://gitlab.khronos.org/openxr/openxr/merge_requests/2270))
  - `XR_FB_passthrough`: Update to add a state diagram.
    ([internal MR 2135](https://gitlab.khronos.org/openxr/openxr/merge_requests/2135))
  - `XR_FB_passthrough`: Introduce `XrPassthroughBrightnessContrastSaturationFB`,
    and revise the documentation of `XrPassthroughStyleFB` and its descendants.
    ([internal MR 2222](https://gitlab.khronos.org/openxr/openxr/merge_requests/2222),
    [internal issue 1694](https://gitlab.khronos.org/openxr/openxr/issues/1694),
    [internal MR 2245](https://gitlab.khronos.org/openxr/openxr/merge_requests/2245))
  - `XR_FB_render_model`: add capability support levels, update spec version to 2
    ([internal MR 2264](https://gitlab.khronos.org/openxr/openxr/merge_requests/2264))
  - `XR_FB_space_warp`: Add
    `XR_COMPOSITION_LAYER_SPACE_WARP_INFO_FRAME_SKIP_BIT_FB` into
    `XrCompositionLayerSpaceWarpInfoFlagBitsFB`, update spec version to 2
    ([internal MR 2193](https://gitlab.khronos.org/openxr/openxr/merge_requests/2193))
  - `XR_HTC_vive_focus3_controller_interaction`: Support component path
    "/input/squeeze/value"
    ([internal MR 2253](https://gitlab.khronos.org/openxr/openxr/merge_requests/2253))
  - `XR_KHR_D3D11_enable` and `XR_KHR_D3D12_enable`: Update to describe error
    conditions for `XR_ERROR_GRAPHICS_DEVICE_INVALID`.
    ([internal MR 2176](https://gitlab.khronos.org/openxr/openxr/merge_requests/2176),
    [internal issue 1617](https://gitlab.khronos.org/openxr/openxr/issues/1617))
  - `XR_KHR_composition_layer_depth`: include the transformation details from view
    space to window space depth, update spec version to 6.
    ([internal MR 2207](https://gitlab.khronos.org/openxr/openxr/merge_requests/2207),
    [internal issue 1651](https://gitlab.khronos.org/openxr/openxr/issues/1651))
  - `XR_KHR_convert_timespec_time`: Fix parameter name mismatch between spec text
    and XML registry.
    ([OpenXR-Docs PR 113](https://github.com/KhronosGroup/OpenXR-Docs/pull/113))
  - `XR_KHR_vulkan_enable2`: Fix typo in parameter description of
    `xrCreateVulkanInstanceKHR`.
    ([OpenXR-Docs PR 121](https://github.com/KhronosGroup/OpenXR-Docs/pull/121))
  - `XR_MSFT_spatial_graph_bridge`: Update docs for revision 2.
    ([internal MR 2182](https://gitlab.khronos.org/openxr/openxr/merge_requests/2182))

## OpenXR Specification 1.0.22 (2022-01-12)

This release features a number of new vendor and multi-vendor extensions, plus a
few extension corrections. There are a few small core specification fixes as
well, including a clarification that going forward, `xrBeginFrame` is not a
blocking function (which was implied but not explicitly stated).

- Registry
  - Add new `XR_FB_render_model` vendor extension.
    ([internal MR 2117](https://gitlab.khronos.org/openxr/openxr/merge_requests/2117),
    [internal MR 2169](https://gitlab.khronos.org/openxr/openxr/merge_requests/2169))
  - Add new `XR_HTC_facial_expression` vendor extension.
    ([internal MR 2120](https://gitlab.khronos.org/openxr/openxr/merge_requests/2120))
  - Add new `XR_FB_keyboard_tracking` vendor extension.
    ([internal MR 2128](https://gitlab.khronos.org/openxr/openxr/merge_requests/2128))
  - Add new `XR_EXT_uuid` multi-vendor extension.
    ([internal MR 2152](https://gitlab.khronos.org/openxr/openxr/merge_requests/2152))
  - Add new `XR_FB_passthrough_keyboard_hands` vendor extension.
    ([internal MR 2162](https://gitlab.khronos.org/openxr/openxr/merge_requests/2162))
  - Add new `XR_HTC_vive_focus3_controller_interaction` vendor extension.
    ([internal MR 2178](https://gitlab.khronos.org/openxr/openxr/merge_requests/2178))
  - Add new `XR_ALMALENCE_digital_lens_control` vendor extension.
    ([OpenXR-Docs PR 104](https://github.com/KhronosGroup/OpenXR-Docs/pull/104),
    [internal issue 1615](https://gitlab.khronos.org/openxr/openxr/issues/1615))
  - Correct winding order for `XR_MSFT_hand_tracking_mesh` extension to clockwise
    to match runtime behavior.
    ([internal MR 2151](https://gitlab.khronos.org/openxr/openxr/merge_requests/2151))
  - Fix typos/naming convention errors in `XR_FB_hand_tracking_capsules`: rename
    `XR_FB_HAND_TRACKING_CAPSULE_POINT_COUNT` to
    `XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB` and
    `XR_FB_HAND_TRACKING_CAPSULE_COUNT` to `XR_HAND_TRACKING_CAPSULE_COUNT_FB`,
    providing the old names as compatibility aliases.
    ([internal MR 1547](https://gitlab.khronos.org/openxr/openxr/merge_requests/1547),
    [internal issue 1519](https://gitlab.khronos.org/openxr/openxr/issues/1519))
  - Reserve vendor extensions 208 - 299 for Facebook.
    ([internal MR 2158](https://gitlab.khronos.org/openxr/openxr/merge_requests/2158))
  - Reserve extension numbers for anticipated multi-vendor extensions.
    ([internal MR 2173](https://gitlab.khronos.org/openxr/openxr/merge_requests/2173))
- Specification
  - Clarify that `xrBeginFrame` is not a blocking function for frame
    synchronization purposes.
    ([internal MR 2145](https://gitlab.khronos.org/openxr/openxr/merge_requests/2145))
  - Correct winding order for `XR_MSFT_hand_tracking_mesh` extension to clockwise
    to match runtime behavior.
    ([internal MR 2151](https://gitlab.khronos.org/openxr/openxr/merge_requests/2151))
  - Document new `XR_FB_render_model` vendor extension.
    ([internal MR 2117](https://gitlab.khronos.org/openxr/openxr/merge_requests/2117),
    [internal MR 2169](https://gitlab.khronos.org/openxr/openxr/merge_requests/2169))
  - Document new `XR_HTC_facial_tracker` vendor extension.
    ([internal MR 2120](https://gitlab.khronos.org/openxr/openxr/merge_requests/2120))
  - Document new `XR_FB_keyboard_tracking` vendor extension.
    ([internal MR 2128](https://gitlab.khronos.org/openxr/openxr/merge_requests/2128))
  - Document new `XR_EXT_uuid` multi-vendor extension.
    ([internal MR 2152](https://gitlab.khronos.org/openxr/openxr/merge_requests/2152))
  - Document new `XR_FB_passthrough_keyboard_hands` vendor extension.
    ([internal MR 2162](https://gitlab.khronos.org/openxr/openxr/merge_requests/2162))
  - Document new `XR_HTC_vive_focus3_controller_interaction` vendor extension.
    ([internal MR 2178](https://gitlab.khronos.org/openxr/openxr/merge_requests/2178))
  - Document new `XR_ALMALENCE_digital_lens_control` vendor extension.
    ([OpenXR-Docs PR 104](https://github.com/KhronosGroup/OpenXR-Docs/pull/104),
    [internal issue 1615](https://gitlab.khronos.org/openxr/openxr/issues/1615))
  - Fix typos/naming convention errors in `XR_FB_hand_tracking_capsules`: rename
    `XR_FB_HAND_TRACKING_CAPSULE_POINT_COUNT` to
    `XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB` and
    `XR_FB_HAND_TRACKING_CAPSULE_COUNT` to `XR_HAND_TRACKING_CAPSULE_COUNT_FB`,
    providing the old names as compatibility aliases.
    ([internal MR 1547](https://gitlab.khronos.org/openxr/openxr/merge_requests/1547),
    [internal issue 1519](https://gitlab.khronos.org/openxr/openxr/issues/1519))
  - Semantic paths: Note that "back" (as a button) is an acceptable standard
    identifier: the core specification already includes interaction profiles using
    it, but it was inadvertently omitted from the standard identifier list.
    ([internal MR 2166](https://gitlab.khronos.org/openxr/openxr/merge_requests/2166))
  - Update xml consistency script to verify correct application of vendor naming
    rules.
    ([internal MR 1547](https://gitlab.khronos.org/openxr/openxr/merge_requests/1547),
    [internal issue 1618](https://gitlab.khronos.org/openxr/openxr/issues/1618))
  - Update docs for `XR_TYPE_EVENT_DATA_INSTANCE_LOSS_PENDING` to specify that
    `xrCreateInstance` returns `XR_ERROR_RUNTIME_UNAVAILABLE` as long as it is
    unable to create the instance.
    ([internal MR 2149](https://gitlab.khronos.org/openxr/openxr/merge_requests/2149))
  - Update docs for `XR_FB_color_space` to correct preferred color space for Oculus
    HMDs.
    ([internal MR 2155](https://gitlab.khronos.org/openxr/openxr/merge_requests/2155))

## OpenXR Specification 1.0.21 (2022-01-10)

This release was withdrawn due to a typo noticed after initial publication.
All changes are now listed under 1.0.22.

## OpenXR Specification 1.0.20 (2021-10-04)

This release includes a number of new vendor extensions and a few minor clarifications.

- Registry
  - Add new `XR_HTCX_vive_tracker_interaction` provisional vendor extension.
    ([internal MR 1983](https://gitlab.khronos.org/openxr/openxr/merge_requests/1983))
  - Add new `XR_VARJO_marker_tracking` vendor extension.
    ([internal MR 2129](https://gitlab.khronos.org/openxr/openxr/merge_requests/2129))
  - Add new `XR_FB_triangle_mesh` vendor extension.
    ([internal MR 2130](https://gitlab.khronos.org/openxr/openxr/merge_requests/2130))
  - Add new `XR_FB_passthrough` vendor extension.
    ([internal MR 2130](https://gitlab.khronos.org/openxr/openxr/merge_requests/2130))
  - Reserve vendor extensions for Facebook.
    ([internal MR 2131](https://gitlab.khronos.org/openxr/openxr/merge_requests/2131))
  - Reserve a vendor extension for Almalence.
    ([OpenXR-Docs PR 99](https://github.com/KhronosGroup/OpenXR-Docs/pull/99))
  - XR_FB_color_space: Fix XML markup to indicate that
    `XrSystemColorSpacePropertiesFB` is chained to `XrSystemProperties`.
    ([internal MR 2143](https://gitlab.khronos.org/openxr/openxr/merge_requests/2143))
- Specification
  - Clarify that swapchain image wait must not timeout before releasing.
    ([internal MR 2134](https://gitlab.khronos.org/openxr/openxr/merge_requests/2134),
    [OpenXR-Docs issue 101](https://github.com/KhronosGroup/OpenXR-Docs/issues/101),
    [internal issue 1603](https://gitlab.khronos.org/openxr/openxr/issues/1603))
  - D3D11 and D3D12 extensions: Specify handling of swapchain usage flags.
    ([internal MR 2133](https://gitlab.khronos.org/openxr/openxr/merge_requests/2133),
    [internal issue 1500](https://gitlab.khronos.org/openxr/openxr/issues/1500))
  - OpenGL and OpenGL ES extensions: Specify handling of swapchain usage flags.
    ([internal MR 2127](https://gitlab.khronos.org/openxr/openxr/merge_requests/2127),
    [internal issue 1500](https://gitlab.khronos.org/openxr/openxr/issues/1500))
  - Document new `XR_HTCX_vive_tracker_interaction` provisional vendor extension.
    ([internal MR 1983](https://gitlab.khronos.org/openxr/openxr/merge_requests/1983))
  - Document new `XR_VARJO_marker_tracking` vendor extension.
    ([internal MR 2129](https://gitlab.khronos.org/openxr/openxr/merge_requests/2129))
  - Document new `XR_FB_triangle_mesh` vendor extension.
    ([internal MR 2130](https://gitlab.khronos.org/openxr/openxr/merge_requests/2130))
  - Document new `XR_FB_passthrough` vendor extension.
    ([internal MR 2130](https://gitlab.khronos.org/openxr/openxr/merge_requests/2130))
  - Fix generated links from OpenXR ref pages to Vulkan ref pages.
    ([internal MR 2126](https://gitlab.khronos.org/openxr/openxr/merge_requests/2126))
  - Loader specification: Describe a cross-vendor loader for use on Android.
    ([internal MR 1949](https://gitlab.khronos.org/openxr/openxr/merge_requests/1949),
    [internal issue 1425](https://gitlab.khronos.org/openxr/openxr/issues/1425))
  - Scripts: Fix reflow script error message and make sure it creates the necessary
    output directory.
    ([OpenXR-Docs PR 97](https://github.com/KhronosGroup/OpenXR-Docs/pull/97))

## OpenXR Specification 1.0.19 (2021-08-24)

This release features a number of new or updated vendor extensions, as well as
some minor spec clarifications.

- Registry
  - Add `XR_SESSION_NOT_FOCUSED` as a possible success return code to
    `xrApplyHapticFeedback` and `xrStopHapticFeedback`.
    ([internal MR 2106](https://gitlab.khronos.org/openxr/openxr/merge_requests/2106),
    [internal issue 1270](https://gitlab.khronos.org/openxr/openxr/issues/1270))
  - Add new `XR_FB_hand_tracking_mesh` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Add new `XR_FB_hand_tracking_capsules` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Add new `XR_FB_hand_tracking_aim` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Add version 1 of new `XR_FB_space_warp` vendor extension.
    ([internal MR 2115](https://gitlab.khronos.org/openxr/openxr/merge_requests/2115))
  - Register new Author ID for Almalence.
    ([OpenXR-Docs PR 92](https://github.com/KhronosGroup/OpenXR-Docs/pull/92),
    [OpenXR-Docs PR 93](https://github.com/KhronosGroup/OpenXR-Docs/pull/93))
  - Update to version 2 of `XR_VALVE_analog_threshold`.
    ([internal MR 2113](https://gitlab.khronos.org/openxr/openxr/merge_requests/2113))
- Specification
  - Clarifies the `imageRect` in `XrSwapchainSubImage` uses a graphics API-specific
    coordinate origin.
    ([internal MR 2104](https://gitlab.khronos.org/openxr/openxr/merge_requests/2104),
    [OpenXR-Docs issue 86](https://github.com/KhronosGroup/OpenXR-Docs/issues/86),
    [internal issue 1587](https://gitlab.khronos.org/openxr/openxr/issues/1587))
  - Clarify text that haptics are suppressed when the session does not have or
    loses focus.
    ([internal MR 2106](https://gitlab.khronos.org/openxr/openxr/merge_requests/2106),
    [internal issue 1270](https://gitlab.khronos.org/openxr/openxr/issues/1270))
  - Document new `XR_FB_hand_tracking_mesh` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Document new `XR_FB_hand_tracking_capsules` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Document new `XR_FB_hand_tracking_aim` vendor extension.
    ([internal MR 2089](https://gitlab.khronos.org/openxr/openxr/merge_requests/2089))
  - Document updated version 2 of `XR_VALVE_analog_threshold`. This adapts the
    extension for usage with `XR_KHR_binding_modification`, deprecating the
    previous direct binding modification technique.
    ([internal MR 2113](https://gitlab.khronos.org/openxr/openxr/merge_requests/2113))
  - Document version 1 of new `XR_FB_space_warp` vendor extension.
    ([internal MR 2115](https://gitlab.khronos.org/openxr/openxr/merge_requests/2115))
  - scripts: Some typing annotations and type-related cleanup found by using type-
    aware Python editors.
    ([internal MR 2100](https://gitlab.khronos.org/openxr/openxr/merge_requests/2100))

## OpenXR Specification 1.0.18 (2021-07-30)

The main changes in this release include clarifications to the Session chapter
of the specification, plus the addition of diagrams to the text describing grip
and aim pose. The release also adds one new ratified KHR extension (promoted
from a vendor extension), and a number of new vendor extensions.

- Registry
  - Add ratified `XR_KHR_swapchain_usage_input_attachment_bit` Khronos extension.
    (Promotion of `XR_MND_swapchain_usage_input_attachment_bit`, which is now
    deprecated.)
    ([internal MR 2045](https://gitlab.khronos.org/openxr/openxr/merge_requests/2045))
  - Add new `XR_FB_foveation`, `XR_FB_foveation_configuration`, and
    `XR_FB_foveation_vulkan` vendor extensions.
    ([internal MR 2050](https://gitlab.khronos.org/openxr/openxr/merge_requests/2050))
  - Add additional extension dependencies to `XR_FB_swapchain_update_state`.
    ([internal MR 2072](https://gitlab.khronos.org/openxr/openxr/merge_requests/2072),
    [internal issue 1572](https://gitlab.khronos.org/openxr/openxr/issues/1572))
  - Add new `XR_FB_composition_layer_secure_content` vendor extension.
    ([internal MR 2075](https://gitlab.khronos.org/openxr/openxr/merge_requests/2075))
  - Add new `XR_FB_composition_layer_alpha_blend` vendor extension.
    ([internal MR 2078](https://gitlab.khronos.org/openxr/openxr/merge_requests/2078))
  - Add new `XR_FB_composition_layer_image_layout` vendor extension.
    ([internal MR 2090](https://gitlab.khronos.org/openxr/openxr/merge_requests/2090))
  - Add new `XR_MSFT_spatial_anchor_persistence` vendor extension.
    ([internal MR 2093](https://gitlab.khronos.org/openxr/openxr/merge_requests/2093))
  - Add some simple [Schematron](https://schematron.com) rules and a script to
    check the XML registry against them.
    ([internal MR 2103](https://gitlab.khronos.org/openxr/openxr/merge_requests/2103))
  - Register author ID and reserve vendor extensions for Unity.
    ([internal MR 2105](https://gitlab.khronos.org/openxr/openxr/merge_requests/2105))
  - Reserve extension ID range 187-196 for LIV Inc.
    ([internal MR 2102](https://gitlab.khronos.org/openxr/openxr/merge_requests/2102))
- Specification
  - Rewrite the introduction of Session chapter to explain a typical session
    lifecycle.
    ([internal MR 2087](https://gitlab.khronos.org/openxr/openxr/merge_requests/2087))
  - Add grip diagram to specification
    ([internal MR 2092](https://gitlab.khronos.org/openxr/openxr/merge_requests/2092),
    [internal issue 1545](https://gitlab.khronos.org/openxr/openxr/issues/1545),
    [OpenXR-Docs PR 45](https://github.com/KhronosGroup/OpenXR-Docs/pull/45),
    [OpenXR-Docs issue 44](https://github.com/KhronosGroup/OpenXR-Docs/issues/44))
  - Describe how runtimes may register themselves at installation time for manual
    selection.
    ([internal MR 2081](https://gitlab.khronos.org/openxr/openxr/merge_requests/2081),
    [internal MR 2109](https://gitlab.khronos.org/openxr/openxr/merge_requests/2109),
    [internal issue 1574](https://gitlab.khronos.org/openxr/openxr/issues/1574))
  - Document new ratified `XR_KHR_swapchain_usage_input_attachment_bit` Khronos
    extension. (Promotion of `XR_MND_swapchain_usage_input_attachment_bit`, which
    is now deprecated.)
    ([internal MR 2045](https://gitlab.khronos.org/openxr/openxr/merge_requests/2045))
  - Document new `XR_FB_foveation`, `XR_FB_foveation_configuration`, and
    `XR_FB_foveation_vulkan` vendor extensions.
    ([internal MR 2050](https://gitlab.khronos.org/openxr/openxr/merge_requests/2050))
  - Document new `XR_FB_composition_layer_secure_content` vendor extension.
    ([internal MR 2075](https://gitlab.khronos.org/openxr/openxr/merge_requests/2075))
  - Document new `XR_FB_composition_layer_alpha_blend` vendor extension.
    ([internal MR 2078](https://gitlab.khronos.org/openxr/openxr/merge_requests/2078))
  - Document new `XR_FB_composition_layer_image_layout` vendor extension.
    ([internal MR 2090](https://gitlab.khronos.org/openxr/openxr/merge_requests/2090))
  - Document new `XR_MSFT_spatial_anchor_persistence` vendor extension.
    ([internal MR 2093](https://gitlab.khronos.org/openxr/openxr/merge_requests/2093))
  - Minor cleanups to the loader documentation/specification.
    ([internal MR 2108](https://gitlab.khronos.org/openxr/openxr/merge_requests/2108))
  - Revise Varjo vendor extensions so that the sample code is buildable (and build
    during CI testing).
    ([internal MR 2020](https://gitlab.khronos.org/openxr/openxr/merge_requests/2020))
  - Scripts: Verify `externsync` attributes of destroy calls.
    ([internal MR 2065](https://gitlab.khronos.org/openxr/openxr/merge_requests/2065))
  - Update `XR_MSFT_spatial_anchor` to note the external sync requirements of the
    destroy call.
    ([internal MR 2065](https://gitlab.khronos.org/openxr/openxr/merge_requests/2065))
  - Add missing copyright/license notice for FB extension sources
    ([internal MR 2076](https://gitlab.khronos.org/openxr/openxr/merge_requests/2076),
    [internal issue 1562](https://gitlab.khronos.org/openxr/openxr/issues/1562))
  - Add missing item to new enum constants of spatial anchors extension
    ([internal MR 2088](https://gitlab.khronos.org/openxr/openxr/merge_requests/2088))
  - scripts: Handle aliased bitmask values properly in header files.
    ([internal MR 2045](https://gitlab.khronos.org/openxr/openxr/merge_requests/2045))

## OpenXR Specification 1.0.17 (2021-06-08)

This release includes a variety of new vendor extensions, as well as some
clean-up changes to the API registry and specification, mostly related to
valid/available return codes. An update to an earlier vendor extension is also
included.

- Registry
  - Add `XR_MSFT_scene_understanding` vendor extension.
    ([internal MR 2032](https://gitlab.khronos.org/openxr/openxr/merge_requests/2032))
  - Add `XR_MSFT_scene_understanding_serialization` vendor extension.
    ([internal MR 2032](https://gitlab.khronos.org/openxr/openxr/merge_requests/2032))
  - Add `XR_MSFT_composition_layer_reprojection` vendor extension.
    ([internal MR 2033](https://gitlab.khronos.org/openxr/openxr/merge_requests/2033))
  - Add `XR_OCULUS_audio_device_guid` vendor extension.
    ([internal MR 2053](https://gitlab.khronos.org/openxr/openxr/merge_requests/2053))
  - Add version 3 of `XR_FB_swapchain_update_state` vendor extension, which splits
    platform and graphics API specific structs into separate extensions.
    ([internal MR 2059](https://gitlab.khronos.org/openxr/openxr/merge_requests/2059))
  - Apply formatting to registry XML by selectively committing changes made by
    <https://github.com/rpavlik/PrettyRegistryXml>.
    ([internal MR 2070](https://gitlab.khronos.org/openxr/openxr/merge_requests/2070),
    [OpenXR-SDK-Source/#256](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/256))
  - Enforce that all `xrCreate` functions must be able to return
    `XR_ERROR_LIMIT_REACHED` and `XR_ERROR_OUT_OF_MEMORY`, and adjust lists of
    error codes accordingly.
    ([internal MR 2064](https://gitlab.khronos.org/openxr/openxr/merge_requests/2064))
  - Fix a usage of `>` without escaping as an XML entity.
    ([internal MR 2064](https://gitlab.khronos.org/openxr/openxr/merge_requests/2064))
  - Fix all cases of a success code (most often `XR_SESSION_LOSS_PENDING`)
    appearing in the `errorcodes` attribute of a command.
    ([internal MR 2064](https://gitlab.khronos.org/openxr/openxr/merge_requests/2064),
    [internal issue 1566](https://gitlab.khronos.org/openxr/openxr/issues/1566))
  - Improve comments for several enum values.
    ([internal MR 1982](https://gitlab.khronos.org/openxr/openxr/merge_requests/1982))
  - Perform some script clean-up and refactoring, including selective type
    annotation and moving the Conventions abstract base class to `spec_tools`.
    ([internal MR 2064](https://gitlab.khronos.org/openxr/openxr/merge_requests/2064))
  - Sort return codes, with some general, popular codes made to be early. Script
    `sort_codes.py` can be used to maintain this, though it mangles other XML
    formatting, so use it with care. <https://github.com/rpavlik/PrettyRegistryXml>
    can format, and eventually sort return codes (currently sort order does not
    match).
    ([internal MR 2064](https://gitlab.khronos.org/openxr/openxr/merge_requests/2064),
    [OpenXR-SDK-Source/#256](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/256))
- Specification
  - Clarify that values for a given query to `xrEnumerateBoundSourcesForAction` may
    only change at `xrSyncActions`.
    ([internal MR 2026](https://gitlab.khronos.org/openxr/openxr/merge_requests/2026),
    [internal issue 1540](https://gitlab.khronos.org/openxr/openxr/issues/1540),
    [OpenXR-Docs/#82](https://github.com/KhronosGroup/OpenXR-Docs/issues/82))
  - Document new `XR_MSFT_scene_understanding` extension.
    ([internal MR 2032](https://gitlab.khronos.org/openxr/openxr/merge_requests/2032))
  - Document new `XR_MSFT_scene_understanding_serialization` extension.
    ([internal MR 2032](https://gitlab.khronos.org/openxr/openxr/merge_requests/2032))
  - Document new `XR_MSFT_composition_layer_reprojection` vendor extension.
    ([internal MR 2033](https://gitlab.khronos.org/openxr/openxr/merge_requests/2033))
  - Document new `XR_OCULUS_audio_device_guid` extension.
    ([internal MR 2053](https://gitlab.khronos.org/openxr/openxr/merge_requests/2053))
  - Document version 2 of `XR_FB_swapchain_update_state` which provides a mechanism
    to query state.
    ([internal MR 2048](https://gitlab.khronos.org/openxr/openxr/merge_requests/2048))
  - Document version 3 of `XR_FB_swapchain_update_state` which splits platform and
    graphics API specific structs into separate extensions.
    ([internal MR 2059](https://gitlab.khronos.org/openxr/openxr/merge_requests/2059))
  - Make explicit the recommended use of preferred swapchain texture formats.
    ([internal MR 2061](https://gitlab.khronos.org/openxr/openxr/merge_requests/2061))
  - Reserve extension numbers 167-176 for Facebook use.
    ([internal MR 2060](https://gitlab.khronos.org/openxr/openxr/merge_requests/2060))
  - Use flag descriptions generated from XML comments for
    `XrSpaceVelocityFlagBits`, `XrSwapchainUsageFlagBits`, and
    `XrCompositionLayerFlagBits` in the specification.
    ([internal MR 1982](https://gitlab.khronos.org/openxr/openxr/merge_requests/1982))

## OpenXR Specification 1.0.16 (2021-05-11)

This release contains improved/clarified behavior for `xrCreateInstance` and
`xrEnumerateInstanceProperties`, a new multi-vendor extension, a new vendor
extension, and a collection of clarifications.

- Registry
  - Add new `XR_ERROR_RUNTIME_UNAVAILABLE` error code, add
    `XR_ERROR_RUNTIME_UNAVAILABLE` as a supported error code to `xrCreateInstance`
    and `xrEnumerateInstanceProperties`, and remove `XR_ERROR_INSTANCE_LOST` as a
    supported error code from `xrCreateInstance`.
    ([internal MR 2024](https://gitlab.khronos.org/openxr/openxr/merge_requests/2024),
    [internal issue 1552](https://gitlab.khronos.org/openxr/openxr/issues/1552),
    [OpenXR-SDK-Source/#177](https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/177))
  - Add `XR_EXT_hand_joint_motion_range` multi-vendor extension.
    ([internal MR 1995](https://gitlab.khronos.org/openxr/openxr/merge_requests/1995))
  - Add `XR_FB_swapchain_update_state` vendor extension.
    ([internal MR 1997](https://gitlab.khronos.org/openxr/openxr/merge_requests/1997))
  - Fix missing `XR_ERROR_INSTANCE_LOST` return codes for extension functions in
    `XR_EXT_performance_settings`, `XR_EXT_debug_utils`,
    `XR_EXT_conformance_automation`, and `XR_EXT_thermal_query`.
    ([internal MR 2023](https://gitlab.khronos.org/openxr/openxr/merge_requests/2023),
    [OpenXR-Docs/#10](https://github.com/KhronosGroup/OpenXR-Docs/issues/10),
    [internal issue 1256](https://gitlab.khronos.org/openxr/openxr/issues/1256))
  - Reserve extension 166 for working group use.
    ([internal MR 2025](https://gitlab.khronos.org/openxr/openxr/merge_requests/2025))
- Specification
  - Clarify use of `xrRequestExitSession` on platforms with managed application
    lifecycle.
    ([internal MR 1978](https://gitlab.khronos.org/openxr/openxr/merge_requests/1978))
  - Clarify hand grip orientation Z semantics.
    ([internal MR 2008](https://gitlab.khronos.org/openxr/openxr/merge_requests/2008))
  - Clarify unordered swapchain usage flag meaning.
    ([internal MR 2029](https://gitlab.khronos.org/openxr/openxr/merge_requests/2029),
    [internal issue 1543](https://gitlab.khronos.org/openxr/openxr/issues/1543))
  - Clarify that hysteresis should be used when applying thresholds to scalar
    input.
    ([internal MR 2031](https://gitlab.khronos.org/openxr/openxr/merge_requests/2031),
    [internal issue 1260](https://gitlab.khronos.org/openxr/openxr/issues/1260),
    [OpenXR-Docs/#27](https://github.com/KhronosGroup/OpenXR-Docs/issues/27))
  - Document new multi-vendor extension `XR_EXT_hand_joint_motion_range` - allows
    applications to request specific motion ranges when using
    `XR_EXT_hand_tracking`.
    ([internal MR 1995](https://gitlab.khronos.org/openxr/openxr/merge_requests/1995))
  - Document new `XR_FB_swapchain_update_state` vendor extension.
    ([internal MR 1997](https://gitlab.khronos.org/openxr/openxr/merge_requests/1997))
  - Fix `xml_consistency` scripts to properly identify missing error codes from
    handle ancestors, and suppress warnings about all missing `_LOST` and
    `_LOSS_PENDING` on `xrDestroy` functions.
    ([internal MR 2023](https://gitlab.khronos.org/openxr/openxr/merge_requests/2023),
    [OpenXR-Docs/#10](https://github.com/KhronosGroup/OpenXR-Docs/issues/10),
    [internal issue 1256](https://gitlab.khronos.org/openxr/openxr/issues/1256))
  - Modify language in `XR_EXT_hand_tracking` to explicitly state that an "empty
    hand" range of motion is the default.
    ([internal MR 1995](https://gitlab.khronos.org/openxr/openxr/merge_requests/1995))
  - Session: Explicitly name the pattern for "get graphics requirements" functions,
    and place a generic version of the
    `XR_ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING` return code text from graphics
    extensions in the core spec.
    ([OpenXR-Docs/#79](https://github.com/KhronosGroup/OpenXR-Docs/pull/79),
    [internal issue 1547](https://gitlab.khronos.org/openxr/openxr/issues/1547))
  - Style guide: Update "Extensions" chapter to simplify and reflect actual
    practice and policy.
    ([internal MR 2027](https://gitlab.khronos.org/openxr/openxr/merge_requests/2027))
  - Extension process document: Update to note the working group policy on extending
    core/KHR bitmasks.
    ([internal MR 2025](https://gitlab.khronos.org/openxr/openxr/merge_requests/2025))
  - scripts: Have `reflow.py` identify a file's current newline convention, and
    reproduce it upon writing the output.
    ([internal MR 2028](https://gitlab.khronos.org/openxr/openxr/merge_requests/2028))

## OpenXR Specification 1.0.15 (2021-04-13)

This release contains three new vendor extensions plus an assortment of small
spec fixes.

- Registry
  - Add `XR_VARJO_foveated_rendering` vendor extension.
    ([internal MR 1981](https://gitlab.khronos.org/openxr/openxr/merge_requests/1981))
  - Add `XR_VARJO_composition_layer_depth_test` vendor extension.
    ([internal MR 1998](https://gitlab.khronos.org/openxr/openxr/merge_requests/1998))
  - Add `XR_VARJO_environment_depth_estimation` vendor extension.
    ([internal MR 1998](https://gitlab.khronos.org/openxr/openxr/merge_requests/1998))
  - Add `uint16_t` to `openxr_platform_defines` (and associated scripts) so it may
    be used easily by extensions.
    ([internal MR 2017](https://gitlab.khronos.org/openxr/openxr/merge_requests/2017))
  - Reserve extension 149 for working group use.
    ([internal MR 1999](https://gitlab.khronos.org/openxr/openxr/merge_requests/1999))
  - Reserve extension numbers 150 to 155 for ULTRALEAP extensions
    ([internal MR 2006](https://gitlab.khronos.org/openxr/openxr/merge_requests/2006))
  - Reserve extension numbers 156-165 for Facebook.
    ([internal MR 2018](https://gitlab.khronos.org/openxr/openxr/merge_requests/2018))
- Specification
  - Add note to recommend joint names for hand skeletons when using
    XR_EXT_hand_tracking
    ([internal MR 1959](https://gitlab.khronos.org/openxr/openxr/merge_requests/1959),
    [OpenXR-SDK-Source/#223](https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/223))
  - Added anchor to the spec of grip pose and aim pose for easy linking to their
    definitions.
    ([internal MR 2016](https://gitlab.khronos.org/openxr/openxr/merge_requests/2016))
  - Clarify runtime behavior on providing wrong type of images to
    `xrEnumerateSwapchainImages`.
    ([internal MR 2000](https://gitlab.khronos.org/openxr/openxr/merge_requests/2000),
    [internal issue 1512](https://gitlab.khronos.org/openxr/openxr/issues/1512),
    [OpenXR-Docs/#68](https://github.com/KhronosGroup/OpenXR-Docs/issues/68))
  - Correct function parameter documentation in `XR_EXT_conformance_automation`.
    ([internal MR 2003](https://gitlab.khronos.org/openxr/openxr/merge_requests/2003),
    [internal issue 1445](https://gitlab.khronos.org/openxr/openxr/issues/1445),
    [OpenXR-Docs/#60](https://github.com/KhronosGroup/OpenXR-Docs/issues/60))
  - Document new `XR_VARJO_foveated_rendering` vendor extension.
    ([internal MR 1981](https://gitlab.khronos.org/openxr/openxr/merge_requests/1981))
  - Document new `XR_VARJO_composition_layer_depth_test` vendor extension.
    ([internal MR 1998](https://gitlab.khronos.org/openxr/openxr/merge_requests/1998))
  - Document new `XR_VARJO_environment_depth_estimation` vendor extension.
    ([internal MR 1998](https://gitlab.khronos.org/openxr/openxr/merge_requests/1998))
  - Fix generated valid usage language for `xrGetVulkanInstanceExtensionsKHR` and
    `xrGetVulkanDeviceExtensionsKHR`, and fix minor vulkan_enable2 typo.
    ([internal MR 2002](https://gitlab.khronos.org/openxr/openxr/merge_requests/2002),
    [internal issue 1515](https://gitlab.khronos.org/openxr/openxr/issues/1515),
    [OpenXR-Docs/#77](https://github.com/KhronosGroup/OpenXR-Docs/issues/77))
  - Fix sample code in `XR_EXT_hand_tracking` to show proper retrieval of function
    pointers.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Fix sample code in `XR_EXT_performance_settings` to show proper retrieval of
    function pointers.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Fix sample code callouts in `XR_EXT_performance_settings` that were broken by
    reflow.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Fix sample code in `XR_MSFT_hand_tracking_mesh` to show proper retrieval of
    function pointers.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Remove language about display time synchronization for `EXTX_overlay`
    ([internal MR 1951](https://gitlab.khronos.org/openxr/openxr/merge_requests/1951))
  - Reword the description for `xrAttachSessionActionSets`.
    ([internal MR 1986](https://gitlab.khronos.org/openxr/openxr/merge_requests/1986))
  - Specify interpretation of premultiplied alpha color when alpha is zero.
    ([internal MR 1971](https://gitlab.khronos.org/openxr/openxr/merge_requests/1971))
  - Specify that rules for extension revisions compatibility requirements do not
    apply to experimental extensions.
    ([internal MR 1992](https://gitlab.khronos.org/openxr/openxr/merge_requests/1992))
  - Update `reflow.py` so it does not reflow source code callout annotations.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Update `reflow.py` so it does not break directives to include an image.
    ([internal MR 2019](https://gitlab.khronos.org/openxr/openxr/merge_requests/2019))
  - Vulkan extensions: Specify expected mapping of swapchain image flags to Vulkan
    equivalents.
    ([internal MR 1966](https://gitlab.khronos.org/openxr/openxr/merge_requests/1966),
    [internal issue 1500](https://gitlab.khronos.org/openxr/openxr/issues/1500))

## OpenXR Specification 1.0.14 (2021-01-27)

This release contains a collection of fixes and improvements, including one new
vendor extension.

- Registry
  - Add new `XR_FB_android_surface_swapchain_create` vendor extension.
    ([internal MR 1939](https://gitlab.khronos.org/openxr/openxr/merge_requests/1939),
    [internal issue 1493](https://gitlab.khronos.org/openxr/openxr/issues/1493),
    [internal MR 1968](https://gitlab.khronos.org/openxr/openxr/merge_requests/1968))
  - Add missing `optional` attributes to `XR_KHR_vulkan_enable2` structs. Fixes
    validation layer.
    ([OpenXR-Docs/#72](https://github.com/KhronosGroup/OpenXR-Docs/pull/72))
  - Correction to `locationFlags` field in `XrHandJointLocationEXT` to be optional.
    ([internal MR 1945](https://gitlab.khronos.org/openxr/openxr/merge_requests/1945))
  - Reserve vendor extensions for Varjo.
    ([internal MR 1935](https://gitlab.khronos.org/openxr/openxr/merge_requests/1935))
  - Reserve vendor extensions for Magic Leap.
    ([internal MR 1967](https://gitlab.khronos.org/openxr/openxr/merge_requests/1967),
    [internal MR 1970](https://gitlab.khronos.org/openxr/openxr/merge_requests/1970))
  - Reserve extension number 143 to 148 for MSFT extensions.
    ([internal MR 1969](https://gitlab.khronos.org/openxr/openxr/merge_requests/1969))
  - Update Magic Leap ID and contact information.
    ([internal MR 1967](https://gitlab.khronos.org/openxr/openxr/merge_requests/1967))
- Specification
  - Add missing asciidoctor markup to names in `XrResult` comments, and include
    those comments in the `XrResult` ref page.
    ([OpenXR-Docs/#71](https://github.com/KhronosGroup/OpenXR-Docs/pull/71))
  - Clarify specification for thumbstick's Y direction should be pointing Up.
    ([internal MR 1944](https://gitlab.khronos.org/openxr/openxr/merge_requests/1944))
  - Clarify in the `xrGetCurrentInteractionProfile` docs, not just in the output
    struct, that `XR_NULL_PATH` may be returned.
    ([OpenXR-Docs/#64](https://github.com/KhronosGroup/OpenXR-Docs/pull/64))
  - Correct specification readme asciidoctor install references
    ([internal MR 1942](https://gitlab.khronos.org/openxr/openxr/merge_requests/1942))
  - Document new `XR_FB_android_surface_swapchain_create` vendor extension.
    ([internal MR 1939](https://gitlab.khronos.org/openxr/openxr/merge_requests/1939),
    [internal issue 1493](https://gitlab.khronos.org/openxr/openxr/issues/1493),
    [internal MR 1968](https://gitlab.khronos.org/openxr/openxr/merge_requests/1968))
  - Fix broken link in `XR_EXTX_overlay`.
    ([internal MR 1975](https://gitlab.khronos.org/openxr/openxr/merge_requests/1975))
  - Some typo fixes.
    ([OpenXR-Docs/#76](https://github.com/KhronosGroup/OpenXR-Docs/pull/76))
  - XR_KHR_vulkan_enable2: Refer to `xrGetVulkanGraphicsRequirements2KHR` instead
    of `xrGetVulkanGraphicsRequirementsKHR`.
    ([OpenXR-Docs/#74](https://github.com/KhronosGroup/OpenXR-Docs/pull/74))
  - scripts: Enforce that types specified in `structextends` attribute actually
    exist.
    ([internal MR 1928](https://gitlab.khronos.org/openxr/openxr/merge_requests/1928))
  - scripts: Bundle Jinja2 in the OpenXR-Docs repo.
    ([internal MR 1936](https://gitlab.khronos.org/openxr/openxr/merge_requests/1936),
    [OpenXR-Docs/#61](https://github.com/KhronosGroup/OpenXR-Docs/issues/61),
    [internal issue 1446](https://gitlab.khronos.org/openxr/openxr/issues/1446))
  - scripts: Update bundled Jinja2 to 2.10.3, the last version to support Python
    3.3 and 3.4.
    ([internal MR 1936](https://gitlab.khronos.org/openxr/openxr/merge_requests/1936))
  - scripts: Enforce style guide requirements that enum values should start with
    the UPPER_SNAKE_CASE type name. (Checks to make sure the longest common token-
    wise prefix of all values matches the type name, to ensure the type is named
    appropriately too.)
    ([internal MR 1948](https://gitlab.khronos.org/openxr/openxr/merge_requests/1948))
  - scripts: Update AsciiDoctor extensions for no-warning behavior under
    AsciiDoctor 2.
    ([internal MR 1975](https://gitlab.khronos.org/openxr/openxr/merge_requests/1975))

## OpenXR Specification 1.0.13 (2020-11-24)

This release features a new ratified Khronos extension which will serve as the
basis of other extensions, a number of new vendor extensions, and some fixes and
clarifications.

- Registry
  - Add `XR_HTC_vive_cosmos_controller_interaction` vendor extension.
    ([internal MR 1907](https://gitlab.khronos.org/openxr/openxr/merge_requests/1907))
  - Add `XR_FB_display_refresh_rate` vendor extension.
    ([internal MR 1909](https://gitlab.khronos.org/openxr/openxr/merge_requests/1909))
  - Add `XR_MSFT_perception_anchor_interop` vendor extension.
    ([internal MR 1929](https://gitlab.khronos.org/openxr/openxr/merge_requests/1929))
  - Added ratified `XR_KHR_binding_modifications` Khronos extension.
    ([internal MR 1878](https://gitlab.khronos.org/openxr/openxr/merge_requests/1878),
    [internal issue 1413](https://gitlab.khronos.org/openxr/openxr/issues/1413))
  - Reserve vendor extensions for HTC.
    ([internal MR 1907](https://gitlab.khronos.org/openxr/openxr/merge_requests/1907))
  - Reserve extension numbers 109-120 for Facebook extensions.
    ([internal MR 1913](https://gitlab.khronos.org/openxr/openxr/merge_requests/1913))
- Specification
  - Clarify the system resource lifetime in "Fundamentals" chapter.
    ([internal MR 1900](https://gitlab.khronos.org/openxr/openxr/merge_requests/1900),
    [internal issue 1435](https://gitlab.khronos.org/openxr/openxr/issues/1435))
  - Clarify that a running session always starts in a reset state regardless of any
    state it had if it was previously running.
    ([internal MR 1918](https://gitlab.khronos.org/openxr/openxr/merge_requests/1918),
    [internal issue 1461](https://gitlab.khronos.org/openxr/openxr/issues/1461))
  - Document new ratified `XR_KHR_binding_modifications` Khronos extension.
    ([internal MR 1878](https://gitlab.khronos.org/openxr/openxr/merge_requests/1878),
    [internal issue 1413](https://gitlab.khronos.org/openxr/openxr/issues/1413))
  - Document new `XR_HTC_vive_cosmos_controller_interaction` vendor extension.
    ([internal MR 1907](https://gitlab.khronos.org/openxr/openxr/merge_requests/1907))
  - Document new `XR_FB_display_refresh_rate` vendor extension.
    ([internal MR 1909](https://gitlab.khronos.org/openxr/openxr/merge_requests/1909))
  - Document new `XR_MSFT_perception_anchor_interop` vendor extension.
    ([internal MR 1929](https://gitlab.khronos.org/openxr/openxr/merge_requests/1929))
  - `XR_KHR_vulkan_enable`: Account for depth swapchains in extension.
    ([internal MR 1920](https://gitlab.khronos.org/openxr/openxr/merge_requests/1920))
  - `XR_KHR_vulkan_enable`: Clarify API version requirements. The API version
    requirements only apply to instances since the runtime
    is in charge of device selection.
    ([internal MR 1916](https://gitlab.khronos.org/openxr/openxr/merge_requests/1916),
    [internal issue 1447](https://gitlab.khronos.org/openxr/openxr/issues/1447),
    [OpenXR-Docs/#62](https://github.com/KhronosGroup/OpenXR-Docs/issues/62))
  - `XR_KHR_vulkan_enable`: Fix copy/paste error when discussing Vulkan extensions.
    ([OpenXR-Docs/#63](https://github.com/KhronosGroup/OpenXR-Docs/pull/63))
  - rendering: Clarify when a swapchain image should be released.
    ([internal MR 1915](https://gitlab.khronos.org/openxr/openxr/merge_requests/1915),
    [OpenXR-Docs/#50](https://github.com/KhronosGroup/OpenXR-Docs/issues/50),
    [internal issue 1363](https://gitlab.khronos.org/openxr/openxr/issues/1363))

## OpenXR Specification 1.0.12 (2020-09-25)

This release features a number of new ratified KHR extensions, as well as a new
vendor extension.

- Registry
  - Add ratified `XR_KHR_vulkan_enable2` Khronos extension.
    ([internal MR 1627](https://gitlab.khronos.org/openxr/openxr/merge_requests/1627),
    [internal issue 1249](https://gitlab.khronos.org/openxr/openxr/issues/1249),
    [internal issue 1283](https://gitlab.khronos.org/openxr/openxr/issues/1283),
    [internal MR 1863](https://gitlab.khronos.org/openxr/openxr/merge_requests/1863))
  - Add ratified `XR_KHR_loader_init` Khronos extension.
    ([internal MR 1744](https://gitlab.khronos.org/openxr/openxr/merge_requests/1744))
  - Add ratified `XR_KHR_loader_init_android` Khronos extension.
    ([internal MR 1744](https://gitlab.khronos.org/openxr/openxr/merge_requests/1744))
  - Add ratified `XR_KHR_composition_layer_equirect2` Khronos extension.
    ([internal MR 1746](https://gitlab.khronos.org/openxr/openxr/merge_requests/1746))
  - Add ratified `XR_KHR_composition_layer_color_scale_bias` Khronos extension.
    ([internal MR 1762](https://gitlab.khronos.org/openxr/openxr/merge_requests/1762))
  - Add `XR_MSFT_controller_model` vendor extension.
    ([internal MR 1832](https://gitlab.khronos.org/openxr/openxr/merge_requests/1832))
  - Add vendor tag `LIV` for LIV Inc.
    ([internal MR 1896](https://gitlab.khronos.org/openxr/openxr/merge_requests/1896))
  - Fix `structextends` attribute of `XrHandPoseTypeInfoMSFT`.
    ([OpenXR-SDK-Source/#207](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/207))
  - schema: Update to permit aliases for commands and struct types. (Already
    supported by tooling.)
    ([internal MR 1627](https://gitlab.khronos.org/openxr/openxr/merge_requests/1627))
- Specification
  - Adjust the wording to clarify what is "synchronize its frame loop with the
    runtime".
    ([internal MR 1902](https://gitlab.khronos.org/openxr/openxr/merge_requests/1902),
    [internal issue 1438](https://gitlab.khronos.org/openxr/openxr/issues/1438))
  - Document new ratified `XR_KHR_vulkan_enable2` Khronos extension.
    ([internal MR 1627](https://gitlab.khronos.org/openxr/openxr/merge_requests/1627),
    [internal issue 1249](https://gitlab.khronos.org/openxr/openxr/issues/1249),
    [internal issue 1283](https://gitlab.khronos.org/openxr/openxr/issues/1283),
    [internal MR 1863](https://gitlab.khronos.org/openxr/openxr/merge_requests/1863))
  - Document new ratified `XR_KHR_loader_init` Khronos extension.
    ([internal MR 1744](https://gitlab.khronos.org/openxr/openxr/merge_requests/1744))
  - Document new ratified `XR_KHR_loader_init_android` Khronos extension.
    ([internal MR 1744](https://gitlab.khronos.org/openxr/openxr/merge_requests/1744))
  - Document new ratified `XR_KHR_composition_layer_equirect2` Khronos extension.
    ([internal MR 1746](https://gitlab.khronos.org/openxr/openxr/merge_requests/1746))
  - Document new ratified `XR_KHR_composition_layer_color_scale_bias` Khronos
    extension.
    ([internal MR 1762](https://gitlab.khronos.org/openxr/openxr/merge_requests/1762))
  - Document new `XR_MSFT_controller_model` vendor extension.
    ([internal MR 1832](https://gitlab.khronos.org/openxr/openxr/merge_requests/1832))
- Misc
  - Clean up trailing whitespace, byte-order marks, anda ensure trailing newlines.
    ([OpenXR-SDK-Source/#208](https://github.com/KhronosGroup/OpenXR-SDK-Source/pull/208))

## OpenXR Specification 1.0.11 (2020-08-14)

This release is mainly for SDK improvements, with only small changes to the
docs. A new error code is provided for `xrCreateSession` for developers
convenience.

- Registry
  - Register `ULTRALEAP` author ID for Ultraleap.
    ([internal MR 1877](https://gitlab.khronos.org/openxr/openxr/merge_requests/1877))
  - Reserve the extension number 98 to 101 for future MSFT extensions.
    ([internal MR 1879](https://gitlab.khronos.org/openxr/openxr/merge_requests/1879))
  - schema: Distinguish `parentstruct` and `structextends` attributes in comments.
    ([internal MR 1881](https://gitlab.khronos.org/openxr/openxr/merge_requests/1881),
    [OpenXR-Docs/#51](https://github.com/KhronosGroup/OpenXR-Docs/issues/51),
    [internal issue 1396](https://gitlab.khronos.org/openxr/openxr/issues/1396))
  - Add a new result code, `XR_ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING`, for
    runtimes to return if `xrBeginSession` is called before calling one of the
    `xrGetGraphicsRequirements` calls.
    ([internal MR 1882](https://gitlab.khronos.org/openxr/openxr/merge_requests/1882),
    [OpenXR-Docs/#53](https://github.com/KhronosGroup/OpenXR-Docs/issues/53),
    [internal issue 1397](https://gitlab.khronos.org/openxr/openxr/issues/1397))
- Specification
  - Update core spec and graphics binding extensions to describe the new result
    code, `XR_ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING`, which indicates
    programmer error in omitting the `xrGetGraphicsRequirements`-family call
    before calling `xrCreateSession`. The previous error code for this case,
    `XR_ERROR_VALIDATION_FAILURE`, is still permitted for compatibility reasons,
    but discouraged as it is less useful to developers.
    ([internal MR 1882](https://gitlab.khronos.org/openxr/openxr/merge_requests/1882),
    [OpenXR-Docs/#53](https://github.com/KhronosGroup/OpenXR-Docs/issues/53),
    [internal issue 1397](https://gitlab.khronos.org/openxr/openxr/issues/1397))
  - Improve language usage to be more respectful.
    ([internal MR 1881](https://gitlab.khronos.org/openxr/openxr/merge_requests/1881))
  - Typo fixes in recent interaction profile extensions.

## OpenXR Specification 1.0.10 (2020-07-28)

Note the relicensing of the registry XML file in this repository. Each file's
header, or an adjacent file with `.license` appended to the filename, is the
best reference for its license terms. We are currently working on ensuring all
files have an SPDX license identifier tag either in them or in an adjacent file.
This is still in progress but mostly complete.

- Registry
  - Relicense registry XML from MIT-like "Khronos Free Use License for Software and
    Documentation" to, at your option, either the Apache License, Version 2.0,
    found at
    <http://www.apache.org/licenses/LICENSE-2.0>, or the MIT License, found at
    <http://opensource.org/licenses/MIT>, for broader license compatibility with
    downstream projects. (SPDX License Identifier expression "Apache-2.0 OR MIT")
    ([internal MR 1814](https://gitlab.khronos.org/openxr/openxr/merge_requests/1814),
    [OpenXR-Docs/#3](https://github.com/KhronosGroup/OpenXR-Docs/issues/3),
    [internal issue 958](https://gitlab.khronos.org/openxr/openxr/issues/958))
  - Add `XR_MSFT_holographic_window_attachment` vendor extension.
    ([internal MR 1833](https://gitlab.khronos.org/openxr/openxr/merge_requests/1833))
  - Add `XR_EXT_hp_mixed_reality_controller` multi-vendor extension.
    ([internal MR 1834](https://gitlab.khronos.org/openxr/openxr/merge_requests/1834))
  - Add `XR_EXT_samsung_odyssey_controller` multi-vendor extension.
    ([internal MR 1835](https://gitlab.khronos.org/openxr/openxr/merge_requests/1835))
  - Add `XR_VALVE_analog_threshold` vendor extension.
    ([internal MR 1859](https://gitlab.khronos.org/openxr/openxr/merge_requests/1859))
  - Add `XR_MND_swapchain_usage_input_attachment_bit` vendor extension.
    ([internal MR 1865](https://gitlab.khronos.org/openxr/openxr/merge_requests/1865))
  - Reserve extension numbers 71 to 78 for Facebook extensions.
    ([internal MR 1839](https://gitlab.khronos.org/openxr/openxr/merge_requests/1839))
  - Reserve extension numbers 79 to 88 for Valve extensions.
    ([internal MR 1842](https://gitlab.khronos.org/openxr/openxr/merge_requests/1842))
  - Reserve extension numbers 89 to 92 for Khronos extensions.
    ([internal MR 1844](https://gitlab.khronos.org/openxr/openxr/merge_requests/1844))
  - Reserve extension numbers 93 to 94 for `EXT_unbounded_reference_space` and
    `EXT_spatial_anchor`.
    ([internal MR 1854](https://gitlab.khronos.org/openxr/openxr/merge_requests/1854))
  - `XR_EPIC_view_configuration_fov`: Fix `recommendedFov` incorrectly being named
    `recommendedMutableFov`. This is a **source-incompatible change** to a vendor
    extension.
    ([internal MR 1812](https://gitlab.khronos.org/openxr/openxr/merge_requests/1812))
  - schema: Adjust to permit bitmask expansion in extensions, already supported by
    toolchain thanks to Vulkan.
    ([internal MR 1865](https://gitlab.khronos.org/openxr/openxr/merge_requests/1865))
  - scripts: Teach xml-consistency to handle bitmask values defined in extensions.
    ([internal MR 1865](https://gitlab.khronos.org/openxr/openxr/merge_requests/1865))
- Specification
  - Add a note to discourage using 8bpc linear color formats.
    ([internal MR 1843](https://gitlab.khronos.org/openxr/openxr/merge_requests/1843))
  - Change stock text in struct member descriptions to clarify that the `next`
    pointers are not necessarily limited to use by extensions.
    ([internal MR 1846](https://gitlab.khronos.org/openxr/openxr/merge_requests/1846),
    [internal issue 1392](https://gitlab.khronos.org/openxr/openxr/issues/1392))
  - Clarify licensing of personal photo of Johannes van Waveren in dedication (not
    CC-BY-4.0), and exclude it from non-release builds.
    ([internal issue 1383](https://gitlab.khronos.org/openxr/openxr/issues/1383),
    [internal MR 1872](https://gitlab.khronos.org/openxr/openxr/merge_requests/1872))
  - Clarify `XR_ERROR_VALIDATION_FAILURE` returned by runtime when
    `xrGetXXXGraphicsRequirements` is not called before `xrCreateSession`.
    ([internal MR 1544](https://gitlab.khronos.org/openxr/openxr/merge_requests/1544))
  - Document new `XR_MSFT_holographic_window_attachment` vendor extension.
    ([internal MR 1833](https://gitlab.khronos.org/openxr/openxr/merge_requests/1833))
  - Document new `XR_EXT_hp_mixed_reality_controller` multi-vendor extension.
    ([internal MR 1834](https://gitlab.khronos.org/openxr/openxr/merge_requests/1834))
  - Document new `XR_EXT_samsung_odyssey_controller` multi-vendor extension.
    ([internal MR 1835](https://gitlab.khronos.org/openxr/openxr/merge_requests/1835))
  - Document new `XR_MND_swapchain_usage_input_attachment_bit` vendor extension.
    ([internal MR 1865](https://gitlab.khronos.org/openxr/openxr/merge_requests/1865))
  - Fix action set text referring to "session" as parent, which should have been
    "instance".
    ([internal MR 1726](https://gitlab.khronos.org/openxr/openxr/merge_requests/1726))
  - Fix markup typo in suggested binding section.
    ([internal MR 1872](https://gitlab.khronos.org/openxr/openxr/merge_requests/1872))
  - Remove the mentions of the standalone `/user` path, and note its removal as
    errata.
    ([internal MR 1818](https://gitlab.khronos.org/openxr/openxr/merge_requests/1818),
    [internal issue 1380](https://gitlab.khronos.org/openxr/openxr/issues/1380))
  - Small revisions to vendor extensions to conform to the style guide.
    ([internal MR 1869](https://gitlab.khronos.org/openxr/openxr/merge_requests/1869))
  - Spec prose and scripts: Replace biased terminology with a more neutral term,
    allowlist.
    ([OpenXR-Docs/#52](https://github.com/KhronosGroup/OpenXR-Docs/pull/52))
  - Style guide: Fix two broken links.
    ([internal MR 1806](https://gitlab.khronos.org/openxr/openxr/merge_requests/1806))
  - `XR_EXTX_overlay`: Fix reference to Composition Layer Behavior.
    ([internal MR 1801](https://gitlab.khronos.org/openxr/openxr/merge_requests/1801),
    [internal issue 1367](https://gitlab.khronos.org/openxr/openxr/issues/1367))
  - `XR_EXT_conformance_automation`: Insert note box into main body, make note a
    "warning".
    ([internal issue 1333](https://gitlab.khronos.org/openxr/openxr/issues/1333),
    [internal MR 1872](https://gitlab.khronos.org/openxr/openxr/merge_requests/1872))
  - `XR_KHR_composition_layer_depth`: Note that the depth layer doesn't change the
    order of composition of layers.
    ([internal MR 1826](https://gitlab.khronos.org/openxr/openxr/merge_requests/1826),
    [internal issue 1340](https://gitlab.khronos.org/openxr/openxr/issues/1340))
  - scripts: Improve `xml_consistency` check script, transplanting some checks from
    generation scripts.
    ([internal MR 1797](https://gitlab.khronos.org/openxr/openxr/merge_requests/1797))

## OpenXR Specification 1.0.9 (2020-05-29)

- Registry
  - Add an author ID, and reserve a vendor extension for Huawei.
    ([OpenXR-Docs/#46](https://github.com/KhronosGroup/OpenXR-Docs/pull/46))
  - Reserve vendor extensions for future LunarG overlay and input focus
    functionality.
    ([internal MR 1720](https://gitlab.khronos.org/openxr/openxr/merge_requests/1720))
  - Reserve vendor extensions for Microsoft.
    ([internal MR 1723](https://gitlab.khronos.org/openxr/openxr/merge_requests/1723))
  - Add `XR_EXT_hand_tracking` multi-vendor extension.
    ([internal MR 1554](https://gitlab.khronos.org/openxr/openxr/merge_requests/1554),
    [internal issue 1266](https://gitlab.khronos.org/openxr/openxr/issues/1266),
    [internal issue 1267](https://gitlab.khronos.org/openxr/openxr/issues/1267),
    [internal issue 1268](https://gitlab.khronos.org/openxr/openxr/issues/1268),
    [internal issue 1269](https://gitlab.khronos.org/openxr/openxr/issues/1269))
  - Add `XR_HUAWEI_controller_interaction` vendor extension.
    ([OpenXR-Docs/#47](https://github.com/KhronosGroup/OpenXR-Docs/pull/47))
  - Add `XR_MNDX_egl_enable` provisional vendor extension.
    ([OpenXR-Docs/#48](https://github.com/KhronosGroup/OpenXR-Docs/pull/48))
  - Add `XR_MSFT_spatial_graph_bridge` vendor extension.
    ([internal MR 1730](https://gitlab.khronos.org/openxr/openxr/merge_requests/1730))
  - Add `XR_MSFT_secondary_view_configuration` and `XR_MSFT_first_person_observer`
    vendor extensions.
    ([internal MR 1731](https://gitlab.khronos.org/openxr/openxr/merge_requests/1731))
  - Add `XR_MSFT_hand_mesh_tracking` vendor extension.
    ([internal MR 1736](https://gitlab.khronos.org/openxr/openxr/merge_requests/1736))
  - Fix missing space in XML definition of `XrSpatialAnchorCreateInfoMSFT`.
    ([internal MR 1742](https://gitlab.khronos.org/openxr/openxr/merge_requests/1742),
    [internal issue 1351](https://gitlab.khronos.org/openxr/openxr/issues/1351),
    [OpenXR-SDK-Source/#187](https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/187))
  - Update a number of contacts for author/vendor tags.
    ([internal MR 1788](https://gitlab.khronos.org/openxr/openxr/merge_requests/1788),
    [internal issue 1326](https://gitlab.khronos.org/openxr/openxr/issues/1326))
- Specification
  - Make `xrCreateSession`'s generation of an IDLE event explicit and indicate
    `xrSuggestInteractionProfileBinding` must accept every specified profile.
    ([internal MR 1729](https://gitlab.khronos.org/openxr/openxr/merge_requests/1729))
  - Clarify `KHR_D3D12_enable` spec, for reducing ambiguity, by changing the Vulkan
    term "memory layout" to D3D12 term "resource state".
    ([internal MR 1774](https://gitlab.khronos.org/openxr/openxr/merge_requests/1774))
  - Document new `XR_EXT_hand_tracking` multi-vendor extension.
    ([internal MR 1554](https://gitlab.khronos.org/openxr/openxr/merge_requests/1554),
    [internal issue 1266](https://gitlab.khronos.org/openxr/openxr/issues/1266),
    [internal issue 1267](https://gitlab.khronos.org/openxr/openxr/issues/1267),
    [internal issue 1268](https://gitlab.khronos.org/openxr/openxr/issues/1268),
    [internal issue 1269](https://gitlab.khronos.org/openxr/openxr/issues/1269))
  - Document new `XR_MSFT_spatial_graph_bridge` vendor extension.
    ([internal MR 1730](https://gitlab.khronos.org/openxr/openxr/merge_requests/1730))
  - Document new `XR_MSFT_secondary_view_configuration` and
    `XR_MSFT_first_person_observer` vendor extensions.
    ([internal MR 1731](https://gitlab.khronos.org/openxr/openxr/merge_requests/1731))
  - Document new `XR_MSFT_hand_mesh_tracking` vendor extension.
    ([internal MR 1736](https://gitlab.khronos.org/openxr/openxr/merge_requests/1736))
  - Document new `XR_MNDX_egl_enable` provisional vendor extension.
    ([OpenXR-Docs/#48](https://github.com/KhronosGroup/OpenXR-Docs/pull/48))
  - Simplify generation and appearance of index in PDF specification output through
    a custom `asciidoctor-pdf` extension.
    ([internal MR 1738](https://gitlab.khronos.org/openxr/openxr/merge_requests/1738))
  - scripts: Enable "deflate" compression by default on specification PDF
    generation. ("Release" PDFs are still separately optimized, but this improves
    CI and local builds.)
    ([internal MR 1738](https://gitlab.khronos.org/openxr/openxr/merge_requests/1738))
  - scripts: Teach `xml_consistency` to check that there is something (typically a
    space) between the end of a `type` element and the start of a `name` element,
    to avoid future issues like the referenced issues.
    ([internal MR 1742](https://gitlab.khronos.org/openxr/openxr/merge_requests/1742),
    [internal issue 1351](https://gitlab.khronos.org/openxr/openxr/issues/1351),
    [OpenXR-SDK-Source/#187](https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/187))
  - HTML output: Add small footer script to avoid line breaks between a number in
    the TOC and the first word. This mainly improves the appearance of the
    extension chapters, since they start with a very long "first word" (the
    extension name).
    ([internal MR 1772](https://gitlab.khronos.org/openxr/openxr/merge_requests/1772))

## OpenXR Specification 1.0.8 (2020-03-27)

Patch release for the 1.0 series.

Updates version to 1.0.8.

- Registry
  - `XR_EXTX_overlay`: upgrade overlay bit names to match the convention, and
    increase extension version number. This is a **source-incompatible change**
    to a provisional multi-vendor extension.
    ([internal MR 1697](https://gitlab.khronos.org/openxr/openxr/merge_requests/1697),
    [internal issue 1318](https://gitlab.khronos.org/openxr/openxr/issues/1318),
    [internal issue 42](https://gitlab.khronos.org/openxr/openxr/issues/42),
    [internal MR 171](https://gitlab.khronos.org/openxr/openxr/merge_requests/171))
  - Introduce `XR_EXT_eye_gaze_interaction` extension for eye gaze interaction
    profile.
    ([internal MR 1556](https://gitlab.khronos.org/openxr/openxr/merge_requests/1556))
  - Add SPDX license identifier tag to registry schema.
    ([internal MR 1686](https://gitlab.khronos.org/openxr/openxr/merge_requests/1686))
  - Add missing error codes to `xrCreateActionSet`, `xrCreateAction`, and
    `xrGetInputSourceLocalizedName`.
    ([internal MR 1698](https://gitlab.khronos.org/openxr/openxr/merge_requests/1698))
- Specification
  - Update `xml_consistency.py` to verify that enum value naming matches style
    guide conventions.
    ([internal MR 1696](https://gitlab.khronos.org/openxr/openxr/merge_requests/1696))
  - `XR_EXTX_overlay`: upgrade overlay bit names to match the convention. This is a
    **source-incompatible change** to a provisional multi-vendor extension.
    ([internal MR 1697](https://gitlab.khronos.org/openxr/openxr/merge_requests/1697),
    [internal issue 1318](https://gitlab.khronos.org/openxr/openxr/issues/1318),
    [internal issue 42](https://gitlab.khronos.org/openxr/openxr/issues/42),
    [internal MR 171](https://gitlab.khronos.org/openxr/openxr/merge_requests/171))
  - Introduce `XR_EXT_eye_gaze_interaction` extension for eye gaze interaction
    profile.
    ([internal MR 1556](https://gitlab.khronos.org/openxr/openxr/merge_requests/1556))
  - Clarify that calling `xrGetInputSourceLocalizedName` when no action set has
    been attached to the session results in `XR_ERROR_ACTIONSET_NOT_ATTACHED`.
    ([internal MR 1698](https://gitlab.khronos.org/openxr/openxr/merge_requests/1698))

## OpenXR Specification 1.0.7 (2020-03-20)

Patch release for the 1.0 series.

Updates version to 1.0.7.

Note: Changelogs are now being assembled with the help of the
[Proclamation](https://pypi.org/project/proclamation/) tool, so the format has
changed somewhat.

- Registry
  - Clarify the usage of `engineName` and `applicationName` in `XrApplicationInfo`.
    ([internal MR 1645](https://gitlab.khronos.org/openxr/openxr/merge_requests/1645))
  - Introduce `XR_MSFT_hand_interaction` extension for hand interaction profile.
    ([internal MR 1601](https://gitlab.khronos.org/openxr/openxr/merge_requests/1601))
  - Introduce `XR_EPIC_view_configuration_fov` extension for system field-of-view
    queries.
    ([internal MR 1170](https://gitlab.khronos.org/openxr/openxr/merge_requests/1170))
  - Indicate that `xrBeginFrame` returns `XR_ERROR_CALL_ORDER_INVALID` when not
    paired with a corresponding `xrWaitFrame` call.
    ([internal MR 1673](https://gitlab.khronos.org/openxr/openxr/merge_requests/1673))
  - Update the version number of `XR_KHR_D3D12_enable` extension.
  - ([internal MR 1681](https://gitlab.khronos.org/openxr/openxr/merge_requests/1681))
  - Introduce `XR_EXTX_overlay` extension for Overlay sessions (which can provide
    overlay composition layers).
    ([internal MR 1665](https://gitlab.khronos.org/openxr/openxr/merge_requests/1665))
- Specification
  - Clarify the usage of `engineName` and `applicationName` in `XrApplicationInfo`.
    ([internal MR 1645](https://gitlab.khronos.org/openxr/openxr/merge_requests/1645))
  - Simplify and update the specification build instructions in
    `specification/README.md`. On Windows, use of Windows Subsystem for Linux to
    build the spec is now assumed: Makefile code, etc. for retired methods (Cygwin,
    MinGW) remain for this release but are being considered for removal in an
    upcoming release to reduce maintenance burden. (They have not been tested in
    some time.) Note that this does not affect the build support of the SDK.
    ([internal MR 1692](https://gitlab.khronos.org/openxr/openxr/merge_requests/1692))
  - Introduce `XR_MSFT_hand_interaction` extension for hand interaction profile.
    ([internal MR 1601](https://gitlab.khronos.org/openxr/openxr/merge_requests/1601))
  - Adjust release scripts to publish the Style Guide and Extension Process with
    the rest of the specification.
    ([internal MR 1678](https://gitlab.khronos.org/openxr/openxr/merge_requests/1678))
  - Revise Style Guide and Extension Process, ratify by working group, and release.
    ([internal MR 1648](https://gitlab.khronos.org/openxr/openxr/merge_requests/1648))
  - Introduce `XR_EPIC_view_configuration_fov` extension for system field-of-view
    queries.
    ([internal MR 1170](https://gitlab.khronos.org/openxr/openxr/merge_requests/1170))
  - Clarify that every `xrWaitFrame` call must have a matching `xrBeginFrame`
    call and that there can be up to one outstanding call to `xrWaitFrame` for
    pipelined frame loops.
    ([internal MR 1673](https://gitlab.khronos.org/openxr/openxr/merge_requests/1673))
  - Specify expected D3D12 resource state of a depth swapchain image between
    `xrAcquireSwapchainImage` and `xrReleaseSwapchainImage`.
    ([internal MR 1681](https://gitlab.khronos.org/openxr/openxr/merge_requests/1681))
  - Update build scripts so that headers in the generated HTML have clickable
    anchor links that appear on hover, to provide a direct link to a heading.
    ([internal MR 1691](https://gitlab.khronos.org/openxr/openxr/merge_requests/1691))
  - Introduce `XR_EXTX_overlay` extension for Overlay sessions (which can provide
    overlay composition layers)
    ([internal MR 1665](https://gitlab.khronos.org/openxr/openxr/merge_requests/1665))

## OpenXR 1.0.6 release (24-January-2020)

Patch release for the 1.0 series.

Updates version to 1.0.6.

### Internal issues

- Registry
  - Fix typo in visibility mesh enum comment.
- Scripts
  - Fix comment typos.
  - Sync scripts with Vulkan. (internal MR 1625)
  - Sort the names of APIs in generated "See also" lists for deterministic
    results. (internal MR 1622)
- Spec
  - Fix reference in `xrGetCurrentInteractionProfile` spec to a path format that
    doesn't exist. (internal issue 1221, internal MR 1565)
  - Fix missing `back` button in Oculus Go controller interaction profile.
  - Add text about OpenGL context currentness on other threads. (internal MR
    1614)
  - Fix typo in `XR_SESSION_STATE_VISIBLE` description (internal issue 1294,
    internal MR 1630)
  - Add `XR_EXT_win32_appcontainer_compatible` extension.
  - Clarify error code when using interaction profile that's not in the spec.
    (internal issue 1272, internal MR 1615)

### New extensions in 1.0.6

- `XR_EXT_win32_appcontainer_compatible`

## OpenXR 1.0.5 release (6-December-2019)

Patch release for the 1.0 series.

Updates version to 1.0.5.

### Internal issues

- Registry
  - Reserve Microsoft extension numbers (Internal MR 1613)
- Spec
  - Clarify degree to which `xrWaitFrame` is decoupled from
    `xrBeginFrame`/`xrEndFrame` (internal issue 1246, internal MR 1595)
  - Typo fixed in `XrCompositionLayerQuad` docs.
    <https://github.com/KhronosGroup/OpenXR-Docs/issues/24> (internal issue
    1254)

## OpenXR 1.0.4 release (21-November-2019)

Patch release for the 1.0 series.

Updates version to 1.0.4.

### GitHub Pull Requests

- Spec
  - Clarify Monado headless extension behavior related to `xrWaitFrame`
    <https://github.com/KhronosGroup/OpenXR-Docs/pull/38>
- Registry
  - Reserve a Monado EGL extension
    <https://github.com/KhronosGroup/OpenXR-Docs/pull/39>

### Internal issues

- General, Build, Other
  - Remove unused/unneeded files (internal MR 1609)
- Spec
  - Clarify subaction path description for XrActiveActionSet (internal MR 1592,
    internal issues 1243 and 1244)
  - Resolve misleading use of `xrLocateViews` before `xrWaitFrame` in helloXR
    and spec (internal MR 1584, internal issue 1227, public issue
    <https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/134>)
- Registry
  - Add `XR_EXT_conformance_automation` extension, for use **only** by
    conformance testing (internal MR 1577, 1608)

## OpenXR 1.0.3 release (7-October-2019)

Patch release for the 1.0 series.

Updates version to 1.0.3.

### Public issues

- OpenXR-SDK-Source PR #139 - Write output atomically at the end of generator scripts

### Internal issues

- Spec
  - Clarify what happens when a swapchain that has never been released is passed
    to `xrEndFrame`. (internal MR 1569, internal issue 1121)
  - Remove duplicated paragraph in `XR_KHR_vulkan_enable` (internal MR 1543)
- Registry
  - Add `XR_EXT_view_configuration_depth_range` extension (internal MR 1502,
    internal issue 1201)
  - Reserve a Monado extension (internal MR 1541)

## OpenXR 1.0.2 release (27-August-2019)

Patch release for the 1.0 series.

Updates version to 1.0.2.

### Public issues

- Pull request #30 - Fix parameter name typo in XR_MSFT_spatial_anchor

### Internal issues

- Enhance xml_consistency script. (Internal MR 1526)
- Sync scripts from Vulkan. (Internal MR 1514)
- Port the equivalent of Vulkan's internal MR 3319 to OpenXR,
  affecting empty bitmask generated implicit valid usage. (Internal MR 1513)
- Fix error in extension-added function. (Internal MR 1510)
- Add Oculus Android extension. (Internal MR 1518)
- Reserve additional extension number for Oculus. (Internal MR 1517)

## OpenXR 1.0.1 release (2-August-2019)

Patch release for the 1.0 series.

Updates version to 1.0.1.

### Public issues

- #25 - Fix `make all` in the absence of styleguide and loader doc.
- #26 - Proposal for unbounded space and spatial anchor extensions (vendor extensions)

### Internal issues

- Replace remaining mentions of "app" with "application" (internal MR 1468)
- Makefile cleanups (internal MR 1469, 1489)
- Typographical fixes (internal MR 1490)
- Reserve Oculus extension numbers (internal MR 1493)
- Add Monado headless (vendor extension) (internal MR 1482)
- Generated header files removed from `OpenXR-Docs` repo.

### New extensions

- `XR_MND_headless`
- `XR_MSFT_spatial_anchor`
- `XR_MSFT_unbounded_reference_space`

## OpenXR 1.0.0 release (29-July-2019)

Substantial changes, including breaking changes, since the 0.90 series.

Users of the provisional release should migrate to 1.0.

## Change log for OpenXR 0.90.1 provisional spec update (8-May-2019)

No API changes, and only minimal consistency changes to the spec/registry.
Mostly an update for tooling, layers, loader, and sample code. Header version
has been bumped to 43, but no symbols that should have actually been in use have
changed.

The OpenXR-Docs repo now contains the scripts and sources needed to build
the specification output files.

### Internal Issues

- General, Build, Other
  - Unify (for the most part) the OpenXR and Vulkan generator scripts. (internal
    MR 1166)
  - Avoid dllexport for all apps compiled with `openxr_platform_defines.h`
    (internal MR 1187)
- API Registry and Headers
  - Remove impossible and undocumented error codes. (internal MR 1185 and 1189)
  - Mark layers in `XrFrameEndInfo` as optional. (internal MR 1151, internal
    issue 899)
  - Remove unused windows types from `openxr_platform.h` (internal MR 1197)
  - Make `openxr_platform.h` include `openxr.h` on which it depends. (internal
    MR 1140, internal issue 918)
  - Remove unused, undocumented defines. (internal MR 1238, internal issue 1012)

## OpenXR 0.90.0 - Initial public provisional release at GDC
