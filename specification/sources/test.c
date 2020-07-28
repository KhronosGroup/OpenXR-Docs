/*% gcc -Wall -I.. -c test.c
 * Tiny test to make sure regenerated openxr.h compiles.
 * If this code is actually run, it just prints out some enum
 * values and possibly complains about some type conversions.
 *
 * Copyright 2017-2020, The Khronos Group Inc.
 * SPDX-License-Identifier: Apache-2.0
 *
 */
#include <stdio.h>

#ifdef _WIN32
#define NOMINMAX
#include <windows.h>
#define XR_USE_PLATFORM_WIN32 1
#else
#include <time.h>
#define XR_USE_TIMESPEC 1
typedef struct timespec timespec;
#endif

#include "openxr/openxr.h"
#include "openxr/openxr_platform.h"
#include "openxr/openxr_reflection.h"

int main(int ac, const char **av) {
    XrStructureType type = XR_TYPE_SYSTEM_PROPERTIES;
    XrResult result = XR_SUCCESS;

    result = XR_ERROR_OUT_OF_MEMORY;

    printf("XR_TYPE_SYSTEM_PROPERTIES = 0x%08x\n",
            (unsigned int)type );
    printf("XR_ERROR_OUT_OF_MEMORY = 0x%08x\n",
            (unsigned int)result);

#define sizeit(t, e) +sizeof(t)
    size_t total_size = 0 + XR_LIST_STRUCTURE_TYPES(sizeit);

    printf("sum of all struct sizes = 0x%08x\n", (unsigned int)total_size);

#define names(t, e) #t " = " #e " (%d)\n"
#define values(t, e) , (unsigned int)(e)
    printf(XR_LIST_STRUCTURE_TYPES(names) XR_LIST_STRUCTURE_TYPES(values));

    return 0;
}
