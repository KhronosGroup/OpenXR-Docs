/*
** Copyright (c) 2017-2025 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

#include <mutex>
#include <thread>

/*****************************************/
/* Slow Foo extension definition */
/*****************************************/
// extends struct XrFutureCompletionBaseHeader using "parentstruct"
typedef struct XrSlowFooCompletionEXT {
  XrStructureType       type;
  void* XR_MAY_ALIAS    next;
  XrResult              futureResult;
  float                 foo;
} XrSlowFooCompletionEXT;
#define XR_TYPE_SLOW_FOO_COMPLETION_EXT ((XrStructureType) 1100092005U)

typedef struct XrSlowFooInfoEXT {
  XrStructureType       type;
  void* XR_MAY_ALIAS    next;
} XrSlowFooInfoEXT;
#define XR_TYPE_SLOW_FOO_INFO_EXT ((XrStructureType) 1100092006U)

typedef XrResult (XRAPI_PTR *PFN_xrSlowFooAsyncEXT)(XrSession session, XrSlowFooInfoEXT slowFooInfo, XrFutureEXT* future);
typedef XrResult (XRAPI_PTR *PFN_xrSlowFooCompleteEXT)(XrSession session, XrFutureEXT future, XrSlowFooCompletionEXT* completion);


PFN_xrSlowFooAsyncEXT xrSlowFooAsyncEXT;       // previously initialized
PFN_xrSlowFooCompleteEXT xrSlowFooCompleteEXT; // previously initialized
PFN_xrPollFutureEXT xrPollFutureEXT;           // previously initialized
PFN_xrCancelFutureEXT xrCancelFutureEXT;       // previously initialized
XrInstance instance;                           // previously initialized
XrSession session;                             // previously initialized
