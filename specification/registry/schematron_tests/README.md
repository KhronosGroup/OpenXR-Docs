# Schematron test suite

<!--
Copyright 2022-2026 The Khronos Group Inc.

SPDX-License-Identifier: CC-BY-4.0
-->

This directory contains a number of stripped-down XML files that serve to test
(generally) individual rules/assertions in the `registry.sch`.

## Running the tests

Because schematron processing requires starting a JVM, and because @rpavlik (who
set this up) did not want to use or write JVM code to handle test running within
a single instance, we have a Makefile that attempts to reduce the number of
instances we need to run.

```sh
make test
```

will do an "incremental" test run - running tests that have changed since the
last run, or running all tests if the schema or other shared files have changed.

To be sure you run all tests, you can do a clean run:

```sh
make clean test
```

This does require a `sh`-compatible shell and a few other tools in your path,
mostly the same as just running `checkSchematron.sh` plus (GNU) Make.

## Organization

All XML files matching `pass.*.xml` are expected to pass the Schematron rules
without errors. The file `pass.base.xml` is a useful subset of the OpenXR
registry containing a reasonable sampling of element types and usages, and can
be a good starting place for creating additional test files.

All XML files matching `fail.*.xml` are expected to fail the Schematron rules.
They should be constructed to fail only one assertion (or one assertion plus
those that depend on it, if required): each assertion should get at least one
"fail" test.

In general, construct the name of a test out of `.`-delimited descriptions of
increasing levels of specialization, like `require.command.core` (to test that
requires of a command from the core spec are verified correctly - there are also
requires from extensions, and there are other things to require).

Give the assertion under test a matching `id` - here `require.command`, with
`core` and `ext` as variants - and name the fixture `fail.<id>.xml` or
`fail.<id>.<variant>.xml`. The id is echoed into the report as
`<svrl:failed-assert id="...">`, and a fixture named after one should fail that
assertion and no other; the longest matching id wins, so one id may be a prefix
of another. A trailing number makes a fine variant, but it should separate cases
of a single rule rather than one rule from another. Not every assertion has an
id yet; add one whenever you touch a rule.

## How it works

We don't actually get a useful exit code out of running SchXslt (our Schematron
processor) directly, so both here and in the normal `checkSchematron.sh`, we
have it write a `srvl` report file which we grep to determine if there was a
test failure. In the tests, these `srvl` files can also serve as "stamp" files
recording the time we last ran the test. `make clean` simply removes all those
`srvl` files, and `make test` depends on a `srvl` file for each XML that is
found using two `$(wildcard)` expressions.

To ensure consistency with the main script, the Makefile rules source the same
shell script and use the same function to invoke SchXslt and process the `srvl`
as `checkSchematron.sh`.

In addition, the runner enforces that `fail.*.xml` tests do not cascade. Each test
must trigger at most 1 failure (or at most `N` failures if explicitly annotated with
an XML comment like `<!-- expected-failures: N -->`).
