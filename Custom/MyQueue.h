//
//  MyQueue.h
//  Custom
//
//  Created by jiahao on 15/7/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyQueue : NSOperationQueue

- (instancetype)shareQueue;
+ (instancetype)shareQueue;

@end
