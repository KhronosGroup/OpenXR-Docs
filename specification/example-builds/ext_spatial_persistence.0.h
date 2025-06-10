/*
** Copyright (c) 2017-2025, The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/
#include <algorithm>

XrInstance instance;  // previously initialized
XrSystemId systemId;  // previously initialized
XrSession session;    // previously initialized

// The function pointers are previously initialized using
// xrGetInstanceProcAddr.
PFN_xrEnumerateSpatialPersistenceScopesEXT xrEnumerateSpatialPersistenceScopesEXT; // previously initialized
PFN_xrCreateSpatialPersistenceContextAsyncEXT xrCreateSpatialPersistenceContextAsyncEXT; // previously initialized
PFN_xrCreateSpatialPersistenceContextCompleteEXT xrCreateSpatialPersistenceContextCompleteEXT; // previously initialized
PFN_xrDestroySpatialPersistenceContextEXT xrDestroySpatialPersistenceContextEXT; // previously initialized
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
