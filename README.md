OSXALERTER
==========

The point of these apps is to allow a command line app/script to present a simple alert.
Specifically this was written for the [native-msg-box npm module](http://www.npmjs.org/package/native-msg-box)

##Usage

    osxalerter.app/Contents/MacOS/osxalerter msg title button1 button2 button3 etc..

returns 1 - n depending on which button the user chose. 0 on error

##Example

    #!/bin/sh
    ANSWER=`osxalerter.app/Contents/MacOS/osxalerter "hunt the wumpas?" "Hunter" "FoSho" "NoWay"`
    if [ "$ANSWER" = "1" ]; then
      echo User picked FoSho
    elif [ "$ANSWER" = "2" ]; then
      echo User picked NoWay
    else
      echo Um, no idea. User forced quit?
    fi

##Why What Where?

native-msg-box originally used AppleScript but I started getting errors when used from
in certain situations. My first attempt was a simple OSX command line app which is
in the `osxalert` folder. The problem with that was (a) the window would appear under
the apps that were calling it and (b) there was no way to find that window because
there was no dock icon. The only way to find it was to minimize all other windows.

The next solution was to make a complete OSX app package. That solved the issue of
no dock icon and making sure the window came to the front but I couldn't get it
not to require a main window.

I could possible fix that issue by making my own dialog in that main window and
not using `NSAlert` but it works I needed to move on. Maybe I'll revisit later.


