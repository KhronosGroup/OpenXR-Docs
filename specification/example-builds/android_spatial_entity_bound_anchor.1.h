/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrSpatialContextEXT spatialContext; // Will be created with capabilities
XrSpace localSpace;   // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_LOCAL

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrCreateSpatialUpdateSnapshotEXT xrCreateSpatialUpdateSnapshotEXT; // previously initialized
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT; // previously initialized
