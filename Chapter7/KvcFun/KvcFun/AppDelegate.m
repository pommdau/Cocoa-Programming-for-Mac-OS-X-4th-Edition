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
@synthesize fido;

- (id)init {
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];  // KVCによる値のセット
        NSNumber *n = [self valueForKey:@"fido"];   // KVCによる読み取り
        NSLog(@"fido=%@", n);
    }
    return self;
}

- (IBAction)incrementFido:(id)sender {
//    // オブザーバーの通知を明示的にトリガーする方法
//    [self willChangeValueForKey:@"fido"];
//    fido++;
//    NSLog(@"fido is now %d", fido);
//    [self didChangeValueForKey:@"fido"];
    
//    // KVCを使う方法
//    NSNumber *nowValue = [self valueForKey:@"fido"];
//    NSNumber *nowValuePP = [NSNumber numberWithInt:[nowValue intValue]+1];
//    [self setValue:nowValuePP forKey:@"fido"];
    
    // Accesserを用いる方法
    [self setFido:[self fido] + 1];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
