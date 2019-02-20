//
//  Person.h
//  Chapter7-B
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Scooter;

@interface Person : NSObject {
    Person  *spouse;  // 配偶者
    Scooter *scooter; // スクーター
}


@end
