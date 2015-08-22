#!/bin/bash

cd ~/du51-caf

# Turn off break on error to allow build process to run
set +e

############################################################
# BUILD FIND7                                              #
############################################################

# Turn on compiler caching
export USE_CCACHE=1
prebuilts/misc/linux-x86/ccache/ccache -M 85G

export USE_PREBUILT_CACHE=1
export DU_BUILD_TYPE=TEST

# Start build process
. build/envsetup.sh && time brunch find7

############################################################
# COPY ROM TO DU-Official FOLDER                           #
############################################################

set -e

# Copy build from /out folder to DU-Official folder
cp ~/du51-caf/out/target/product/find7/DU_find7_5*.zip ~/DU-Official/find7a

# espeak "find 7 build is done and copied over to the official folder."
# sleep .2
# espeak "clobbering and starting yuga build now."

# Remove the /out or make clobber
# rm -rf ~/du51-caf/out/target/product/find7
make clobber

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

echo -e "\n"

echo 'Build completed successfully and copied over to DU-Official!'

############################################################
# BUILD YUGA                                               #
############################################################
echo -e "\n"

cd ~/du51-caf

# Turn off break on error to allow build process to run
set +e

# Turn on compiler caching

export USE_CCACHE=1
prebuilts/misc/linux-x86/ccache/ccache -M 85G

export USE_PREBUILT_CACHE=1
export DU_BUILD_TYPE=TEST

# Start build process

. build/envsetup.sh && time brunch yuga

############################################################
# COPY ROM TO DU-OFFICIAL                                  #
############################################################

cp ~/du51-caf/out/target/product/yuga/DU_yuga_5*.zip ~/DU-Official/yuga

echo -e "\n"

echo 'Build completed successfully and copied over to /DU-Official, go have a drink.'

echo -e "\n"

echo 'Clobbering...'

echo -e "\n"

make clobber
# rm -rf ~/du51-caf/out/target/product/yuga

echo -e "\n"

echo 'Done.'

echo -e "\n"

# espeak "yuga build is done and copied over to the official folder."
# sleep .2
# espeak "everything is done now, go have a drink."

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
