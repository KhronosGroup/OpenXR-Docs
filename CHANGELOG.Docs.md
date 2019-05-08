# Changelog for OpenXR-Docs and OpenXR-Registry Repos

Update log for the OpenXR-Docs and OpenXR-Registry repos on GitHub.
Updates are in reverse chronological order starting with the latest public release.

This summarizes the periodic public updates, not individual commits. Updates
on GitHub are generally done as single large patches at the release point,
collecting together the resolution of many Khronos internal issues,
along with any public pull requests that have been accepted.

This changelog only lists changes that affect the registry,
headers, and/or specification

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
