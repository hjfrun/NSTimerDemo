//
//  NSTimer+WeakTimer.h
//  NSTimerDemo
//
//  Created by HE Jianfeng on 2017/3/28.
//  Copyright © 2017年 hjfrun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTimer)

+ (NSTimer *)weakScheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
