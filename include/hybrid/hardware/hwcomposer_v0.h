#ifndef ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_H
#error "This header should only be included by hardware/hwcomposer.h"
#endif

#ifndef ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_V0_H
#define ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_V0_H

struct hwc_composer_device;

typedef struct hwc_methods {

    int (*eventControl)(
            struct hwc_composer_device* dev, int event, int enabled);

} hwc_methods_t;

typedef struct hwc_layer {

    int32_t compositionType;
    uint32_t hints;
    uint32_t flags;

    union {
        hwc_color_t backgroundColor;

        struct {
            buffer_handle_t handle;
            uint32_t sourceTransform;
            uint32_t transform;
            int32_t blending;
            hwc_rect_t sourceCrop;
            hwc_rect_t displayFrame;
            hwc_region_t visibleRegionScreen;
        };
    };
} hwc_layer_t;

typedef struct hwc_layer_list {
    uint32_t flags;
    size_t numHwLayers;
    hwc_layer_t hwLayers[0];
} hwc_layer_list_t;

typedef struct hwc_composer_device {
    struct hw_device_t common;

    int (*prepare)(struct hwc_composer_device *dev, hwc_layer_list_t* list);

    int (*set)(struct hwc_composer_device *dev,
                hwc_display_t dpy,
                hwc_surface_t sur,
                hwc_layer_list_t* list);
    void (*dump)(struct hwc_composer_device* dev, char *buff, int buff_len);

    void (*registerProcs)(struct hwc_composer_device* dev,
            hwc_procs_t const* procs);

    int (*query)(struct hwc_composer_device* dev, int what, int* value);

    void* reserved_proc[4];

    hwc_methods_t const *methods;

} hwc_composer_device_t;

static inline int hwc_open(const struct hw_module_t* module,
        hwc_composer_device_t** device) {
    return module->methods->open(module,
            HWC_HARDWARE_COMPOSER, (struct hw_device_t**)device);
}

static inline int hwc_close(hwc_composer_device_t* device) {
    return device->common.close(&device->common);
}

#endif
