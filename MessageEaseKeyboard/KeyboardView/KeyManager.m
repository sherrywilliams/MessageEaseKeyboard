//
//  KeyManager.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "KeyManager.h"

@interface KeyManager ()

@property (nonatomic, strong, readwrite) NSArray *padKeys;

@end

@implementation KeyManager

+ (instancetype)sharedManager
{
    static KeyManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self readData];
    }

    return self;
}

#pragma mark - Data
- (void)readData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"primary_keys" ofType:@"plist"];
    self.padKeys = [[NSArray alloc] initWithContentsOfFile:path];
}

@end
