#!/bin/sh -e
#
# Copyright (c) 2019-2022, The Khronos Group Inc.
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# checkSchematron.sh - Validate the registry XML against the Schematron
# rules, using https://github.com/schxslt/schxslt/
#
# Usage: checkSchematron.sh

set -e
SCHEMATRON_VERSION=1.9.4
# from https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/1.9.4/cli-1.9.4.jar.sha1
SCHEMATRON_SHA1SUM=a94c5532487705fb42f09f11ae6d172caeaf7972
URL=https://repo1.maven.org/maven2/name/dmaus/schxslt/cli/$SCHEMATRON_VERSION/cli-$SCHEMATRON_VERSION.jar

SCHXSLT_CLI=registry/$(basename "$URL")

XML=registry/xr.xml
SCH=registry/registry.sch
REPORT=registry/report.srvl


(
    cd "$(dirname $0)"

    if ! command -v wget > /dev/null; then
        echo "Skipping schematron validation: no wget."
        exit 0
    fi

    if ! command -v java > /dev/null; then
        echo "Skipping schematron validation: no java."
        exit 0
    fi
    if ! command -v sha1sum > /dev/null; then
        echo "Skipping schematron validation: no sha1sum."
        exit 0
    fi

    if ! command -v grep > /dev/null; then
        echo "Skipping schematron validation: no grep. (!?)"
        exit 0
    fi

    if [ ! -f "$SCHXSLT_CLI" ]; then
        echo "Trying to download SchXslt..."
        wget $URL -O "$SCHXSLT_CLI" || true
    fi


    if [ ! -f "$SCHXSLT_CLI" ]; then
        echo "Skipping schematron validation: download of SchXslt failed."
        exit 0
    fi

    if ! (echo "$SCHEMATRON_SHA1SUM $SCHXSLT_CLI" | sha1sum --check); then
        echo "Verification of download failed."
        exit 0
    fi

    java -jar "$SCHXSLT_CLI" -d $XML -s $SCH -v -o $REPORT

    if grep -q "failed-assert>" $REPORT; then
        echo "Failed assert detected, exiting with error"
        exit 1
    fi

    exit 0
)
