//
//  NSTimer+WeakTimer.m
//  NSTimerDemo
//
//  Created by HE Jianfeng on 2017/3/28.
//  Copyright © 2017年 hjfrun.com. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@implementation NSTimer (WeakTimer)

+ (NSTimer *)weakScheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockHandler:) userInfo:[block copy] repeats:repeats];
}

+ (void)blockHandler:(NSTimer *)timer;
{
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) {
        block(timer);
    }
}



@end
