/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrSession session;
XrSpatialContextEXT spatialContext;
XrSpace localSpace;           // previously initialized, e.g. from
                              // XR_REFERENCE_SPACE_TYPE_LOCAL
XrTime predictedDisplayTime;  // previously initialized, e.g. from

PFN_xrCreateSpatialAnchorSpaceANDROID xrCreateSpatialAnchorSpaceANDROID;
