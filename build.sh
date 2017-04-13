#!/bin/bash
#
ROOT_PATH=$PWD
BUILD_PATH="$ROOT_PATH/app/build/outputs/apk/"
APP_NAME="Phonograph"

# Build app
./gradlew build

#sign and zipalign
java -jar sign.jar $BUILD_PATH/app-release-unsigned.apk
$ROOT_PATH/zipalign -f -v 4 $BUILD_PATH/app-release-unsigned.s.apk $ROOT_PATH/$APP_NAME-release.apk

# cleanup
./gradlew clean
