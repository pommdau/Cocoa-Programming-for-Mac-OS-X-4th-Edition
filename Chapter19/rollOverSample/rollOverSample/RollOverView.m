//
//  RollOverView.m
//  rollOverSample
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "RollOverView.h"

@interface RollOverView () {
    BOOL isHighlighted;
}
@end

@implementation RollOverView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    if (isHighlighted) {
        [[NSColor blueColor] set];      // rollOverならば青色
        [NSBezierPath fillRect:bounds];
    } else {
        [[NSColor redColor] set];
        [NSBezierPath fillRect:bounds];
    }
    
    isHighlighted = NO;
}

#pragma mark rollOver methods

- (void)viewDidMoveToWindow {
    int option =
    NSTrackingMouseEnteredAndExited |
    NSTrackingActiveAlways |
    NSTrackingInVisibleRect;
    NSTrackingArea *ta;
    ta = [[NSTrackingArea alloc] initWithRect:NSZeroRect
                                      options:option
                                        owner:self
                                     userInfo:nil];
    [self addTrackingArea:ta];
}

- (void)mouseEntered:(NSEvent *)event {
    isHighlighted = YES;
    [self setNeedsDisplay:YES];
}

- (void)mouseExited:(NSEvent *)event {
    isHighlighted = NO;
    [self setNeedsDisplay:YES];
}

@end
