//
//  AppDelegate.m
//  SpeakLine
//
//  Created by HIROKI IKEUCHI on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSSpeechSynthesizerDelegate>
// UI parts
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton    *startButton;
@property (weak) IBOutlet NSButton    *stopButton;

@property NSSpeechSynthesizer *speechSynth; // make as property, not as instance valiable
@property NSArray *voices;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt :(id)sender;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"init");
        // Make a new instance of NSSpeechSynthesizer
        // with default voice
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];

        _voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - TableView Delegate Method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv {
    return (NSInteger)_voices.count;
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)NSTableColumn row:(NSInteger)row {
    NSString     *voice     = _voices[row];
    NSDictionary *voiceDict = [NSSpeechSynthesizer attributesForVoice:voice];
    return voiceDict[NSVoiceName];
}


#pragma mark - NSSynthesizer Delegate Method
- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
        didFinishSpeaking:(BOOL)finishedSpeaking {
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);  // if you push stop button, finishedSpeaking is NO
    [_stopButton setEnabled:NO];
    [_startButton setEnabled:YES];
}


#pragma mark - Button Action Method
- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    if (string.length == 0) {   // Is string message nil?
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started tot say %@", string);
    
    // Change Button State
    [_stopButton  setEnabled:YES];
    [_startButton setEnabled:NO];
    
}
@end
