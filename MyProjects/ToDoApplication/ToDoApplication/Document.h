//
//  Document.h
//  ToDoApplication
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument {
    NSMutableArray *toDoItemList;
}

- (void)setToDoItemList:(NSMutableArray *)a;

@end

