#!/bin/bash
#
ROOT_PATH=$PWD
BUILD_PATH="$ROOT_PATH/app/build/outputs/apk/release"
APP_NAME="Phonograph"

# Build app
./gradlew assembleRelease

#sign and zipalign
java -jar sign.jar $BUILD_PATH/app-release-unsigned.apk
$ROOT_PATH/zipalign -f -v 4 $BUILD_PATH/app-release-unsigned.s.apk $ROOT_PATH/$APP_NAME-mod.apk

# cleanup
./gradlew clean
