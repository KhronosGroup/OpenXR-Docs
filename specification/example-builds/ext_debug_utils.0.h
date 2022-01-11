/*
** Copyright (c) 2017-2022, The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
*/

#include <openxr/openxr.h>

XrBool32
myOutputDebugString(XrDebugUtilsMessageSeverityFlagsEXT messageSeverity,
                    XrDebugUtilsMessageTypeFlagsEXT messageType,
                    const XrDebugUtilsMessengerCallbackDataEXT *callbackData,
                    void *userData) {
  return XR_FALSE;
}

XrBool32
myDebugBreak(XrDebugUtilsMessageSeverityFlagsEXT messageSeverity,
                    XrDebugUtilsMessageTypeFlagsEXT messageType,
                    const XrDebugUtilsMessengerCallbackDataEXT *callbackData,
                    void *userData) {
  return XR_FALSE;
}

XrBool32
myStdOutLogger(XrDebugUtilsMessageSeverityFlagsEXT messageSeverity,
                    XrDebugUtilsMessageTypeFlagsEXT messageType,
                    const XrDebugUtilsMessengerCallbackDataEXT *callbackData,
                    void *userData) {
  return XR_FALSE;
}
