//
//  AppDelegate.h
//  SpeakLine
//
//  Created by HIROKI IKEUCHI on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSTextField *textField;
@property NSSpeechSynthesizer *speechSynth; // インスタンス変数ではなくプロパティで作成する
@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet NSButton *stopButton;
- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt :(id)sender;

@end

