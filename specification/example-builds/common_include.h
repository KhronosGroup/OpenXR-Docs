/*
** Copyright (c) 2017-2025 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

/* Included in all extracted example code when building the build-examples target. */

/* If there is a header matching the name of the extracted source in this directory,
 * it will also be included.
 */

#include <openxr/openxr.h>

#ifdef __cplusplus
#include <memory>
#include <vector>
#include <array>
#else
#include <stdbool.h>
#endif

#include <string.h>

extern volatile bool quit;

#define CHK_XR(r) if(XR_FAILED(r)) { /*handle XrResult errors*/ }

#ifdef __cplusplus
inline void do_something(const XrPosef& pose) {}
inline void do_something(const XrVector3f& vector3) {}
inline void do_something(const XrQuaternionf& quaternion) {}
#else
#define do_something(X)
#endif
