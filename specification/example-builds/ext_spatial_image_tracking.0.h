/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <iostream>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized
XrSpace localSpace;   // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_LOCAL

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrEnumerateSpatialCapabilitiesEXT xrEnumerateSpatialCapabilitiesEXT; // previously initialized
PFN_xrEnumerateSpatialCapabilityComponentTypesEXT xrEnumerateSpatialCapabilityComponentTypesEXT; // previously initialized
PFN_xrEnumerateSpatialCapabilityFeaturesEXT xrEnumerateSpatialCapabilityFeaturesEXT; // previously initialized
PFN_xrEnumerateSpatialReferenceImageFormatsEXT xrEnumerateSpatialReferenceImageFormatsEXT; // previously initialized
PFN_xrCreateSpatialImageTrackingDatabaseAsyncEXT xrCreateSpatialImageTrackingDatabaseAsyncEXT; // previously initialized
PFN_xrDestroySpatialImageTrackingDatabaseEXT xrDestroySpatialImageTrackingDatabaseEXT; // previously initialized
PFN_xrCreateSpatialImageTrackingDatabaseCompleteEXT xrCreateSpatialImageTrackingDatabaseCompleteEXT; // previously initialized
PFN_xrPollFutureEXT xrPollFutureEXT; // previously initialized
PFN_xrCreateSpatialContextAsyncEXT xrCreateSpatialContextAsyncEXT; // previously initialized
PFN_xrCreateSpatialContextCompleteEXT xrCreateSpatialContextCompleteEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotCompleteEXT xrCreateSpatialDiscoverySnapshotCompleteEXT; // previously initialized
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT; // previously initialized
PFN_xrCreateSpatialEntityFromIdEXT xrCreateSpatialEntityFromIdEXT; // previously initialized
PFN_xrCreateSpatialUpdateSnapshotEXT xrCreateSpatialUpdateSnapshotEXT; // previously initialized
PFN_xrDestroySpatialEntityEXT xrDestroySpatialEntityEXT; // previously initialized
PFN_xrDestroySpatialContextEXT xrDestroySpatialContextEXT; // previously initialized
