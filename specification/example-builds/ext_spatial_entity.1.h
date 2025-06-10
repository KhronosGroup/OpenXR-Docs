/*
** Copyright (c) 2017-2025 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrSpatialSnapshotEXT snapshot; // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrGetSpatialBufferVector3fEXT xrGetSpatialBufferVector3fEXT; // previously initialized
