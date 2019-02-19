//
//  AppDelegate.h
//  KvcFun
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    int fido;
}
@property (readwrite, assign) int fido;
- (IBAction)incrementFido:(id)sender;
@end

