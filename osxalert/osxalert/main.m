//
//  main.m
//  osxalert
//
//  Created by Gregg Tavares on 11/20/14.
//  Copyright (c) 2014 Greggman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    
    NSString *msg  = [[NSString alloc] initWithUTF8String:(argc > 1 ? argv[1] : "")];
    NSString *info = [[NSString alloc] initWithUTF8String:(argc > 2 ? argv[2] : "")];
    
    @autoreleasepool {
        NSAlert *alert = [[NSAlert alloc] init];
        for (int ii = 3; ii < argc; ++ii) {
          [alert addButtonWithTitle:[[NSString alloc] initWithUTF8String:(argv[ii])]];
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
    return 0;
}
