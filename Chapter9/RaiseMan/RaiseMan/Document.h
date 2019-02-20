//
//  Document.h
//  RaiseMan
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface Document : NSDocument {
    NSMutableArray *employees;
    __weak IBOutlet NSTableView *tableView;
    IBOutlet NSArrayController *employeeController;
}

- (IBAction)createEmployee:(id)sender;

- (void)setEmployees:(NSMutableArray *)a;

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;
@end

