//
//  NSString+FirstLetter.m
//  TypingTutor
//
//  Created by HIROKI IKEUCHI on 2019/02/28.
//  Copyright © 2019年 Big Nerd Ranch. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

- (NSString *)bnr_firstLetter {
    if (self.length < 2) {
        return self;
    }
    NSRange r;
    r.location  = 0;
    r.length    = 1;
    return [self substringWithRange:r];
}

@end
