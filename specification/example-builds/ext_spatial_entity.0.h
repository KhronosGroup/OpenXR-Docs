/*
** Copyright (c) 2017-2025 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized
XrSpace localSpace;   // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_LOCAL

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrCreateSpatialContextAsyncEXT xrCreateSpatialContextAsyncEXT; // previously initialized
PFN_xrCreateSpatialContextCompleteEXT xrCreateSpatialContextCompleteEXT; // previously initialized
PFN_xrDestroySpatialContextEXT xrDestroySpatialContextEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotCompleteEXT xrCreateSpatialDiscoverySnapshotCompleteEXT; // previously initialized
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT; // previously initialized
PFN_xrPollFutureEXT xrPollFutureEXT; // previously initialized
