//
//  ToDoController.m
//  Challenge2_B
//
//  Created by HIROKI IKEUCHI on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "ToDoController.h"

@implementation ToDoController

- (id)init {
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)add:(id)sender {
    NSString *text = _itemInputField.stringValue;
    if (text.length == 0) {
        return;
    }
//    _itemInputField.stringValue = @"";
    [_items addObject:text];
    [_tableView reloadData];
    [_tableView scrollRowToVisible:_items.count - 1];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [_items count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *text = _items[row];
    return text;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [_items replaceObjectAtIndex:row withObject:object];
}
@end
