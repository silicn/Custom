//
//  ShowViewController.m
//  Custom
//
//  Created by jiahao on 15/9/7.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@property (nonatomic, strong)UIImageView *imageView;


@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.imageView.image = self.image;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
