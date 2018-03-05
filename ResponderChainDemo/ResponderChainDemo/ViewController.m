//
//  ViewController.m
//  ResponderChainDemo
//
//  Created by chenjiao on 2018/3/5.
//  Copyright © 2018年 yaoyao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LayoutMethods.h"
#import "JGFLoginView.h"
#import "UIResponder+Router.h"

@interface ViewController ()
@property (nonatomic, strong) JGFLoginView *loginView;
/** routerDictionary */
@property (nonatomic, strong) NSDictionary *routerDictionary;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.loginView];
    
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.loginView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}

- (void)loginButtonHandler:(NSDictionary *)parameters{
    NSLog(@"%@",parameters);
}
/*
 *
 *
 *
 */

- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo{
    NSInvocation *invocation = self.routerDictionary[eventName];
    if (userInfo) {
        //默认有两参数_cmd，target，所有要拼接在2
        [invocation setArgument:&userInfo atIndex:2];
    }
    [invocation invoke];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (NSDictionary <NSString *, NSInvocation *>*)routerDictionary{
    if (!_routerDictionary) {
        _routerDictionary = @{
                              @"loginButtonTaped":[self createInvocationWithSelector:@selector(loginButtonHandler:)],
                              };
    }
    return _routerDictionary;
}

- (JGFLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[JGFLoginView alloc] init];
        _loginView.backgroundColor = [UIColor cyanColor];
    }
    return _loginView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


















