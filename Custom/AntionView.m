//
//  AntionView.m
//  Custom
//
//  Created by jiahao on 15/8/13.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "AntionView.h"

@implementation AntionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height , frame.size.width, 200)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
    
        
        [UIView animateWithDuration:0.5 animations:^{
            view.frame = CGRectMake(0, frame.size.height - 200, frame.size.width, 200);
        }];
    }
    return self;
}


-  (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
