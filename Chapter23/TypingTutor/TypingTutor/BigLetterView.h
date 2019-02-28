//
//  BigLetterView.h
//  TypingTutor
//
//  Created by Adam Preble on 9/21/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView {
	NSColor *bgColor;
	NSString *string;
    NSMutableDictionary *attributes;    // フォント属性のDictionaryを保持する
    BOOL isBold;
    BOOL isItalic;
    NSEvent *mouseDownEvent;    // mouseDownイベントを保持するためのインスタンス変数
}
- (void)prepareAttributes;  // prepare attributes, font and fontColor
@property (strong) NSColor *bgColor;
@property (copy) NSString *string;
- (IBAction)toggleBold:(NSButton *)sender;
- (IBAction)toggleItalic:(NSButton *)sender;

#pragma mark Pasteboard method
- (IBAction)cut  :(id)sender;
- (IBAction)copy :(id)sender;
- (IBAction)paste:(id)sender;
@end
