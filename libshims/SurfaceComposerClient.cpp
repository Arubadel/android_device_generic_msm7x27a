#define LOG_TAG "SurfaceComposerClient"

#include <stdint.h>
#include <sys/types.h>

#include <utils/Errors.h>
#include <utils/Log.h>
#include <utils/Singleton.h>
#include <utils/SortedVector.h>
#include <utils/String8.h>
#include <utils/threads.h>

#include <binder/IMemory.h>
#include <binder/IServiceManager.h>

#include <ui/DisplayInfo.h>

#include <gui/CpuConsumer.h>
#include <gui/IGraphicBufferProducer.h>
#include <gui/ISurfaceComposer.h>
#include <gui/ISurfaceComposerClient.h>
#include "SurfaceComposerClient.h"

#include <private/gui/ComposerService.h>
#include <private/gui/LayerState.h>

namespace android {

class Composer : public Singleton<Composer>
{
    friend class Singleton<Composer>;

public:
    sp<IBinder> getBuiltInDisplay(int32_t id);

};

ANDROID_SINGLETON_STATIC_INSTANCE(Composer);

status_t SurfaceComposerClient::getDisplayInfo(const sp<IBinder>& display,
        DisplayInfo* info) {
    Vector<DisplayInfo> configs;
    status_t result = getDisplayConfigs(display, &configs);
    if (result != NO_ERROR) {
        return result;
    }

    int activeId = getActiveConfig(display);
    if (activeId < 0) {
        ALOGE("No active configuration found");
        return NAME_NOT_FOUND;
    }

    *info = configs[static_cast<size_t>(activeId)];
    return NO_ERROR;
}

sp<IBinder> Composer::getBuiltInDisplay(int32_t id) {
    return ComposerService::getComposerService()->getBuiltInDisplay(id);
}

sp<IBinder> SurfaceComposerClient::getBuiltInDisplay(int32_t id) {
    return Composer::getInstance().getBuiltInDisplay(id);
}

/* TODO: Remove me.  Do not use.
 * This is a compatibility shim for one product whose drivers are depending on
 *this legacy function (when they shouldn't).*/
status_t SurfaceComposerClient::getDisplayInfo(
        int32_t displayId, DisplayInfo* info)
{
    return getDisplayInfo(getBuiltInDisplay(displayId), info);
}
// ----------------------------------------------------------------------------
}; // namespace android

