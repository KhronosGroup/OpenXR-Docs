/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrInstance instance; // previously initialized
XrSystemId systemId; // previously initialized
XrSession session; // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrPollFutureEXT xrPollFutureEXT;
PFN_xrCheckVpsAvailabilityAsyncANDROID xrCheckVpsAvailabilityAsyncANDROID;
PFN_xrCheckVpsAvailabilityCompleteANDROID xrCheckVpsAvailabilityCompleteANDROID;
PFN_xrCreateGeospatialTrackerANDROID xrCreateGeospatialTrackerANDROID;
