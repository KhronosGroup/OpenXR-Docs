COPYING.md for the KhronosGroup/OpenXR-Docs project
===================================================

# Licenses

The OpenXR-Docs project uses several licenses.

* The source files (in asciidoctor and other formats) for the OpenXR
  Specification, reference pages, and supporting documentation are licensed
  under the Creative Commons Attribution 4.0 International License
  ("CC-BY").
* Header files, scripts, programs, XML files, and other tooling used or
  generated as part of the build process is licensed under the Apache
  License, Version 2.0.
* Some generated, transient files produced during the course of building the
  specification, headers, or other targets may not have copyrights. These
  are typically very short asciidoc fragments describing parts of the OpenXR
  API, and are incorporated by reference into specification or reference
  page builds.

Users outside Khronos who create and post OpenXR Specifications, whether
modified or not, should use the CC-BY license on the output documents (HTML,
PDF, etc.) they generate.


# Frequently Asked Questions

Q: Why are the HTML and PDF Specifications posted on Khronos' website under
a license which is neither CC-BY nor Apache 2.0?

A: The Specifications posted by Khronos in the OpenXR Registry are licensed
under the proprietary Khronos Specification License. Only these
Specifications are Ratified by the Khronos Board of Promoters, and therefore
they are the only Specifications covered by the Khronos Intellectual
Property Rights Policy.


Q: Does Khronos allow the creation and distribution of modified versions of
the OpenXR Specification, such as translations to other languages?

A: Yes. Such modified Specifications, since they are not created by Khronos,
should be placed under the CC-BY license. If you believe your modifications
are of general interest, consider contributing them back by making a pull
request (PR) on the OpenXR-Docs project.


Q: Can I contribute changes to the OpenXR Specification?

A: Yes, by opening a PR on the KhronosGroup/OpenXR-Docs Github project. You
must execute a click-through Contributor License Agreement, which brings
your changes under the umbrella of the Khronos IP policy. We welcome
feedback and proposed changes, but will not necessarily accept all such
changes. Please keep PRs focused on solving a single problem; more ambitious
PRs that try to solve multiple problems, or touch many parts of the
Specification at once, are difficult for the OpenXR Working Group to review
in a timely fashion.


Q: Can you change the license on your files so they're compatible with my
license?

A: We've added an "Exceptions to the Apache 2.0 License" clause to the
copyright on xr.xml, to make it more compatible with GPL-licensed software,
such as externally-generated language bindings. This seems to have addressed
the problems we're aware of. It is possible we could extend the Exception
Clause to other Apache-licensed files in the project, or otherwise
accommodate new needs of external projects; but working with the different
Khronos member company IP lawyers to make license changes is a very slow
process, constrained by the Khronos Member Agreement and IP Policy as well
as by individual company concerns about their IP. Do not expect rapid
changes in anything having to do with copyrights and licensing.
