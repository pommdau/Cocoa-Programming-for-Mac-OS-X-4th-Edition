//
//  Document.m
//  CarLot
//
//  Created by HIROKI IKEUCHI on 2019/02/20.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "Document.h"
#import "CarArrayController.h"
#import "PreferenceController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(handleColorChange:) name:BNRColorChangedNotification object:nil];
        NSLog(@"Registered with notification center");
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (IBAction)createCar:(id)sender {
    NSWindow *w = [tableView window];
    // Try to end any editing that is taking place
    BOOL editingEnded = [w makeFirstResponder:w];
    if (!editingEnded) {
        NSLog(@"Unable to end editing.");
        return;
    }
    NSUndoManager *undo = [self undoManager];
    // Has an edit occurred already in this event?
    if ([undo groupingLevel] > 0) {
        // Close the last group
        [undo endUndoGrouping];
        // Open a new group
        [undo beginUndoGrouping];
    }
    // Create the object
    id p = [carArrayController newObject];
    [carArrayController addObject:p];
    [carArrayController rearrangeObjects];
    NSArray *a = [carArrayController arrangedObjects];
    
    NSUInteger row = [a indexOfObjectIdenticalTo:p];
    NSLog(@"starting edit of %@ in row %lu", p, row);
    [tableView editColumn:0 row:row withEvent:nil select:YES];
}

// 新規Document WindowのNIBファイルが正しく非アーカイブ化されると、Document.mは下記のメッセージを受け取る
- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    [tableView setBackgroundColor:[PreferenceController preferenceTableBackgroundColor]];
    
}

// 設定パネルで背景色が変更されたときに通知により呼び出されるメソッド
- (void)handleColorChange:(NSNotification *)note {
    NSLog(@"Received notification:%@", note);
    NSColor *color = [[note userInfo] objectForKey:@"color"];
    [tableView setBackgroundColor:color];
}

@end
