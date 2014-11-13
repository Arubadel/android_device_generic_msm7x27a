#ifndef ANDROID_GUI_SURFACE_COMPOSER_CLIENT_H
#define ANDROID_GUI_SURFACE_COMPOSER_CLIENT_H

#include <stdint.h>
#include <sys/types.h>

#include <binder/IBinder.h>
#include <binder/IMemory.h>

#include <utils/RefBase.h>
#include <utils/Singleton.h>
#include <utils/SortedVector.h>
#include <utils/threads.h>

#include <ui/FrameStats.h>
#include <ui/PixelFormat.h>

#include <gui/CpuConsumer.h>
#include <gui/SurfaceControl.h>

namespace android {

// ---------------------------------------------------------------------------

class DisplayInfo;
class Composer;
class ISurfaceComposerClient;
class IGraphicBufferProducer;
class Region;

// ---------------------------------------------------------------------------

class SurfaceComposerClient : public RefBase
{
    // Get the DisplayInfo for the currently-active configuration
    static status_t getDisplayInfo(const sp<IBinder>& display,
            DisplayInfo* info);

    // Get the index of the current active configuration (relative to the list
    // returned by getDisplayInfo)
    static int getActiveConfig(const sp<IBinder>& display);

    // Set a new active configuration using an index relative to the list
    // returned by getDisplayInfo
    static status_t setActiveConfig(const sp<IBinder>& display, int id);

    // Get a list of supported configurations for a given display
    static status_t getDisplayConfigs(const sp<IBinder>& display,
            Vector<DisplayInfo>* configs);

    // TODO: Remove me.  Do not use.
    // This is a compatibility shim for one product whose drivers are depending on
    // this legacy function (when they shouldn't).
    static status_t getDisplayInfo(int32_t displayId, DisplayInfo* info);


    //! Get the token for the existing default displays.
    //! Possible values for id are eDisplayIdMain and eDisplayIdHdmi.
    static sp<IBinder> getBuiltInDisplay(int32_t id);
};
// ---------------------------------------------------------------------------
}; // namespace android

#endif // ANDROID_GUI_SURFACE_COMPOSER_CLIENT_H
