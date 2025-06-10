/*
** Copyright (c) 2017-2025 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized
XrSpace localSpace;   // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_LOCAL
XrTime predictedDisplayTime; // previously initialized, e.g. from
                      // XrFrameState.predictedDisplayTime
XrSpatialContextEXT spatialContext; // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.

PFN_xrCreateSpatialAnchorEXT xrCreateSpatialAnchorEXT; // previously initialized
PFN_xrCreateSpatialUpdateSnapshotEXT xrCreateSpatialUpdateSnapshotEXT; // previously initialized
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT; // previously initialized
PFN_xrDestroySpatialEntityEXT xrDestroySpatialEntityEXT; // previously initialized
