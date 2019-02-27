//
//  StretchView.m
//  DrawingFun
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView

/**
 @brief ビューが自身を描画する必要がある場合に呼ばれるメソッド
 @param dirtyRect 再描画が必要となった領域
 */
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
}

@end
