#!/usr/bin/env bash
# Retake the homepage screenshots (chat, tree, settings).
# Needs: adb, a 1080x2424 emulator with Pathfinder installed, and the
# "What's this: github.com/resolveworks/pathfinder" session in Recents.
set -euo pipefail
cd "$(dirname "$0")/.."

adb shell am force-stop works.resolve.pathfinder
adb shell am start -n works.resolve.pathfinder/.MainActivity
sleep 3
adb exec-out screencap -p > static/screenshots/01.png   # chat, auto-scrolled to the latest answer
adb shell input tap 839 147 && sleep 1                  # tree tab
adb exec-out screencap -p > static/screenshots/02.png
adb shell input tap 74 147 && sleep 1                   # menu
adb shell input tap 861 137 && sleep 1                  # settings
adb exec-out screencap -p > static/screenshots/03.png
