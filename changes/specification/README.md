# Specification Changes

Please create changelog fragments in this directory for changes that affect
specification text only. These fragments will only be applied to the
specification changelog.

See the README.md in the parent directory for information on the format and
naming of changelog fragment files.

## Common entries

During a patch release series, the main thing that should happen to the
specification text itself is "fix" or "clarify" - so include that in your
fragment if applicable.

The most common entries in the specification changelog involve extensions. Use
the following as templates.

For adding/enabling a vendor/multi-vendor extension:

> Document new `XR_MYVENDOR_myextension` vendor extension.

- Add "provisional" before "vendor" if required.
- If this is an EXT multi-vendor extension, change "vendor" to "multi-vendor".

For adding/enabling a KHR or KHX extension:

> Document new ratified `XR_KHR_myextension` Khronos extension.

- Add "provisional" before "Khronos" if it is a KHX extension.
- Note that these all require the review period and board ratification!
