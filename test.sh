#!/bin/sh

# NOTE: you need to make this point to some build of osxalerter
ANSWER=`path-to-build/osxalerter.app/Contents/MacOS/osxalerter "hunt the wumpas?" "Hunter" "FoSho" "NoWay"`
if [ "$ANSWER" = "1" ]; then
  echo User picked FoSho
elif [ "$ANSWER" = "2" ]; then
  echo User picked NoWay
else
  echo Um, no idea. User forced quit?
fi

