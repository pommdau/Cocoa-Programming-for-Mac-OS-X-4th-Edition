//
//  Document.m
//  Challenge2
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "Document.h"
#import "Person.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        employees = [NSMutableArray array];
    }
    return self;
}

#pragma mark Action methods

- (IBAction)addEmployee:(id)sender {
    Person *newEmployee = [[Person alloc] init];
    [employees addObject:newEmployee];
    [tableView reloadData];
}

- (IBAction)removeSelectedEmployees:(id)sender {
    // どの行が選択されているか
    NSIndexSet *rows = [tableView selectedRowIndexes];
    
    // 選択されている項目は空か
    if (rows.count == 0) {
        NSBeep();
        return;
    }
    [employees removeObjectsAtIndexes:rows];
    [tableView reloadData];
}

#pragma mark Table view dataSource methods
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    return employees.count;
}

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(nullable NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex {
    // 列の識別子はなにか
    NSString *identifier = [aTableColumn identifier];
    // どの人か
    Person *person = employees[rowIndex];
    // idenfitierという属性の値は何か
    return [person valueForKey:identifier];
}

// テーブルの編集があった場合
- (void)tableView:(NSTableView *)aTableView
   setObjectValue:(nullable id)anObject
   forTableColumn:(nullable NSTableColumn *)aTableColumn
              row:(NSInteger)rowIndex {
    NSString *identifier = [aTableColumn identifier];
    Person *person = employees[rowIndex];
    // identifierという属性の値をセットする
    [person setValue:anObject forKey:identifier];
}

// テーブルの列のヘッダをクリックされたとき、tableColumnに設定されているソートを行う
- (void)tableView:(NSTableView *)aTableView
sortDescriptorsDidChange:(nonnull NSArray<NSSortDescriptor *> *)oldDescriptors {
    NSArray *newDescriptors = [tableView sortDescriptors];
    [employees sortUsingDescriptors:newDescriptors];
    [tableView reloadData];
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

@end
