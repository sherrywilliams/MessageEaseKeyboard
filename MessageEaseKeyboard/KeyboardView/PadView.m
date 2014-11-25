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
#import "KeyboardManager.h"

static NSInteger kPadding = 4;

typedef NS_ENUM(NSUInteger, Direction) {
    DirectionTopLeft,
    DirectionTop,
    DirectionTopRight,
    DirectionLeft,
    DirectionMiddle,
    DirectionRight,
    DirectionBottomLeft,
    DirectionBottom,
    DirectionBottomRight,
    DirectionUnknown,
};

@interface PadView ()

@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;
@property (nonatomic, strong) UIPanGestureRecognizer *panGR;
@property (nonatomic, strong) NSString *previousKey;

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
    [self setupGR];
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
        make.right.equalTo(self.mas_right).with.mas_offset(-kPadding);
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
        make.right.equalTo(self.mas_right).with.mas_offset(-kPadding);
        make.centerY.equalTo(self.mas_centerY);
    }];

    // Bottom Left
    CustomLabel *bottomLeftLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomLeftLabel];
    [bottomLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(-kPadding);
        make.left.equalTo(self.mas_left).with.mas_offset(kPadding);
    }];

    // Bottom
    CustomLabel *bottomLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(-kPadding);
        make.centerX.equalTo(self.mas_centerX);
    }];

    // Bottom Right
    CustomLabel *bottomRightLabel = [[CustomLabel alloc] init];
    [self addSubview:bottomRightLabel];
    [bottomRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(-kPadding);
        make.right.equalTo(self.mas_right).with.mas_offset(-kPadding);
    }];

    self.labels = @[topLeftLabel, topLabel, topRightLabel,
                    leftLabel, middleLabel, rightLabel,
                    bottomLeftLabel, bottomLabel, bottomRightLabel];
}

- (void)setupGR
{
    self.tapGR = [[UITapGestureRecognizer alloc] init];
    [self.tapGR addTarget:self action:@selector(viewTapped:)];
    [self addGestureRecognizer:self.tapGR];

    self.panGR = [[UIPanGestureRecognizer alloc] init];
    [self.panGR addTarget:self action:@selector(viewPanned:)];
    [self addGestureRecognizer:self.panGR];
}

#pragma mark - GR
- (void)viewTapped:(id)sender
{
    UILabel *label = self.labels[DirectionMiddle];
    [[KeyboardManager sharedManager] handleKey:label.text];
}

- (void)viewPanned:(UIPanGestureRecognizer *)panGR
{
    CGPoint translation = [panGR translationInView:self];

    CGFloat threshold = self.bounds.size.width/2;

    // Detect
    Direction direction = DirectionUnknown;

    if (translation.x > threshold) {
        if (translation.y > threshold) {
            direction = DirectionBottomRight;
        } else if (translation.y < -threshold) {
            direction = DirectionTopRight;
        } else {
            direction = DirectionRight;
        }
    } else if (translation.x < -threshold) {
        if (translation.y > threshold) {
            direction = DirectionBottomLeft;
        } else if (translation.y < -threshold) {
            direction = DirectionTopLeft;
        } else {
            direction = DirectionLeft;
        }
    } else {
        if (translation.y > threshold) {
            direction = DirectionBottom;
        } else if (translation.y < -threshold) {
            direction = DirectionTop;
        }
    }

    if (direction != DirectionUnknown) {
        UILabel *label = self.labels[direction];

        if ([label.text isEqualToString:self.previousKey]) {
            return;
        } else {
            [[KeyboardManager sharedManager] handleKey:label.text];
            self.previousKey = label.text;
        }
    }

    // Forget the previous key
    if (panGR.state == UIGestureRecognizerStateRecognized ||
        panGR.state == UIGestureRecognizerStateCancelled ||
        panGR.state == UIGestureRecognizerStateEnded) {
        self.previousKey = nil;
    }

}

#pragma mark - Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor orangeColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor clearColor];
}

@end
