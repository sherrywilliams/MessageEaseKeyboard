//
//  KeyboardView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "KeyboardView.h"
#import "PadContainerView.h"
#import "AccessoryView.h"

#import <Masonry/Masonry.h>

@interface KeyboardView ()

@property (nonatomic, strong) PadContainerView *padContainerView;
@property (nonatomic, strong) AccessoryView *accessoryView;

@end

@implementation KeyboardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }

    return self;
}

#pragma mark - Setup
- (void)setup
{
    [self setupPadContainerView];
    [self setupAccessoryView];
}

- (void)setupPadContainerView
{
    self.padContainerView = [[PadContainerView alloc] init];
    self.padContainerView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.padContainerView];

    [self.padContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(self.padContainerView.mas_height);
    }];
}

- (void)setupAccessoryView
{
    self.accessoryView = [[AccessoryView alloc] init];
    self.accessoryView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.accessoryView];

    [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.padContainerView.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
}

@end
