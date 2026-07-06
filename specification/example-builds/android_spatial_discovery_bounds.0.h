/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized
XrSpace viewSpace;    // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_VIEW
XrTime predictedDisplayTime; // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrEnumerateSpatialCapabilityFeaturesEXT xrEnumerateSpatialCapabilityFeaturesEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT; // previously initialized
