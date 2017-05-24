#!/bin/sh

xcodebuild -project JDropDownAlert.xcodeproj -scheme ifAction -destination 'platform=iOS Simulator,name=iPhone 7' build-for-testing test | xcpretty

