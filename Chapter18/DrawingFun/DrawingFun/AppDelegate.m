//
//  AppDelegate.m
//  DrawingFun
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"
#import "StretchView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showOpenPanel:(id)sender {
    __block NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSImage imageTypes]];
    
    [panel beginSheetModalForWindow:[stretchView window]
                  completionHandler:^(NSModalResponse result) {
                      if (result == NSModalResponseOK) {
                          NSImage *image = [[NSImage alloc] initWithContentsOfURL:[panel URL]];
                          [self->stretchView setImage:image];
                      }
                  }];
    
}

@end
