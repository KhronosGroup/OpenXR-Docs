/*
** Copyright (c) 2017-2025, The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized
XrSpace localSpace;   // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_LOCAL
XrSpace viewSpace;    // previously initialized, e.g. from
                      // XR_REFERENCE_SPACE_TYPE_VIEW


// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrEnumerateSpatialCapabilitiesEXT xrEnumerateSpatialCapabilitiesEXT; // previously initialized
PFN_xrEnumerateSpatialCapabilityFeaturesEXT xrEnumerateSpatialCapabilityFeaturesEXT; // previously initialized.
PFN_xrCreateSpatialContextAsyncEXT xrCreateSpatialContextAsyncEXT; // previously initialized
PFN_xrCreateSpatialContextCompleteEXT xrCreateSpatialContextCompleteEXT; // previously initialized
PFN_xrDestroySpatialContextEXT xrDestroySpatialContextEXT; // previously initialized
PFN_xrPollFutureEXT xrPollFutureEXT; // previously initialized

void waitUntilReady(XrFutureEXT future) {
  XrFuturePollInfoEXT pollInfo{XR_TYPE_FUTURE_POLL_INFO_EXT};
  XrFuturePollResultEXT pollResult{XR_TYPE_FUTURE_POLL_RESULT_EXT};
  pollInfo.future = future;
  do {
    // sleep(1);
    CHK_XR(xrPollFutureEXT(instance, &pollInfo, &pollResult));
  } while (pollResult.state != XR_FUTURE_STATE_READY_EXT);
}
