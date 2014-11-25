//
//  PadView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "PadView.h"

@interface PadView ()

@end

@implementation PadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1;
        [self setup];
    }

    return self;
}

- (void)setup
{
    
}

@end
