/*
** Copyright (c) 2017-2026 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <vector>

XrInstance instance; // Created at app startup.
XrSpace viewSpace;   // Basic view space
XrTime updateTime;   // The current frame's predicted display time.
XrSpatialContextEXT spatialContext;        // Created at the first example
XrSpatialRaycastInfoANDROID raycastInfo; // Created at the previous example

// The function pointers are previously initialized using xrGetInstanceProcAddr.
PFN_xrCreateSpatialRaycastSnapshotANDROID xrCreateSpatialRaycastSnapshotANDROID;
PFN_xrDestroySpatialSnapshotEXT xrDestroySpatialSnapshotEXT;
PFN_xrPollFutureEXT xrPollFutureEXT;

void waitUntilReady(XrFutureEXT future) {
  XrFuturePollInfoEXT pollInfo{XR_TYPE_FUTURE_POLL_INFO_EXT};
  XrFuturePollResultEXT pollResult{XR_TYPE_FUTURE_POLL_RESULT_EXT};
  pollInfo.future = future;
  do {
    // sleep(1);
    CHK_XR(xrPollFutureEXT(instance, &pollInfo, &pollResult));
  } while (pollResult.state != XR_FUTURE_STATE_READY_EXT);
}
