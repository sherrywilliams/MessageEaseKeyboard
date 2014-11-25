//
//  KeyManager.h
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong, readonly) NSArray *padKeys;

@end
