//
//  AppDelegate.h
//  DrawingFun
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class StretchView;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet StretchView *stretchView;
}
- (IBAction)showOpenPanel:(id)sender;
@end

