# Example Builds

<!--
Copyright (c) 2014-2023, The Khronos Group Inc.

SPDX-License-Identifier: CC-BY-4.0
-->

The makefile target `build-examples` does the following:

- Runs a Python script (`extract_code.py`) that
  - extracts code blocks from the specification adoc files
  - generates a corresponding makefile snippet `examples.mk`
- compiles (but does not link) those code blocks.

To be extracted, a code block must satisfy *all* of the following conditions:

- Between two `----` dividers.
- Preceded by a line like `[source,c++]` or `[source,c]`
  - This "tag list" is comma separated, case-insensitive, and order-insensitive after the first tag.
  - `source` must be the first tag in the list
  - `c` or `c++` must be in the list
  - `suppress-build` must **not** be in the list.
  - All other tags are silently ignored (neither required nor disqualifying).
- Longer than "trivial" (more than a handful of lines, see `MIN_LINES` in the script)

## Naming

Code blocks meeting these criteria will be given a name matching the chapter they're from,
followed by a dot-delimited counter (starting at `.0`),
followed by `.c` or `.cpp` as appropriate.
These files are created in a `generated` subdirectory of this (`example-builds`) directory.

For example, the first acceptable code block in `view_configurations.adoc`
might be extracted to `specification/example-builds/generated/view_configuration.0.cpp`.

## Modification of code blocks

Very few changes are made to the code blocks.

The following lines are put in the file before the extracted code:

```c++
#include "common_include.h"
// Optional per-code-block include goes here.

void func() {
```

and only a lone

```c++
}
```

follows the code.

### Includes

`common_include.h` includes or declares things needed by multiple examples,
including the main OpenXR header.

Additionally, the script checks for the presence of a per-code-block header file:
a header with the same stem as the source file,
located in this directory.

So, in the case of the example above, it will look for `specification/example-builds/view_configuration.0.h`.

If such a per-code-block include file is present,
an include line for it will be added after the `common_include.h` include line, where noted above.

The effect is roughly equivalent to adding the following
(replacing `STEM` with, e.g. `view_configuration.0`)
after the `common_include.h` include:

```c++
#if __has_include(STEM.h)
#include "STEM.h"
#endif
```

### Line directives

Each line extracted from the adoc file is preceded by a directive like

```c++
# 112 "/home/user/openxr/specification/sources/chapters/appendix.adoc"
```

so that compiler error messages point back to the original adoc file and line.
This only affects the error messages, not the normal compilation of the code.
