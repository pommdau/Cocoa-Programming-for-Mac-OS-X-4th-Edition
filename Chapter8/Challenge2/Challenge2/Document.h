//
//  Document.h
//  Challenge2
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface Document : NSDocument {
    NSMutableArray *employees;
    __weak IBOutlet NSTableView *tableView;
}

- (IBAction)addEmployee:(id)sender;
- (IBAction)removeSelectedEmployees:(id)sender;


@end

