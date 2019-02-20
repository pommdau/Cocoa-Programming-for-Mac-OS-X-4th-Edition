//
//  ToDoItem.h
//  ToDoApplication
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject {
    NSString  *itemName;   // 項目名
    NSInteger priority;   // 優先度
    float progress;  // 進捗
    NSDate *startDay; // 開始日
}

@property (readwrite, copy) NSString  *itemName;
@property (readwrite) NSInteger priority;
@property (readwrite) float progress;
@property (readwrite, copy) NSDate *startDay;  // 開始日
@end
