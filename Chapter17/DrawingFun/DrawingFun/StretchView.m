//
//  StretchView.m
//  DrawingFun
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        // 乱数ジェネレータを初期化する
        srandom((unsigned)time(NULL));
        
        // パスオブジェクトを生成する
        path = [NSBezierPath bezierPath];
        [path setLineWidth:3.0];
        NSPoint point = [self randomPoint];
        [path moveToPoint:point];   // 始点の決定
        for (int i = 0; i < 15; i++) {
            [path curveToPoint:[self randomPoint]
                 controlPoint1:[self randomPoint]
                 controlPoint2:[self randomPoint]];
        }
    }
    return self;
}

/**
 @brief ビューが自身を描画する必要がある場合に呼ばれるメソッド
 @param dirtyRect 再描画が必要となった領域
 */
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    
    // ビューを緑で塗りつぶす
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    
    // パスを白色で描画する
    [[NSColor whiteColor] set];
    [path stroke];
//    [path fill];
}

- (NSPoint)randomPoint {
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random()%(int)r.size.width;
    result.y = r.origin.y + random()%(int)r.size.height;
    return result;
}

@end
