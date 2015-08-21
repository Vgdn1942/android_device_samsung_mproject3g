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

# Библиотека liblights
if
echo "${grn}Патч 'liblights'${txtrst}"
cat patches/lights.patch | patch -d $DSTDIR/hardware/samsung/ -p1 -N -r -
then
echo "${grn}Применён успешно!${txtrst}"
echo "-----------------------"
else
echo "${red}Не применён!${txtrst}"
echo "-----------------------"
fi

cd $DSTDIR

#git diff > x.patch
