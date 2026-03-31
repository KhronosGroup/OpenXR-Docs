/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

XrInstance  instance;   // Created at app startup.
XrFutureEXT future;     // Future used for async operations.
XrSpace     space;      // Basic space
XrTime      updateTime; // The current frame's predicted display time.
XrSpatialContextEXT spatialContext; // Created in the previous example

PFN_xrPollFutureEXT xrPollFutureEXT;
PFN_xrCreateSpatialDiscoverySnapshotAsyncEXT xrCreateSpatialDiscoverySnapshotAsyncEXT;
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
