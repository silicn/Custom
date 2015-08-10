//
//  OperationManager.m
//  Custom
//
//  Created by jiahao on 15/7/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "OperationManager.h"


@interface OperationManager ()

@property (nonatomic, strong)MyQueue *defaultQueue;

@end

@implementation OperationManager

- (instancetype)shareManager
{
    static OperationManager *manager = nil;
    
    static dispatch_once_t Once;
    
    dispatch_once(&Once, ^{
        manager  = [[OperationManager alloc]init];
    });
    
    return manager;
}


- (void)addMyOpertaionWithOpertaion:(NSBlockOperation *)opertaion  Complete:(completeBlock)bolck
{
    [self.defaultQueue addOperationWithBlock:^{
        if (bolck) {
            bolck();
        }
    }];
}

- (void)myQueueStop
{
    [self.defaultQueue cancelAllOperations];
}


- (MyQueue *)defaultQueue
{
    if (_defaultQueue == nil) {
        _defaultQueue = [MyQueue shareQueue];
    }
    return _defaultQueue;
}

@end
