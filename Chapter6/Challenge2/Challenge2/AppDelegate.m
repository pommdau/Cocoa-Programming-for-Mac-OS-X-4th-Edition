//
//  AppDelegate.m
//  Challenge2
//
//  Created by HIROKI IKEUCHI on 2019/02/18.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSTableView *toDoTable;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSWindow    *window;

@property NSMutableArray *toDoList;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    _toDoList = [NSMutableArray array];
    [_toDoList addObject:@"sample1"];
    [_toDoList addObject:@"sample2"];
    [_toDoList addObject:@"sample3"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - TableView Delegate Method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv {
    return (NSInteger)_toDoList.count;
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)NSTableColumn row:(NSInteger)row {
    return _toDoList[row];
}

// テーブルの値が変更されたとき
- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [_toDoList replaceObjectAtIndex:row withObject:object];
}

- (IBAction)addButtonPush:(id)sender {
    NSString *toDoItem = [NSString stringWithString:_inputTextField.stringValue];
    if (toDoItem.length == 0) {
        return;
    }
    [_toDoList addObject:toDoItem];
    [_toDoTable reloadData];
    return;
}

@end
