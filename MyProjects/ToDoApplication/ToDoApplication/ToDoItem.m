//
//  ToDoItem.m
//  ToDoApplication
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

@synthesize itemName;
@synthesize priority;
@synthesize progress;
@synthesize startDay;

- (id)init {
    self = [super init];
    if (self) {
        itemName = @"やること";
        priority = 0;
        progress = 0;
        startDay = [NSDate date];
    }
    return self;
    
}

@end
