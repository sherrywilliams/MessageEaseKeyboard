//
//  PadContainerView.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "PadContainerView.h"
#import "PadView.h"

#import <Masonry/Masonry.h>
#import "KeyManager.h"
#import "KeyboardManager.h"

static NSInteger kPadCount = 9;
static NSInteger kPadPerRow = 3;

@interface PadContainerView ()

@property (nonatomic, strong) NSArray *pads;

@end

@implementation PadContainerView

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
    [self setupPads];
}

- (void)setupPads
{
    NSMutableArray *pads = [NSMutableArray array];
    for (int i=0; i<kPadCount; ++i) {
        PadView *pad = [[PadView alloc] init];

        [pad setTexts:[KeyManager sharedManager].padKeys[i]];

        [self addSubview:pad];
        [pads addObject:pad];
    }

    self.pads = pads;
}

#pragma mark - Constraints
- (void)updateConstraints
{
    for (int i=0; i<self.pads.count; ++i) {
        PadView *pad = self.pads[i];

        [pad mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.mas_width).multipliedBy(1.0/kPadPerRow);
            make.height.equalTo(self.mas_height).multipliedBy(1.0/kPadPerRow);

            if (i / kPadPerRow == 0) {
                make.top.equalTo(self.mas_top);
            } else {
                PadView *abovePad = self.pads[(i-kPadPerRow)];
                make.top.equalTo(abovePad.mas_bottom);
            }

            if (i % kPadPerRow == 0) {
                make.left.equalTo(self.mas_left);
            } else {
                PadView *leftPad = self.pads[i-1];
                make.left.equalTo(leftPad.mas_right);
            }
        }];
    }

    [super updateConstraints];
}

@end
