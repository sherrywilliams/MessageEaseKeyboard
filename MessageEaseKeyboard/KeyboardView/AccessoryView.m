//
//  AccessoryView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "AccessoryView.h"
#import <Masonry/Masonry.h>

@interface AccessoryView ()

@property (nonatomic, strong) UIButton *nextKeyboardButton;

@end

@implementation AccessoryView

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
    [self setupNextKeyboardButton];
}

- (void)setupNextKeyboardButton
{
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextKeyboardButton addTarget:self action:@selector(gotoNextKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.nextKeyboardButton];

    [self.nextKeyboardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];

}

#pragma mark - Action
- (void)gotoNextKeyboard:(id)sender
{

}

@end
