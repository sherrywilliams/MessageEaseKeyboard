//
//  ViewController.m
//  MessageEase
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardView.h"

#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) KeyboardView *keyboardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupKeyboardView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup
- (void)setupKeyboardView
{
    self.keyboardView = [[KeyboardView alloc] init];
    [self.view addSubview:self.keyboardView];

    [self.keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(216);
    }];
}

@end
