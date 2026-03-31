/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrInstance instance; // Created at app startup.
XrSystemId systemId; // Created at app startup.
XrSession session;   // Created at app startup.
XrFutureEXT future;  // Future used for async operations.
XrSpatialContextEXT spatialContext; // Will be created with capabilities

PFN_xrEnumerateSpatialCapabilitiesEXT xrEnumerateSpatialCapabilitiesEXT;
PFN_xrEnumerateSpatialCapabilityComponentTypesEXT xrEnumerateSpatialCapabilityComponentTypesEXT;
PFN_xrCreateSpatialContextAsyncEXT xrCreateSpatialContextAsyncEXT;
PFN_xrCreateSpatialContextCompleteEXT xrCreateSpatialContextCompleteEXT;
