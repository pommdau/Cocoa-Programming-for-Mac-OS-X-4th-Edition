//
//  BigLetterView.h
//  TypingTutor
//
//  Created by HIROKI IKEUCHI on 2019/02/27.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView {
    NSColor *bgColor;
    NSString *inputCharacter;
}

@property (strong) NSColor *bgColor;
@property (copy) NSString *inputCharacter;
@end
