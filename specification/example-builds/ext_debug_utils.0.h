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