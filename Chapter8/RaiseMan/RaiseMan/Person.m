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

@end
