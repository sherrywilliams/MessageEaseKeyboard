//
//  AccessoryView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "AccessoryView.h"
#import <Masonry/Masonry.h>
#import "CustomButton.h"

@interface AccessoryView ()

@property (nonatomic, strong) CustomButton *nextKeyboardButton;
@property (nonatomic, strong) CustomButton *dismissKeyboardButton;
@property (nonatomic, strong) CustomButton *changeModeButton;

@end

@implementation AccessoryView

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
    [self setupNextKeyboardButton];
    [self setupDismissKeyboardButton];
    [self setupChangeModeButton];
}

- (void)setupNextKeyboardButton
{
    self.nextKeyboardButton = [[CustomButton alloc] init];
    [self.nextKeyboardButton setTitle:@"Next Keyboard"];
    [self.nextKeyboardButton addTarget:self action:@selector(gotoNextKeyboard:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.nextKeyboardButton];

    [self.nextKeyboardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}

- (void)setupDismissKeyboardButton
{
    self.dismissKeyboardButton = [[CustomButton alloc] init];
    [self.dismissKeyboardButton setTitle:@"Dismiss"];
    [self.dismissKeyboardButton addTarget:self action:@selector(dismissKeyboard:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.dismissKeyboardButton];

    [self.dismissKeyboardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextKeyboardButton.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}

- (void)setupChangeModeButton
{
    self.changeModeButton = [[CustomButton alloc] init];
    [self.changeModeButton setTitle:@"Change Mode"];
    [self.changeModeButton addTarget:self action:@selector(changeMode:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.changeModeButton];

    [self.changeModeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dismissKeyboardButton.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}

#pragma mark - Action
- (void)gotoNextKeyboard:(id)sender
{

}

- (void)dismissKeyboard:(id)sender
{

}

- (void)changeMode:(id)sender
{

}

@end
