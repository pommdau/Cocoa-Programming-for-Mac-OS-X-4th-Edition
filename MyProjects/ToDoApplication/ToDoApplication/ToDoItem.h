//
//  ToDoItem.h
//  ToDoApplication
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject {
    NSString    *itemName; // 項目名
    NSInteger   priority;  // 優先度
    float       progress;  // 進捗
    NSDate      *startDay; // 開始日
    NSDate      *limitDay; // 終了日
    NSDateComponents *leftTime; // 残り時間
    
}

@property (readwrite, copy) NSString  *itemName;
@property (readwrite) NSInteger priority;
@property (readwrite) float progress;
@property (readwrite, copy) NSDate *startDay;
@property (readwrite, copy) NSDate *limitDay;
@property (readwrite, copy) NSDateComponents *leftTime;
@end
