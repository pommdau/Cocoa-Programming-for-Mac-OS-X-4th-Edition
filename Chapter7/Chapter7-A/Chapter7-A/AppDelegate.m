//
//  AppDelegate.m
//  Chapter7-A
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // KVCによる設定
    Student *myStudent = Student.new;
    [myStudent setValue:@"Yoshioka" forKey:@"firstName"];
    
    // 読み取り
    NSString *firstName = [myStudent valueForKey:@"firstName"];
    NSLog(@"firstName:%@", firstName);
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
