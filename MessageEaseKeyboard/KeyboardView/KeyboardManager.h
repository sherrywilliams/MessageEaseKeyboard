//
//  KeyboardManager.h
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) UIInputViewController *inputVC;

- (void)handleKey:(NSString *)key;
- (void)deleteBackward;
- (void)advanceToNextInputMode;
- (void)dismissKeyboard;

@end
