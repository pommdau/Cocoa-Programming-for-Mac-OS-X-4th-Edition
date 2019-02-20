//
//  Person.m
//  RaiseMan
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize  personName;
@synthesize  expectedRaise;

- (id)init {
    self = [super init];
    if (self) {
        expectedRaise = 0.05;
        personName    = @"New Person";
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

// アーカイブ化
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:personName   forKey:@"personName"];
    [coder encodeFloat:expectedRaise forKey:@"expectedRaise"];
}

// デコード化
- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        personName = [coder decodeObjectForKey:@"personName"];
        expectedRaise = [coder decodeFloatForKey:@"expectedRaise"];
    }
    return self;
}




@end
