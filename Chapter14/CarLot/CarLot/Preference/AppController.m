//
//  AppController.m
//  CarLot
//
//  Created by HIROKI IKEUCHI on 2019/02/21.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"

@implementation AppController

- (IBAction)showPreferencePanel:(id)sender {
    // preferenceController is nil?
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc] init];
    }
    NSLog(@"showing %@", preferenceController);
    [preferenceController showWindow:self];
}

+ (void)initialize {
    // NSDictionaryを登録
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    // カラーオブジェクトをアーカイブ化
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    // NSDictionaryにデフォルトを設定する
    [defaultValues setObject:colorAsData forKey:BNRTableBackgroundColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:BNREmptyDocKey];
    // デフォルトのNSDictionaryを登録する
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
    NSLog(@"registered defaults: %@", defaultValues);
}

// 新規Untitledウィンドウを自動生成する前に、NSApplicationオブジェクトは以上先に下記のメッセージを送信する
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
    NSLog(@"applicationShouldOpenUntitledFile:");
    return [PreferenceController preferenceEmptyDoc];
}

// アプリケーションがアクティブになったときに、Beep音を鳴らす
- (void)applicationDidResignActive:(NSNotification *)notification {
    NSBeep();
}

@end
