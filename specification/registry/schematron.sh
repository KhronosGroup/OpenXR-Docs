#!/bin/sh -e
#
# Copyright (c) 2019-2026 The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

# This file contains functions for running schxslt and getting a useful exit code,
# as well as downloading/verifying it on-demand.
# You must set and export REGISTRY_DIR before sourcing.

set -e
SCHEMATRON_VERSION=1.10.1
# from https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/1.10.1/cli-1.10.1.jar.sha1
export SCHEMATRON_SHA1SUM=00dd23a94e410b3ffe410f4ffc4de8c0646b4d29
export SCHXSLT_URI=https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/$SCHEMATRON_VERSION/cli-$SCHEMATRON_VERSION.jar

REGISTRY_DIR=$(cd "$REGISTRY_DIR" && pwd)

SCHXSLT_CLI=$REGISTRY_DIR/$(basename "$SCHXSLT_URI")
export SCHXSLT_CLI


export SCH="$REGISTRY_DIR/registry.sch"

makeSchematronReport() {
    java -jar "$SCHXSLT_CLI" --document "$1" --schematron "$SCH" --verbose --output "$1.srvl" --exitcode 1
}

logFailedAsserts() {
    tr '\n' ' ' < "$1" |
    sed -e 's/<svrl:failed-assert/\n<svrl:failed-assert/g' |
    grep '^<svrl:failed-assert' |
    sed -e 's/  */ /g' \
        -e '/id="/   s/.* id="\([^"]*\)".*<svrl:text>\(.*\)<\/svrl:text>.*/  - \1: \2/;t' \
        -e '/test="/ s/.* test="\([^"]*\)".*<svrl:text>\(.*\)<\/svrl:text>.*/  - (test: \1): \2/'
}

runSchematron() {
    makeSchematronReport "$1"
    if [ -f "$1.srvl" ]; then
        if grep -q "failed-assert>" "$1.srvl" > /dev/null; then
            logFailedAsserts "$1.srvl" 1>&2
            return 1
        fi
        if grep -q "invalid" "$1.srvl" > /dev/null; then
            return 1
        fi
    else
        echo "**** ERROR Invalid XML file: $1" 1>&2
        exit 1
    fi
}

runSchematronFailTest() {
    makeSchematronReport "$1" || true
    if [ ! -f "$1.srvl" ]; then
        echo "**** ERROR Invalid XML file: $1" 1>&2
        exit 1
    fi
    max_fails=1
    if grep -q "expected-failures:" "$1" 2>/dev/null; then
        max_fails=$(sed -n -e 's/.*expected-failures:[[:space:]]*\([0-9]*\).*/\1/p' "$1" | head -n 1)
    fi
    num_fails=$(grep -o "<svrl:failed-assert" "$1.srvl" 2>/dev/null | wc -l)
    if [ "$num_fails" -eq 0 ]; then
        echo "[ERROR] $1: unexpected schema-pass (0 failures)" 1>&2
        return 1
    elif [ "$num_fails" -gt "$max_fails" ]; then
        echo "[ERROR] $1: expected at most $max_fails failure(s), found $num_fails:" 1>&2
        logFailedAsserts "$1.srvl" 1>&2
        echo "If this is expected, add '<!-- expected-failures: $num_fails -->' to the test file." 1>&2
        return 1
    fi
    return 0
}

ensureSchXslt() {
    set -e
    (
        cd "$REGISTRY_DIR"

        if ! command -v java > /dev/null; then
            echo "Cannot perform schematron validation: no java."
            exit 0
        fi
        if ! command -v sha1sum > /dev/null; then
            echo "Cannot perform schematron validation: no sha1sum."
            exit 0
        fi

        if ! command -v grep > /dev/null; then
            echo "Cannot perform schematron validation: no grep. (!?)"
            exit 0
        fi

        if [ ! -f "$SCHXSLT_CLI" ]; then
            echo "Trying to download SchXslt..."

            if ! command -v wget > /dev/null; then
                echo "Cannot download schxslt and schematron validation: no wget."
                return 1
            fi

            wget $SCHXSLT_URI -O "$SCHXSLT_CLI"
        fi

        if [ ! -f "$SCHXSLT_CLI" ]; then
            echo "Cannot perform schematron validation: download of SchXslt failed."
            return 1
        fi

        echo "Checking hash of schxslt cli jar"
        echo "$SCHEMATRON_SHA1SUM $SCHXSLT_CLI" > "$SCHXSLT_CLI.sha1sum"
        if [ "$(uname)" = "Darwin" ]; then
            if ! (sha1sum -c "$SCHXSLT_CLI.sha1sum" | grep -q OK); then
                echo "Verification of download failed."
                return 1;
            fi
        else
            if ! (sha1sum --check "$SCHXSLT_CLI.sha1sum"); then
                echo "Verification of download failed."
                return 1
            fi
        fi
        rm "$SCHXSLT_CLI.sha1sum"
    )
}
