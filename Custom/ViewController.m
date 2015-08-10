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


- (void)goTOs
{

//    self.name  = @"nihao ";
//    return;
    TestViewController *testVC = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (IBAction)buttonPress:(UIButton *)sender {
    self.name = @"zheshi shenme ";
    TestViewController *testVC = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    [self.navigationController pushViewController:testVC animated:YES];

}

- (void)viewDidAppear:(BOOL)animated
{
//    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
//    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
//    basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(140, 140, 140, 140)];
//    basicAnimation.duration = 5;
//    
//    [self.myView pop_addAnimation:basicAnimation forKey:@"nihao"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
