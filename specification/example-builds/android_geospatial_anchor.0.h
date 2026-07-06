/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrInstance instance; // previously initialized
XrSession session; // previously initialized
XrGeospatialTrackerANDROID geospatialTracker; // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrPollFutureEXT xrPollFutureEXT;
PFN_xrCreateSpatialContextAsyncEXT xrCreateSpatialContextAsyncEXT;
PFN_xrCreateSpatialContextCompleteEXT xrCreateSpatialContextCompleteEXT;
PFN_xrCreateSurfaceAnchorAsyncANDROID xrCreateSurfaceAnchorAsyncANDROID;
PFN_xrCreateSurfaceAnchorCompleteANDROID xrCreateSurfaceAnchorCompleteANDROID;
