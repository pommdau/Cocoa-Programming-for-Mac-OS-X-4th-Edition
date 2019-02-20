//
//  AppDelegate.m
//  Chapter7-B
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import "Scooter.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // 配偶者の用意
    Person *spouse = Person.new;                        // 選択された人の配偶者
    Scooter *spouse_scooter = Scooter.new;
    [spouse_scooter setValue:@"BV250" forKey:@"modelName"];     // 配偶者のスクーターモデル名をセット
    [spouse setValue:spouse_scooter forKey:@"scooter"];
    
    // 選択された人
    Person *selectedPerson = Person.new;
    [selectedPerson setValue:spouse forKey:@"spouse"];
    
    NSString *scooterNameOfSpouse = [selectedPerson valueForKeyPath:@"spouse.scooter.modelName"];
    NSLog(@"%@", scooterNameOfSpouse);
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
