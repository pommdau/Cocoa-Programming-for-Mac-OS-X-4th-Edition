//
//  StretchView.h
//  DrawingFun
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView {
    NSBezierPath *path; // 白色で描画するパス
    NSImage *image;
    float opacity;
}
@property (assign) float opacity;
@property (strong) NSImage *image;
- (NSPoint)randomPoint;

@end
