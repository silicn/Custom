//
//  MyQueue.m
//  Custom
//
//  Created by jiahao on 15/7/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "MyQueue.h"

@implementation MyQueue


- (instancetype)shareQueue
{
    static MyQueue *queue = nil;
    static dispatch_once_t Once;
    dispatch_once(&Once, ^{
        queue = [[MyQueue alloc]init];
        queue.maxConcurrentOperationCount  = 10;
        queue.name = @"com.jiahao.wenwenyisheng";
    });
    return queue;
}

+ (instancetype)shareQueue
{
    return [[self class] shareQueue];
}




@end
