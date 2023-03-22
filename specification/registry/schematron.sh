#!/bin/sh -e
#
# Copyright (c) 2019-2023, The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0

# This file contains functions for running schxslt and getting a useful exit code,
# as well as downloading/verifying it on-demand.
# You must set and export REGISTRY_DIR before sourcing.

set -e
SCHEMATRON_VERSION=1.9.4
# from https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/1.9.4/cli-1.9.4.jar.sha1
export SCHEMATRON_SHA1SUM=a94c5532487705fb42f09f11ae6d172caeaf7972
export SCHXSLT_URI=https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/$SCHEMATRON_VERSION/cli-$SCHEMATRON_VERSION.jar

REGISTRY_DIR=$(cd "$REGISTRY_DIR" && pwd)

SCHXSLT_CLI=$REGISTRY_DIR/$(basename "$SCHXSLT_URI")
export SCHXSLT_CLI


export SCH="$REGISTRY_DIR/registry.sch"

makeSchematronReport() {
    java -jar "$SCHXSLT_CLI" -d "$1" -s "$SCH" -v -o "$1.srvl"
}

runSchematron() {
    makeSchematronReport "$1"
    if [ -f "$1.srvl" ]; then
        if grep -q "failed-assert>" "$1.srvl" > /dev/null; then
            return 1
        fi
    else
        echo "**** ERROR Invalid XML file: $1" 1>&2
        exit 1
    fi
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
        if ! (echo "$SCHEMATRON_SHA1SUM $SCHXSLT_CLI" | sha1sum --check); then
            echo "Verification of download failed."
            return 1
        fi
    )
}
