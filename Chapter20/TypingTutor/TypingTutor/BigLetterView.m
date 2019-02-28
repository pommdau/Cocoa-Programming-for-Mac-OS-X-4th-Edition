//
//  BigLetterView.m
//  TypingTutor
//
//  Created by Adam Preble on 9/21/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initializing view");
        [self prepareAttributes];   // 表示するフォントの属性を設定する
        bgColor = [NSColor yellowColor];
        string = @" ";
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	NSRect bounds = [self bounds];
	[bgColor set];
	[NSBezierPath fillRect:bounds];
    
    [self drawStringCenteredIn:bounds]; // 文字の描画
    
	// Am I the window's first responder?
	if (([[self window] firstResponder] == self) &&
		[NSGraphicsContext currentContextDrawingToScreen])
	{
		[NSGraphicsContext saveGraphicsState];
		NSSetFocusRingStyle(NSFocusRingOnly);
		[NSBezierPath fillRect:bounds];
		[NSGraphicsContext restoreGraphicsState];
	}
}

// prepare attributes, font and fontColor
- (void)prepareAttributes {
    attributes = [NSMutableDictionary dictionary];
    [attributes setObject:[NSFont userFontOfSize:75] forKey:NSFontAttributeName];
    [attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
}

- (BOOL)isOpaque
{
	return YES;
}

- (BOOL)acceptsFirstResponder
{
	NSLog(@"Accepting");
	return YES;
}
- (BOOL)resignFirstResponder
{
	NSLog(@"Resigning");
	[self setKeyboardFocusRingNeedsDisplayInRect:[self bounds]];
	return YES;
}
- (BOOL)becomeFirstResponder
{
    NSLog(@"Becoming");
    [self setNeedsDisplay:YES];
    return YES;
}


- (void)keyDown:(NSEvent *)event
{
    [self interpretKeyEvents:[NSArray arrayWithObject:event]];
}

- (void)insertText:(NSString *)input
{
    // Set string to be what the user typed
    [self setString:input];
}
- (void)insertTab:(id)sender
{
    [[self window] selectKeyViewFollowingView:self];
}
// Be careful with capitalization here “backtab” is considered
// one word.
- (void)insertBacktab:(id)sender
{
    [[self window] selectKeyViewPrecedingView:self];
}
- (void)deleteBackward:(id)sender
{
    [self setString:@" "];
}

// 矩形領域の中央に文字列を表示するメソッド
- (void)drawStringCenteredIn:(NSRect)aRect {
    NSSize strSize = [string sizeWithAttributes:attributes];
    NSPoint strOrigin;
    strOrigin.x = aRect.origin.x + (aRect.size.width - strSize.width)/2;
    strOrigin.y = aRect.origin.y + (aRect.size.height - strSize.height)/2;
    [string drawAtPoint:strOrigin withAttributes:attributes];
}

// シート形式の保存パネルを表示するメソッド
- (IBAction)savePDF:(id)sender {
    __block NSSavePanel *panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"pdf"]];
    
    [panel beginSheetModalForWindow:[self window]
                  completionHandler:^(NSModalResponse result) {
                      if (result == NSOKButton) {
                          NSRect r = [self bounds];
                          NSData *data = [self dataWithPDFInsideRect:r];
                          NSError *error;
                          BOOL successful = [data writeToURL:[panel URL]
                                                     options:0
                                                       error:&error];
                          if (!successful) {
                              NSAlert *a = [NSAlert alertWithError:error];
                              [a runModal];
                          }
                      }
                      panel = nil;  // avoid strong ref cycle
    }];
}

#pragma mark Accessors

- (void)setBgColor:(NSColor *)c
{
	bgColor = c;
    [self setNeedsDisplay:YES];
}
- (NSColor *)bgColor
{
    return bgColor;
}
- (void)setString:(NSString *)c
{
	string = c;
	NSLog(@"The string is now %@", string);
    [self setNeedsDisplay:YES];
}
- (NSString *)string
{
	return string;
}



@end
