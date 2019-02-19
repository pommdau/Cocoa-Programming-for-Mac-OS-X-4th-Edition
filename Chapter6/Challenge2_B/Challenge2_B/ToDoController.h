//
//  ToDoController.h
//  Challenge2_B
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface ToDoController : NSObject
@property (nonatomic, copy) NSMutableArray *items;
@property (weak) IBOutlet NSTextField *itemInputField;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)add:(id)sender;

@end
