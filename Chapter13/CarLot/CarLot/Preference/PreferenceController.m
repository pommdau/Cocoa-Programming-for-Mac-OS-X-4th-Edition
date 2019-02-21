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
    
    [self reloadFromPreferences];
}

- (id)init {
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (void)reloadFromPreferences {
    [colorWell setColor:[PreferenceController preferenceTableBackgroundColor]];
    [checkbox  setState:[PreferenceController preferenceEmptyDoc]];
}

- (IBAction)changeBackgroundColor:(id)sender {
    NSColor *color = [colorWell color];
    NSLog(@"Color changed:%@", color);
    [PreferenceController setPreferenceTableBackgroundColor:color];
}

- (IBAction)changeNewEmptyDoc:(id)sender {
    NSInteger state = [checkbox state];
    NSLog(@"Checkbox changed %ld", state);
    [PreferenceController setPreferenceEmptyDoc:state];
}

// 設定リセット
- (IBAction)resetPreferences:(id)sender
{
    NSArray *allDefaultKeys = [NSArray arrayWithObjects:BNRTableBackgroundColorKey, BNREmptyDocKey, nil];
    for (NSString *key in allDefaultKeys) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [self reloadFromPreferences];
}

// Userdefaultを編集するための、SetterやGetter
+ (NSColor *)preferenceTableBackgroundColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:BNRTableBackgroundColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

+ (void)setPreferenceTableBackgroundColor:(NSColor *)color {
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorAsData forKey:BNRTableBackgroundColorKey];
}

+ (BOOL)preferenceEmptyDoc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:BNREmptyDocKey];
}

+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc {
    [[NSUserDefaults standardUserDefaults] setBool:emptyDoc forKey:BNREmptyDocKey];
}

@end
