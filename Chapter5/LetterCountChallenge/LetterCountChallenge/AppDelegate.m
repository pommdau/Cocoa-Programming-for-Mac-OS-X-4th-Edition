//
//  AppDelegate.m
//  LetterCountChallenge
//
//  Created by HIROKI IKEUCHI on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSTextField *countResult;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)countCharactersButtonPush:(id)sender {
    NSString *inputMessage = [_inputTextField stringValue];
    NSString *outputMessage = [NSString stringWithFormat:@"'%@' has %d characters", inputMessage, (int)inputMessage.length];
    [_countResult setStringValue:outputMessage];
}

@end
