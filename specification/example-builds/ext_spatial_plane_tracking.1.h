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

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT; // previously initialized
PFN_xrCreateSpatialDiscoverySnapshotCompleteEXT xrCreateSpatialDiscoverySnapshotCompleteEXT; // previously initialized
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT; // previously initialized
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT; // previously initialized
PFN_xrPollFutureEXT xrPollFutureEXT; // previously initialized

bool supportsPolygon2DComponent;
bool supportsSemanticLabelComponent;

void waitUntilReady(XrFutureEXT future) {
  XrFuturePollInfoEXT pollInfo{XR_TYPE_FUTURE_POLL_INFO_EXT};
  XrFuturePollResultEXT pollResult{XR_TYPE_FUTURE_POLL_RESULT_EXT};
  pollInfo.future = future;
  do {
    // sleep(1);
    CHK_XR(xrPollFutureEXT(instance, &pollInfo, &pollResult));
  } while (pollResult.state != XR_FUTURE_STATE_READY_EXT);
}
