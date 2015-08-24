//
//  SecViewController.m
//  Custom
//
//  Created by jiahao on 15/8/13.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "SecViewController.h"
#import "AntionView.h"


@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"弹出视图";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPress:(UIButton *)sender {
    
    NSLog(@"btn Press");
  //  sender.selected = !sender.selected;
    
        AntionView  *view  = [[AntionView  alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
        [self.view addSubview:view];
     
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
