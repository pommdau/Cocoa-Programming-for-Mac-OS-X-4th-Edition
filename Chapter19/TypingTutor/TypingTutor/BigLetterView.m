//
//  BigLetterView.m
//  TypingTutor
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bounds];
    
    // このビューはウィンドウのファーストレスポンダか
    if ([[self window] firstResponder] == self) {
        [[NSColor keyboardFocusIndicatorColor] set];
        [NSBezierPath setDefaultLineWidth:4.0];
        [NSBezierPath strokeRect:bounds];
    }
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        NSLog(@"Initializing view");
        bgColor = [NSColor yellowColor];
        inputCharacter = @"";
    }
    return self;
}

// Opaque:不透明な
- (BOOL)isOpaque {
    return YES;
}

// firstResponderになるためのメソッド
- (BOOL)acceptsFirstResponder {
    NSLog(@"Accepting");
    return YES;
}

- (BOOL)becomeFirstResponder {
    NSLog(@"Becoming");
    [self setNeedsDisplay:YES];
    return YES;
}

#pragma mark keyEvent methods
- (void)keyDown:(NSEvent *)event {
    [self interpretKeyEvents:[NSArray arrayWithObject:event]];
}

// interpretKeyEventsが呼び出すメソッドのoverride
- (void)insertText:(NSString *)input {
    // ユーザが入力した文字列をセットする
    [self setInputCharacter:input];
}

// Pushed Shift
- (void)insertTab:(id)sender {
    [[self window] selectKeyViewFollowingView:self];
}

// Pushed Shift + Tab
// ここは大文字と小文字の区別に注意
- (void)insertBacktab:(id)sender {
    [[self window] selectKeyViewPrecedingView:self];
}

// Pushed delete key
- (void)deleteBackward:(id)sender {
    [self setInputCharacter:@""];
}

#pragma mark Accessors
- (void)setBgColor:(NSColor *)c {
    bgColor = c;
    [self setNeedsDisplay:YES];
}

- (NSColor *)bgColor {
    return bgColor;
}

- (void)setInputCharacter:(NSString *)c {
    inputCharacter = c;
    NSLog(@"The string is now %@", c);
}

- (NSString *)inputCharacter {
    return inputCharacter;
}

@end
