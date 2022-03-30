#!/bin/sh

version="$MARKETING_VERSION" #($CURRENT_PROJECT_VERSION)"
settingsRootPlist="Settings.bundle/Root.plist"
/usr/libexec/PlistBuddy -c "Set PreferenceSpecifiers:1:DefaultValue $version" "$CODESIGNING_FOLDER_PATH/$settingsRootPlist"
/usr/libexec/PlistBuddy -c "Set PreferenceSpecifiers:1:DefaultValue $version" "${PROJECT_DIR}/${TARGET_NAME}/Resources/$settingsRootPlist"
