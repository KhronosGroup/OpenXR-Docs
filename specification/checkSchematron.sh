#!/bin/sh -e
#
# Copyright (c) 2019-2023, The Khronos Group Inc.
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


(
    cd "$(dirname $0)"
    REGISTRY_DIR="./registry"
    export REGISTRY_DIR
    . $REGISTRY_DIR/schematron.sh

    if ! ensureSchXslt; then
        echo "Skipping schematron validation"
        exit 0
    fi

    runSchematron $REGISTRY_DIR/xr.xml
)
