#include <mach/mach_time.h> // for mac specific timing code
#include <Carbon/Carbon.h>
#include <Carbon/Carbon.h> /* For kVK_ constants, and TIS functions. */
#include <CoreFoundation/CFBundle.h>
#include <CoreFoundation/CoreFoundation.h>
#include <ApplicationServices/ApplicationServices.h>

#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libswscale/swscale.h>

#include <ipp.h>
#include <ippcc.h>
#include <ippcore.h>
#include <ippcv.h>
#include <ippdefs.h>
#include <ippi.h>

#include <FreeImage.h>
