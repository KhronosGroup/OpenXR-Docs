# Changelog for OpenXR-Docs and OpenXR-Registry Repos

<!--
Copyright (c) 2019-2022, The Khronos Group Inc.

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
    `xrSuggestInteractionProfileBinding` must accept every whitelisted profile.
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
