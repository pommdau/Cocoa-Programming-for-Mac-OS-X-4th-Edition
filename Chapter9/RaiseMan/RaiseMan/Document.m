//
//  Document.m
//  RaiseMan
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
        employees = NSMutableArray.new;
    }
    return self;
}

- (void)setEmployees:(NSMutableArray *)a {
    for (Person *person in employees) {
        [self stopObservingPerson:person];
    }

    employees = a;
    
    for (Person *person in employees) {
        [self startObservingPerson:person];
    }
}

#pragma mark For Undo methods

// RMDocumentKVOContextによって、このクラスへの
// KVOメッセージとスーパークラスへのメッセージを区別できるようになる
static void *RMDocumentKVOContext;

- (void)startObservingPerson:(Person *)person {
    [person addObserver:self
             forKeyPath:@"personName"
                options:NSKeyValueObservingOptionOld
                context:&RMDocumentKVOContext];
    [person addObserver:self
             forKeyPath:@"expectedRaise"
                options:NSKeyValueObservingOptionOld
                context:&RMDocumentKVOContext];
}

- (void)stopObservingPerson:(Person *)person {
    [person removeObserver:self
                forKeyPath:@"personName"
                   context:&RMDocumentKVOContext];
    [person removeObserver:self
                forKeyPath:@"expectedRaise"
                   context:&RMDocumentKVOContext];
    
}

// 編集とその逆の操作を行うメソッド
- (void)changeKeyPath:(NSString *)keyPath
             ofObject:(id)obj
              toValue:(id)newValue {
    // setValue:forkeyPathによってKVOメソッドが呼び出され、Undo関連の処理が行われる
    [obj setValue:newValue forKey:keyPath];
}

// Personオブジェクトが編集された際に呼び出されるメソッド
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context != &RMDocumentKVOContext) {
        // コンテキストが一致しない場合、このメッセージはスーパークラスへ当てたものと判断される
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    // ディクショナリ内のnilを実現するために、NSNullオブジェクトが使用される
    if (oldValue == [NSNull null]) {
        oldValue = nil;
    }
    NSLog(@"oldValue = %@", oldValue);
    [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];
    [undo setActionName:@"Edit"];
}

#pragma mark - KVC methods

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index {
    NSLog(@"adding %@ to %@", p, employees);
    // 逆の操作をUndoStackに追加する
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add person"];
    }
    
    // Personを配列に追加する
    [self startObservingPerson:p];  // 「p」に対して監視を始める
    [employees insertObject:p atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index {
    Person *p = employees[index];
    NSLog(@"removing %@ from %@", p, employees);
    // 逆の操作をUndoStackに追加する
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove Person"];
    }
    [self stopObservingPerson:p];   // 「p」に対して監視を終了する
    [employees removeObjectAtIndex:index];
}

- (IBAction)createEmployee:(id)sender {
    NSWindow *w = [tableView window];
    // 編集を実行中の場合は終了させる
    BOOL editingEnded = [w makeFirstResponder:w];
    if (!editingEnded) {
        NSLog(@"Unable to end editing");
        return;
    }
    
    NSUndoManager *undo = [self undoManager];
    
    // このイベントの中で既に編集が発生しているか
    if ([undo groupingLevel] > 0) {
        // 最後のグループをクローズ
        [undo endUndoGrouping];
        // 新しいグループをオープン
        [undo beginUndoGrouping];
    }
    
    // オブジェクトを生成する
    Person *p = [employeeController newObject];
    
    // employeeControllerのコンテンツ配列に追加する
    [employeeController addObject:p];
    
    // 再度並び替える
    [employeeController rearrangeObjects];
    
    // 並べ替えられた配列を取得する
    NSArray *a = [employeeController arrangedObjects];
    
    // 追加されたオブジェクトを検索する
    NSUInteger row = [a indexOfObjectIdenticalTo:p];
    NSLog(@"starting edit of %@ in row %lu", p, row);
    
    // 最後の列で編集を開始する
    [tableView editColumn:0 row:row withEvent:nil select:YES];
}


#pragma mark Default methods

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
