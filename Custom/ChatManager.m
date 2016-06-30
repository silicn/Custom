//
//  ChatManager.m
//  Custom
//
//  Created by jiahao on 16/6/17.
//  Copyright © 2016年 jiahao. All rights reserved.
//

#import "ChatManager.h"

@interface ChatManager ()<chatHEHE>

@end


@implementation ChatManager


+ (instancetype)shareInstance
{
    static ChatManager * chatMananger = nil;
        
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        chatMananger = [[self alloc]init];
        
    });
    
    chatMananger.chatHHManager = chatMananger;
    
    return chatMananger;
    
    
}




- (void)shshsh
{
    NSLog(@"nim message");
    
    
}

@end



