//
//  ViewController.m
//  Custom
//
//  Created by jiahao on 15/6/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//


#import "ViewController.h"
#import <POP.h>
#import "TestViewController.h"

#import <WebKit/WebKit.h>
#import <AFNetworking/AFNetworking.h>

#import "LeftViewController.h"

#import "ActionImageView.h"

#import <UIImageView+WebCache.h>
#import "SLImageViewController.h"
#import "CropViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0.0);
    anim.duration = 2;
    anim.toValue = @(1.0);
    
    [self.myView pop_addAnimation:anim forKey:@"fade"];   
  //  sleep(3);
        
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer    alloc]initWithTarget:self action:@selector(goTOs)];
    [self.myView addGestureRecognizer:tap];
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    ActionImageView *imageView = [[ActionImageView alloc]initWithFrame:CGRectMake(0,80, 200, 200)];
    [self.view addSubview:imageView];
  //  imageView.backgroundColor  =[UIColor orangeColor];
    
  //  [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.tattoo77.com/uploads/allimg/121217/1-12121G43453108.jpg"]];
    
    [imageView loadURL:@"http://image.tianjimedia.com/uploadImages/2013/231/L7M86I8303J3.jpg"];
    
    //this is new a program for test
    
    
 //   WKWebView *webView = [[WKWebView alloc]init];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void) watchPersonForChangeOfAddress:(Person *)p
//{
//    
//}



// whenever an observed key path changes, this method will be called
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    NSLog(@"change = %@",change);
    
}

- (void)uploadPicWith:(NSData *)data  complete:(void (^)(void))complete
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"paramName" fileName:@"path" mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (complete) {
            complete();
        }    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"self.name = %@",self.name);
}


- (void)goTOs
{
    TestViewController *testVC = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (IBAction)buttonPress:(UIButton *)sender {
    self.name = @"zheshi shenme ";
    [self setValue:@"再次复制" forKeyPath:@"name"];
    
//    TestViewController *testVC = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
//    [self.navigationController pushViewController:testVC animated:YES];
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Left" bundle:nil];
//    
//    UINavigationController *leftVC = [storyboard instantiateViewControllerWithIdentifier:@"left"];
//    
//    [self.navigationController presentViewController:leftVC animated:YES completion:nil];   
    
    [self.navigationController pushViewController:[[CropViewController alloc]init] animated:YES];
}
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"name"];
}

- (void)viewDidAppear:(BOOL)animated
{
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(140, 140, 140, 140)];
    basicAnimation.duration = 2;
    
    [self.myView pop_addAnimation:basicAnimation forKey:@"nihao"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
