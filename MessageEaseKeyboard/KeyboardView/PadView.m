//
//  PadView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "PadView.h"
#import "CustomLabel.h"

#import <Masonry/Masonry.h>

static NSInteger kPadding = 5;

@interface PadView ()

@property (nonatomic, strong) NSArray *labels;

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

#pragma mark - Text
- (void)setTexts:(NSArray *)texts
{
    for (int i=0; i<self.labels.count; ++i) {
        CustomLabel *label = self.labels[i];
        label.text = texts[i];
    }
}

#pragma mark - Setup
- (void)setup
{
    [self setupLabels];
}

- (void)setupLabels
{
    // Top Left
    CustomLabel *topLeftLabel = [[CustomLabel alloc] init];
    [self addSubview:topLeftLabel];
    [topLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.mas_offset(kPadding);
        make.left.equalTo(self.mas_left).with.mas_offset(kPadding);
    }];

    // Top
    CustomLabel *topLabel = [[CustomLabel alloc] init];
    [self addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.mas_offset(kPadding);
        make.centerX.equalTo(self.mas_centerX);
    }];

    // Top Right
    CustomLabel *topRightLabel = [[CustomLabel alloc] init];
    [self addSubview:topRightLabel];
    [topRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.mas_offset(kPadding);
        make.right.equalTo(self.mas_right).with.mas_offset(kPadding);
    }];

    // Left
    CustomLabel *leftLabel = [[CustomLabel alloc] init];
    [self addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.mas_offset(kPadding);
        make.centerY.equalTo(self.mas_centerY);
    }];

    // Middle
    CustomLabel *middleLabel = [[CustomLabel alloc] init];
    [self addSubview:middleLabel];
    [middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];

    // Right
    CustomLabel *rightLabel = [[CustomLabel alloc] init];
    [self addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.mas_offset(kPadding);
        make.centerY.equalTo(self.mas_centerY);
    }];

    // Bottom Left
    CustomLabel *bottomLeftLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomLeftLabel];
    [bottomLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(kPadding);
        make.left.equalTo(self.mas_left).with.mas_offset(kPadding);
    }];

    // Bottom
    CustomLabel *bottomLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(kPadding);
        make.centerX.equalTo(self.mas_centerX);
    }];

    // Bottom Right
    CustomLabel *bottomRightLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomRightLabel];
    [bottomRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(kPadding);
        make.right.equalTo(self.mas_right).with.mas_offset(kPadding);
    }];

    self.labels = @[topLeftLabel, topLabel, topRightLabel,
                    leftLabel, middleLabel, rightLabel,
                    bottomLeftLabel, bottomLabel, bottomRightLabel];
}

@end
