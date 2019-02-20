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
@synthesize limitDay;
@synthesize leftTime;

- (id)init {
    self = [super init];
    if (self) {
        itemName = @"やること";
        priority = 0;
        progress = 0;
        startDay = [NSDate date];
        limitDay = [NSDate date];
        
        // limitDay = limitDay - startDay
        NSCalendar *calendar = [NSCalendar currentCalendar];
        leftTime = [calendar components:NSCalendarUnitDay fromDate:startDay toDate:limitDay options:0];
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"priority"]) {
        [self setPriority:0];
    } else if ([key isEqualToString:@"progress"]) {
        [self setProgress:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

@end
