//
//  PreferenceController.h
//  CarLot
//
//  Created by HIROKI IKEUCHI on 2019/02/21.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const BNRTableBackgroundColorKey;
extern NSString *const BNREmptyDocKey;

@interface PreferenceController : NSWindowController {
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkbox;
}

- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;

// Accesser的な…？
+ (NSColor *)preferenceTableBackgroundColor;
+ (void)setPreferenceTableBackgroundColor:(NSColor *)color;
+ (BOOL)preferenceEmptyDoc;
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc;

@end
