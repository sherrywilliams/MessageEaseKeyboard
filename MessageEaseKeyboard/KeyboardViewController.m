//
//  KeyboardViewController.m
//  MessageEaseKeyboard
//
//  Created by Khoa Pham on 11/25/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "KeyboardViewController.h"
#import "KeyboardView.h"

#import <Masonry/Masonry.h>
#import "KeyboardManager.h"

@interface KeyboardViewController ()

@property (nonatomic, strong) KeyboardView *keyboardView;
@property (nonatomic, strong) UIButton *nextKeyboardButton;


@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupKeyboardView];
    [KeyboardManager sharedManager].inputVC = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

#pragma mark - Constraint
- (void)updateViewConstraints {
    [super updateViewConstraints];

    // Add custom view sizing constraints here
}

#pragma mark - Setup
- (void)setupKeyboardView
{
    self.keyboardView = [[KeyboardView alloc] init];
    [self.view addSubview:self.keyboardView];

    [self.keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Text
- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
