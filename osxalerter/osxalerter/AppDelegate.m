//
//  AppDelegate.m
//  osxalerter
//
//  Created by Gregg Tavares on 11/20/14.
//  Copyright (c) 2014 Greggman. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [_window makeKeyAndOrderFront:self];
    [[NSRunningApplication currentApplication] activateWithOptions:0];
    [[NSRunningApplication currentApplication] activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
    NSArray *args = [[NSProcessInfo processInfo] arguments];
    for (int ii = 0; ii < args.count; ++ii) {
        NSLog(@"%d: %@", ii, args[ii]);
    }
    NSString *msg  = args.count > 1 ? args[1] : @"?";
    NSString *info = args.count > 2 ? args[2] : @"?";
    
    @autoreleasepool {
        NSAlert *alert = [[NSAlert alloc] init];
        for (int ii = 3; ii < args.count; ++ii) {
            [alert addButtonWithTitle:args[ii]];
        }
        [alert setMessageText:msg];
        [alert setInformativeText:info];
        [alert setAlertStyle:NSWarningAlertStyle];
        
        NSModalResponse r = [alert runModal];
        int result = 0;
        switch (r) {
            case NSAlertFirstButtonReturn:
                result = 1;
                break;
            case NSAlertSecondButtonReturn:
                result = 2;
                break;
            case NSAlertThirdButtonReturn:
                result = 3;
                break;
            default:
                result = 0;
                break;
        }
        printf("%d\n", result);
    }
    [NSApp terminate:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
