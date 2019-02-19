//
//  AppDelegate.m
//  KvcFun
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];  // KVCによる値のセット
        NSNumber *n = [self valueForKey:@"fido"];   // KVCによる読み取り
        NSLog(@"fido=%@", n);
    }
    return self;
}

- (int)fido {
    NSLog(@"-fido is returning %d", fido);
    return fido;
}

- (void)setFido:(int)x {
    NSLog(@"-setFido: is called with %d", x);
    fido = x;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
