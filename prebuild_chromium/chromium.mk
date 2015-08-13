# Webviewchromium
LOCAL_PATH := device/samsung/mproject3g

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuild_chromium/libwebviewchromium.so:system/lib/libwebviewchromium.so \
    $(LOCAL_PATH)/prebuild_chromium/libchromium_net.so:system/lib/libchromium_net.so \
    $(LOCAL_PATH)/prebuild_chromium/libstagefright_chromium_http.so:system/lib/libstagefright_chromium_http.so
