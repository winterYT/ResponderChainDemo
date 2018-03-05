//
//  UIResponder+Router.h
//  ResponderChainDemo
//
//  Created by chenjiao on 2018/3/5.
//  Copyright © 2018年 yaoyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)
- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo;

- (NSInvocation *)createInvocationWithSelector:(SEL)sel;
@end
