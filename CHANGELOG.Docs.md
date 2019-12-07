# Changelog for OpenXR-Docs and OpenXR-Registry Repos

Update log for the OpenXR-Docs and OpenXR-Registry repos on GitHub. Updates are
in reverse chronological order starting with the latest public release.

This summarizes the periodic public updates, not individual commits. Updates on
GitHub are generally done as single large patches at the release point,
collecting together the resolution of many Khronos internal issues, along with
any public pull requests that have been accepted.

This changelog only lists changes that affect the registry,
headers, and/or specification text.

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
Mostly an update for tooling, layers, loader, and sample code.
Header version has been bumped to 43, but no symbols that should have actually been in use have changed.

The OpenXR-Docs repo now contains the scripts and sources needed to build
the specification output files.

### Internal Issues

- General, Build, Other
  - Unify (for the most part) the OpenXR and Vulkan generator scripts. (internal MR 1166)
  - Avoid dllexport for all apps compiled with `openxr_platform_defines.h` (internal MR 1187)
- API Registry and Headers
  - Remove impossible and undocumented error codes. (internal MR 1185 and 1189)
  - Mark layers in `XrFrameEndInfo` as optional. (internal MR 1151, internal issue 899)
  - Remove unused windows types from `openxr_platform.h` (internal MR 1197)
  - Make `openxr_platform.h` include `openxr.h` on which it depends. (internal MR 1140, internal issue 918)
  - Remove unused, undocumented defines. (internal MR 1238, internal issue 1012)

## OpenXR 0.90.0 - Initial public provisional release at GDC
