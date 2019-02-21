//
//  PreferenceController.m
//  CarLot
//
//  Created by HIROKI IKEUCHI on 2019/02/21.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "PreferenceController.h"

NSString *const BNRTableBackgroundColorKey = @"BNRTableBackgroundColor";
NSString *const BNREmptyDocKey             = @"BNREmptyDocumentFlag";

@interface PreferenceController ()

@end

@implementation PreferenceController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [super windowDidLoad];
    NSLog(@"Nib file is loaded");
}

- (id)init {
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (IBAction)changeBackgroundColor:(id)sender {
    NSColor *color = [colorWell color];
    NSLog(@"Color changed:%@", color);
}

- (IBAction)changeNewEmptyDoc:(id)sender {
    NSInteger state = [checkbox state];
    NSLog(@"Checkbox changed %ld", state);
}


@end
