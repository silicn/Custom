//
//  ActionImageView.m
//  Custom
//
//  Created by jiahao on 15/8/18.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "ActionImageView.h"
#import <UIImageView+WebCache.h>



@interface ActionImageView ()

@property (nonatomic,strong)UIProgressView *progressView;


@end



@implementation ActionImageView


- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressView.frame = CGRectMake(0, 0, 200, 2);
        [self addSubview:self.progressView];
    }
    return self;
}
    
- (void)loadURL:(NSString *)url
{

    SDImageCache *cache = [[SDImageCache alloc]init];
    [cache cleanDisk];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageProgressiveDownload | SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"%d %d",receivedSize,expectedSize);
        dispatch_async(dispatch_get_main_queue(), ^{
              self.progressView.progress = receivedSize/expectedSize + 10;
        });
      
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       // self.image  = nil;
        self.progressView.hidden  = NO;
    }];
}

- (UIProgressView *)progressView
{
    if (_progressView == nil) {
        _progressView = [[UIProgressView alloc]init];
        _progressView.progressTintColor = [UIColor redColor];
        _progressView.progress = 0.0f;
        _progressView.backgroundColor = [UIColor cyanColor];
    }
    return _progressView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
