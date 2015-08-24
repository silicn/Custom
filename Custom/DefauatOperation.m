//
//  DefauatOperation.m
//  Custom
//
//  Created by jiahao on 15/7/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "DefauatOperation.h"


static dispatch_group_t jiahao_default_queue_group() {
    static dispatch_group_t jiahao_default_queue_group;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jiahao_default_queue_group = dispatch_group_create();
    });
    
    return jiahao_default_queue_group;
}


static dispatch_queue_t jiahao_default_queue() {
    static dispatch_queue_t jiahao_default_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jiahao_default_queue = dispatch_queue_create("com.jiaohao.operation.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return jiahao_default_queue;
}




@implementation DefauatOperation

- (void)Test
{
    dispatch_async(jiahao_default_queue(), ^{
        
    });
    
}

@end
