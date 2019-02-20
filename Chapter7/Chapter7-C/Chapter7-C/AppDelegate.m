//
//  AppDelegate.m
//  Chapter7-C
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Person *personA = Person.new;
    Person *personB = Person.new;
    Person *personC = Person.new;
    [personA setValue:[NSNumber numberWithInteger:100] forKey:@"expectedRaise"];
    [personB setValue:[NSNumber numberWithInteger:130] forKey:@"expectedRaise"];
    [personC setValue:[NSNumber numberWithInteger:160] forKey:@"expectedRaise"];
    
    NSArray *employee = @[personA, personB, personC];
    
    NSNumber *theAverage = [employee valueForKeyPath:@"@avg.expectedRaise"];
    NSLog(@"avg:%d", [theAverage intValue]);    // avg:130
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
