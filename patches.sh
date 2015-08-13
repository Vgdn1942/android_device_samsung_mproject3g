#!/bin/bash

cd `dirname $0`
DSTDIR=$1

if [ -z "$DSTDIR" ]
then
    echo "Используйте: $0 <папка с исходниками>"
    exit 1
fi

red=$(tput setaf 1) # Red
grn=$(tput setaf 2) # Green
txtrst=$(tput sgr0) # Reset

# Отключение сборки WEBVIEWCHROMIUM при TARGET_PREBUILT_WEBVIEWCHROMIUM := yes
if
grep -rx 'TARGET_PREBUILT_WEBVIEWCHROMIUM := yes' $DSTDIR/device/samsung/mproject3g/BoardConfig.mk > /dev/null
then
if
echo "${grn}Патч 'libwebviewchromium'${txtrst}"
cat patches/libwebviewchromium.patch | patch -d $DSTDIR/frameworks/webview/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
echo "-----------------------"
else
echo "${red}Не применён!${txtrst}"
echo "-----------------------"
fi
if
echo "${grn}Патч 'libchromium_net'${txtrst}"
cat patches/libchromium_net.patch | patch -d $DSTDIR/external/chromium/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
echo "-----------------------"
else
echo "${red}Не применён!${txtrst}"
echo "-----------------------"
fi
if
echo "${grn}Патч 'libstagefright_chromium_http'${txtrst}"
cat patches/libstagefright_chromium_http.patch | patch -d $DSTDIR/frameworks/av/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
echo "-----------------------"
else
echo "${red}Не применён!${txtrst}"
echo "-----------------------"
fi
fi

# Исправление кнопки "Home" и виброотклика
if
echo "${grn}Патч 'Исправление виброотклика кнопок и MTP/PTP'${txtrst}"
cat patches/frameworks.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
echo "-----------------------"
else
echo "${red}Не применён!${txtrst}"
echo "-----------------------"
fi

#cd $DSTDIR

#git diff > x.patch
