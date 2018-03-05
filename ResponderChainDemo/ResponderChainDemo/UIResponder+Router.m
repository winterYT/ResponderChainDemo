//
//  UIResponder+Router.m
//  ResponderChainDemo
//
//  Created by chenjiao on 2018/3/5.
//  Copyright © 2018年 yaoyao. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo
{
    NSLog(@"%@",[self nextResponder]);
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

- (NSInvocation *)createInvocationWithSelector:(SEL)sel{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:sel];
    if (signature == nil) {
        return nil;
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = sel;
    return invocation;
}

@end

