//
//  CropViewController.m
//  Custom
//
//  Created by jiahao on 15/9/7.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "CropViewController.h"

@interface CropViewController ()

@property (nonatomic, strong)UIImageView *avatIMG;
@property (nonatomic, strong)UIScrollView *backView;


@property (nonatomic, strong)UIView *cropView;


@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.backView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.backView.backgroundColor = [UIColor orangeColor];
    self.backView.contentSize = CGSizeMake(640, 800);
    [self.view addSubview:self.backView];
    self.backView.translatesAutoresizingMaskIntoConstraints = NO;
    /**
     *  格式为 父类 - 要添加的子类 - 属性 - 关联的子类或父类 - 属性 - 倍数 - 常量 
     */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.avatIMG = [[UIImageView alloc]initWithFrame:CGRectZero];
    UIImage *image = [UIImage imageNamed:@"pic2.jpg"];
    self.avatIMG.image = image;
    self.avatIMG.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self.backView addSubview:self.avatIMG];
    
    self.avatIMG.userInteractionEnabled = YES;
    
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.avatIMG addGestureRecognizer:tap];
    
    

    self.avatIMG.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatIMG attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:1]];
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatIMG attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:100]];


    self.avatIMG.backgroundColor = [UIColor cyanColor];
    
    
    self.cropView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, 300, 300)];
    self.cropView.backgroundColor = [UIColor clearColor];
    self.cropView.layer.borderWidth = 1;
    self.cropView.userInteractionEnabled = NO;
    self.cropView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:self.cropView];
    self.cropView.translatesAutoresizingMaskIntoConstraints = NO;
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cropView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:1]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cropView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100]];
//    [self.cropView addConstraint:[NSLayoutConstraint constraintWithItem:self.cropView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.cropView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//     [self.cropView addConstraint:[NSLayoutConstraint constraintWithItem:self.cropView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.cropView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
  
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    self.view convertRect:<#(CGRect)#> fromView:<#(UIView *)#>
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
