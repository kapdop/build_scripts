#!/bin/bash

############################################################
# BUILD THE ROM                                            #
############################################################

cd ~/du51-caf

# Turn on compiler caching

export USE_CCACHE=1
prebuilts/misc/linux-x86/ccache/ccache -M 85G

export USE_PREBUILT_CACHE=1
export DU_BUILD_TYPE=TEST

# Start build process

. build/envsetup.sh && lunch du_yuga-userdebug
time make -j16 bacon

############################################################
# COPY ROM TO DU-OFFICIAL                                  #
############################################################

cp ~/du51-caf/out/target/product/yuga/DU_yuga_5*.zip ~/DU-Official/yuga
# rm -rf ~/du51-caf/out/target/product/yuga
make clobber

echo -e "\n"

echo 'Build completed successfully and copied over to /DU-Official.'

# Notify user of success

beep -f 784 -r 3 -l 100
sleep .1
beep -f 784 -l 600
beep -f 622 -l 600
beep -f 698 -l 600
beep -f 784 -l 200
sleep .2
beep -f 698 -l 200
beep -f 784 -l 800

exit
