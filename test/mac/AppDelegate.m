//
//  AppDelegate.m
//  tp-mac
//
//  Created by ljatsh on 2018/9/10.
//  Copyright © 2018 gyp. All rights reserved.
//

#import "AppDelegate.h"
#include "../test.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSLog(@"Hello, I'm running.");

    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];

    run_test([resourcePath UTF8String]);
    NSLog(@"Test Ended");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
