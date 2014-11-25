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
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1;
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
    [self addSubview:self.padContainerView];

    [self.padContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.height.equalTo(self.mas_height);
        make.width.equalTo(self.mas_height);
    }];
}

- (void)setupAccessoryView
{
    self.accessoryView = [[AccessoryView alloc] init];
    [self addSubview:self.accessoryView];

    [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.padContainerView.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
}

@end
