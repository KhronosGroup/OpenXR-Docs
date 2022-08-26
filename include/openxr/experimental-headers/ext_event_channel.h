// Copyright (c) 2016-2022, The Khronos Group Inc.
//
// SPDX-License-Identifier: CC-BY-4.0

#pragma once

#include "openxr_extension_helpers.h"

/*

Last Modified Date :
    2022-08-18
IP Status :
    No known IP claims.
Contributors :
    Bryce Hutchings, Microsoft
    Yin Li, Microsoft
    Jonathan Wright, Meta Platforms
    Brandon Furtwangler, Meta Platforms
    Wenlin Mao, Meta Platforms
    Andreas Selvik, Meta Platforms
    John Schofield, Meta Platforms
Contacts :
    Cass Everitt, Meta Platforms
    Wenlin Mao, Meta Platforms
*/

#if defined(__cplusplus)
extern "C" {
#endif

// Extension 113
#ifndef XR_EXT_event_channel
#define XR_EXT_event_channel 1

#ifndef XR_EXT_event_channel_EXPERIMENTAL_VERSION
#define XR_EXT_event_channel_SPEC_VERSION 1
#define XR_EXT_event_channel_EXTENSION_NAME "XR_EXT_event_channel"
#elif XR_EXT_event_channel_EXPERIMENTAL_VERSION == 1
#define XR_EXT_event_channel_SPEC_VERSION 1
#define XR_EXT_event_channel_EXTENSION_NAME "XR_EXT1_event_channel"
#else
#error "unknown experimental version number for XR_EXT_event_channel_EXPERIMENTAL_VERSION"
#endif // XR_EXT_event_channel_EXPERIMENTAL_VERSION

/**
 * Overview
 *
 * The OpenXR 1.0 event model is very simple.
 * There is a single implicit event channel per instance, and the application
 * polls it for events via xrPollEvent.
 * This design is sufficient for limited use, but introduces extra burden on
 * modular application code making use of events for disparate purposes, as it
 * is the application's responsibility to route any events to the module or
 * modules that need to handle the event.
 * This extension expands on the OpenXR event model to add support for multiple
 * separate event channels.
 * These event channels are created and destroyed by the application, and they
 * can be polled independently.
 * Operations that generate events may also optionally allow the application
 * to specify the event channel where the events will be delivered.
 * If left unspecified, such events will be delivered to the explicitly defined
 * default event channel if it has been defined, otherwise to the implicit
 * per-instance event channel accessed by xrPollEvent.
*/

/**
 * XrEventChannelEXT is an independent event channel, which may be
 * polled independently from the implicit per-instance event channel used by
 * default.
 */
XR_DEFINE_HANDLE(XrEventChannelEXT)

/**
 * Create info structure contains no parameters beyond the conventional ones.
 */
XR_STRUCT_ENUM(XR_TYPE_EVENT_CHANNEL_CREATE_INFO_EXT, 1000170001);
typedef struct XrEventChannelCreateInfoEXT {
    XrStructureType type; // XR_TYPE_EVENT_CHANNEL_CREATE_INFO_EXT
    const void* XR_MAY_ALIAS next;
} XrEventChannelCreateInfoEXT;

/**
 * The XrEventChannelTargetEXT structure provides a means to append the
 * target event channel for an operation that can generate events
 */
XR_STRUCT_ENUM(XR_TYPE_EVENT_CHANNEL_TARGET_EXT, 1000170002);
typedef struct XrEventChannelTargetEXT {
    XrStructureType type; // XR_TYPE_EVENT_CHANNEL_TARGET_EXT
    const void* XR_MAY_ALIAS next;
    XrEventChannelEXT channel;
} XrEventChannelTargetEXT;

/**
 * The enum XrSelectEventChannelFlagsEXT reserved flags for future use
 * in select event channel.
 */
typedef enum XrSelectEventChannelFlagsEXT {
    // Reserved for future extensions.
} XrSelectEventChannelFlagsEXT;

/**
 * Info structure for xrSelectEventChannelEXT, contains all input
 * parameters for xrSelectEventChannelEXT to use
 */
XR_STRUCT_ENUM(XR_TYPE_SELECT_EVENT_CHANNEL_INFO_EXT, 1000170003);
typedef struct XrSelectEventChannelInfoEXT {
    XrStructureType type; // XR_TYPE_SELECT_EVENT_CHANNEL_INFO_EXT
    const void* XR_MAY_ALIAS next;
    XrSelectEventChannelFlagsEXT flags;
    XrDuration timeout;
    uint32_t eventChannelCount;
    const XrEventChannelEXT* eventChannels;
} XrSelectEventChannelInfoEXT;

#ifndef XR_NO_PROTOTYPES
#ifdef XR_EXTENSION_PROTOTYPES

/**
 * An application can create an XrEventChannelEXT handle using
 * xrCreateEventChannelEXT function.
 *
 *
 * @param instance is the XrInstance of the new event channel.
 * @param info points to an XrEventChannelCreateInfoEXT structure,
 * which contains no additional parameters beyond type and next pointer for
 * extensibility.
 * @param channel is a pointer to which the created XrEventChannelEXT
 * object is returned.
 * @return XR_ERROR_VALIDATION_FAILURE when
 * XrEventChannelCreateInfoEXT is invalid or the XrStructureType
 * is not XR_TYPE_EVENT_CHANNEL_CREATE_INFO_EXT.
 *
 * On success, XR_SUCCESS is returned
 */
XRAPI_ATTR XrResult XRAPI_CALL xrCreateEventChannelEXT(
    XrInstance instance,
    const XrEventChannelCreateInfoEXT* info,
    XrEventChannelEXT* channel);

/**
 * An application can destroy an XrEventChannelEXT handle using
 * xrDestroyEventChannelEXT function.
 *
 * Pending or future events assigned to this channel are inaccessible after its
 * destruction.
 *
 *
 * @param channel is the XrEventChannelEXT to be destroyed.
 * @return XR_ERROR_RUNTIME_FAILURE for runtime failures.
 *
 * On success, XR_SUCCESS is returned
 */
XRAPI_ATTR XrResult XRAPI_CALL xrDestroyEventChannelEXT(XrEventChannelEXT channel);

/**
 * Poll events from specific event channel with XrEventChannelEXT handle
 * passed in.
 * Same semantics as xrPollEvent.
 *
 *
 * @param channel is the XrEventChannelEXT to be polled.
 * @param eventData is a pointer to a valid XrEventDataBuffer.
 * @return XR_ERROR_VALIDATION_FAILURE when
 * XrEventDataBuffer is missing or type is not
 * XR_TYPE_EVENT_DATA_BUFFER.
 *
 * On success, XR_SUCCESS is returned
 */
XRAPI_ATTR XrResult XRAPI_CALL
xrPollEventChannelEXT(XrEventChannelEXT channel, XrEventDataBuffer* eventData);

/**
 * Multiple XrEventChannelEXT can be checked for available events, and
 * the application may choose to block for a specified duration waiting
 * specified in XrSelectEventChannelInfoEXT for events to be enqueued.
 *
 * No order is specified when multiple channels have events enqueued.
 *
 *
 * @param channel is the XrEventChannelEXT to be polled.
 * @param eventData is a pointer to a valid XrEventDataBuffer.
 * @return On success, XR_SUCCESS is returned, and channelWithEvent is set to the
 * index of the corresponding element of eventChannels in
 * XrSelectEventChannelInfoEXT.
 *
 * On timeout, XR_TIMEOUT_EXPIRED is returned, and channelWithEvent is
 * unmodified.
 *
 * Return XR_ERROR_RUNTIME_FAILURE for other runtime failures.
 */
XRAPI_ATTR XrResult XRAPI_CALL xrSelectEventChannelEXT(
    XrInstance instance,
    XrSelectEventChannelInfoEXT* info,
    uint32_t* channelWithEvent);

/**
 * After xrSetDefaultEventChannelEXT has been successfully called, the
 * runtime must redirect any existing or future queued events from the
 * XrInstance's event queue to the specified event channel.
 *
 *
 * @param channel is the XrEventChannelEXT to be polled.
 * @param eventData is a pointer to a valid XrEventDataBuffer.
 * @return XR_ERROR_LIMIT_REACHED when xrSetDefaultEventChannelEXT is called more than once.
 *
 * On success, XR_SUCCESS is returned
 */
XRAPI_ATTR XrResult XRAPI_CALL
xrSetDefaultEventChannelEXT(XrInstance instance, XrEventChannelEXT channel);

#endif /* XR_EXTENSION_PROTOTYPES */
#endif /* !XR_NO_PROTOTYPES */

typedef XrResult(XRAPI_PTR* PFN_xrCreateEventChannelEXT)(
    XrInstance instance,
    const XrEventChannelCreateInfoEXT* info,
    XrEventChannelEXT* channel);

typedef XrResult(XRAPI_PTR* PFN_xrDestroyEventChannelEXT)(XrEventChannelEXT channel);

typedef XrResult(
    XRAPI_PTR* PFN_xrPollEventChannelEXT)(XrEventChannelEXT channel, XrEventDataBuffer* eventData);

typedef XrResult(XRAPI_PTR* PFN_xrSelectEventChannelEXT)(
    XrInstance instance,
    XrSelectEventChannelInfoEXT* info,
    uint32_t* channelWithEvent);

typedef XrResult(
    XRAPI_PTR* PFN_xrSetDefaultEventChannelEXT)(XrInstance instance, XrEventChannelEXT channel);
#endif // XR_EXT_event_channel
#ifdef __cplusplus
}
#endif
