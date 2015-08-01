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

#echo "${red}Linaro patches${txtrst}"
#sh patches/linaro/patch.sh $DSTDIR

#echo "${red}Prebuilt Chromium patches${txtrst}"
#sh patches/prebuilt_chromium/patch.sh $DSTDIR

# Исправление кнопки "Home" и виброотклика
if
echo "${grn}Патч 'Исправление виброотклика кнопок'${txtrst}"
cat patches/frameworks.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
else
echo "${red}Не применён!${txtrst}"
fi

cd $DSTDIR

#git diff > x.patch
