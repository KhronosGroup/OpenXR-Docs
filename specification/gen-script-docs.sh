#!/bin/sh
# Copyright (c) 2019-2022, The Khronos Group Inc.
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
#
# SPDX-License-Identifier: Apache-2.0

# Generate documentation for the python scripts in this repo, using pdoc3:
# https://pdoc3.github.io/pdoc/
#
# Output is under out/python-docs

set -e

# Pipe in some paths. We'll convert them to module names and document them.
pathsToDocs() {
    grep -v "test_" | \
    grep -v "__init__.py" | \
    sed -e 's/[.]py//' -e 's:/:.:g' | \
    xargs --verbose pdoc3 --html --force --output-dir $1
}

# Main body of script
(
    cd $(dirname $0)
    SPECDIR=$(pwd)
    ROOT=$(cd .. && pwd)
    OUTDIR=$(pwd)/out/python-docs
    mkdir -p $OUTDIR
    cp scripts/__init__.py.docs scripts/__init__.py
    export PYTHONPATH=${SPECDIR}/scripts:${ROOT}:${ROOT}/src/scripts
    (
        # # scripts under specification
        cd $SPECDIR/scripts
        ls *.py

        # Generate the index files
        echo "scripts"
        echo "scripts.spec_tools"
        echo "src.scripts"

        # scripts under src
        cd ${ROOT}/src/scripts
        find * -name "*.py"
    ) | pathsToDocs $OUTDIR

    # Move index files to a more useful place, fixing links as required
    sed 's:../src/scripts/index.html:index.src.scripts.html:g' $OUTDIR/scripts/index.html > $OUTDIR/index.html
    rm -rf $OUTDIR/spec_tools
    mv $OUTDIR/scripts/spec_tools $OUTDIR/spec_tools
    mv $OUTDIR/src/scripts/index.html $OUTDIR/index.src.scripts.html
    # delete duplicate generated files
    rm -rf $OUTDIR/scripts $OUTDIR/src

    rm -f scripts/__init__.py
)
