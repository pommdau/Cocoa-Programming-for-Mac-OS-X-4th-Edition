//
//  MyWindowDelegate.m
//  Challenge1
//
//  Created by HIROKI IKEUCHI on 2019/02/18.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "MyWindowDelegate.h"

@implementation MyWindowDelegate

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    NSSize newSize = NSMakeSize(frameSize.height*2, frameSize.height);
    return newSize;
}

@end
