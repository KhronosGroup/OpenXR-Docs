/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <vector>

XrInstance instance; // Created at app startup.
XrFutureEXT future;  // Future used for async operations.
XrTime updateTime;   // The current frame's predicted display time.
XrSpace viewSpace;   // Basic view space
XrSpatialContextEXT spatialContext; // Created at the previous example

PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT;
PFN_xrPollFutureEXT xrPollFutureEXT;
PFN_xrCreateSpatialDiscoverySnapshotCompleteEXT xrCreateSpatialDiscoverySnapshotCompleteEXT;
PFN_xrQuerySpatialComponentDataEXT xrQuerySpatialComponentDataEXT;
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT;
PFN_xrCreateSpatialEntityFromIdEXT xrCreateSpatialEntityFromIdEXT;

void waitUntilReady(XrFutureEXT future) {
  XrFuturePollInfoEXT pollInfo{XR_TYPE_FUTURE_POLL_INFO_EXT};
  XrFuturePollResultEXT pollResult{XR_TYPE_FUTURE_POLL_RESULT_EXT};
  pollInfo.future = future;
  do {
    // sleep(1);
    CHK_XR(xrPollFutureEXT(instance, &pollInfo, &pollResult));
  } while (pollResult.state != XR_FUTURE_STATE_READY_EXT);
}
