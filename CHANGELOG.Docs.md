# Changelog for OpenXR-Docs and OpenXR-Registry Repos

<!--
Copyright (c) 2019-2020 The Khronos Group Inc.

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
