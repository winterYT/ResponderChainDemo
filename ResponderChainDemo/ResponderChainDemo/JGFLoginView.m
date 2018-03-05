//
//  JGFLoginView.m
//  ResponderChainDemo
//
//  Created by chenjiao on 2018/3/5.
//  Copyright © 2018年 yaoyao. All rights reserved.
//

#import "JGFLoginView.h"
#import "UIResponder+Router.h"

@interface JGFLoginView()
/** account */
@property (nonatomic, strong) UITextField *accountTextField;
/** account */
@property (nonatomic, strong) UITextField *passwordTextField;
/** loginButton */
@property (nonatomic, strong) UIButton *loginButton;
@end

@implementation JGFLoginView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.accountTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.loginButton];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.accountTextField.frame = CGRectMake(10, 100, self.frame.size.width - 20, 44);
    self.passwordTextField.frame = CGRectMake(10, CGRectGetMaxY(self.accountTextField.frame) + 20, CGRectGetWidth(self.accountTextField.frame), 44);
    self.loginButton.frame = CGRectMake(20, CGRectGetMaxY(self.passwordTextField.frame) + 50, self.frame.size.width - 40, 44);
}
//按钮点击事件
- (void)loginHandler{
    [self routerEventWithName:@"loginButtonTaped" userInfo:@{@"account":self.accountTextField.text,@"password":self.passwordTextField.text}];
}


- (UITextField *)accountTextField{
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _accountTextField.placeholder = @"输入账号";
        _accountTextField.font = [UIFont systemFontOfSize:18];
        _accountTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _accountTextField.layer.borderWidth = 1.0;
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _accountTextField;
}

- (UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwordTextField.placeholder = @"输入密码";
        _passwordTextField.font = [UIFont systemFontOfSize:18];
        _passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _passwordTextField.layer.borderWidth = 1.0;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
    }
    return _passwordTextField;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_loginButton addTarget:self action:@selector(loginHandler) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    }
    return _loginButton;
}


@end
