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
        [path closePath];
        opacity = 1.0;
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
    
    if (image) {
        NSRect imageRect;
        imageRect.origin = NSZeroPoint;
        imageRect.size = [image size];
        NSRect drawingRect = [self currentRect];
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositingOperationSourceOver
                 fraction:opacity];
    }
    
}

- (NSPoint)randomPoint {
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random()%(int)r.size.width;
    result.y = r.origin.y + random()%(int)r.size.height;
    return result;
}

// 2つの点から矩形領域を算出するメソッドを追加します
- (NSRect)currentRect {
    float minX = MIN(downPoint.x, currentPoint.x);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxY = MAX(downPoint.y, currentPoint.y);
    
    return NSMakeRect(minX, minY, maxX-minX, maxY-minY);
}

#pragma mark Events

- (void)mouseDown:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    downPoint = [self convertPoint:p fromView:nil];
    currentPoint = downPoint;
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [self autoscroll:event];    // オートスクロール機能を追加する
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event {
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [self setNeedsDisplay:YES];
}

#pragma mark Accessors

- (NSImage *)image {
    return image;
}

- (void)setImage:(NSImage *)newImage {
    image = newImage;
    
    // ユーザが領域をドラッグしなくても何らかのイメージが表示されるようにする
    NSSize imageSize = [newImage size];
    downPoint = NSZeroPoint;
    currentPoint.x = downPoint.x + imageSize.width;
    currentPoint.y = downPoint.y + imageSize.height;
    [self setNeedsDisplay:YES];
}

- (float)opacity {
    return opacity;
}

- (void)setOpacity:(float)x {
    opacity = x;
    [self setNeedsDisplay:YES];
}

@end
