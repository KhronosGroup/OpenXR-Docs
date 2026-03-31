/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrEnumerateSpatialCapabilitiesEXT xrEnumerateSpatialCapabilitiesEXT; // previously initialized
PFN_xrEnumerateSpatialCapabilityComponentTypesEXT xrEnumerateSpatialCapabilityComponentTypesEXT; // previously initialized
PFN_xrEnumerateSpatialAnchorAttachableComponentsANDROID xrEnumerateSpatialAnchorAttachableComponentsANDROID; // previously initialized
