OSXALERTER
==========

The point of these apps is to allow a command line app/script to present a simple alert.
Specifically this was written for the [native-msg-box npm module](http://www.npmjs.org/package/native-msg-box)

##Usage

    osxalert msg title button1 button2 button3 etc..

returns 1 - n depending on which button the user chose. 0 on error

##Example

    #!/bin/sh
    ANSWER=`osxalert "hunt the wumpas?" "Hunter" "FoSho" "NoWay"`
    if [ "$ANSWER" = "1" ]; then
      echo User picked FoSho
    elif [ "$ANSWER" = "2" ]; then
      echo User picked NoWay
    else
      echo Um, no idea. User forced quit?
    fi

##Why What Where?

native-msg-box originally used AppleScript but I started getting errors when used from
in certain situations.

##Changing the dialog icon

If there is a file with the name `icon.png` in the same folder as osxalert that file will
be used as the icon in the dialog. I don't know the limits of it's size but I suspect
it needs to be a power of 2 in size and 512 or less. In other words 512x512, 256x256, 32x32, etc...


