//
//  KeyboardManager.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "KeyboardManager.h"

@implementation KeyboardManager

+ (instancetype)sharedManager
{
    static KeyboardManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}

- (void)handleKey:(NSString *)key
{
    NSLog(@"%@", key);
    
    if (key.length > 0) {
        [self.inputVC.textDocumentProxy insertText:key];
    }
}

- (void)deleteBackward
{
    NSLog(@"deleteBackward");
    [self.inputVC.textDocumentProxy deleteBackward];
}

- (void)advanceToNextInputMode
{
    [self.inputVC advanceToNextInputMode];
}

- (void)dismissKeyboard
{
    [self.inputVC dismissKeyboard];
}

@end
