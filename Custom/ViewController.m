//
//  ViewController.m
//  Custom
//
//  Created by jiahao on 15/6/23.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//


#import "ViewController.h"

#import "ChatManager.h"




@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    
    ChatManager * chat = [ChatManager shareInstance];
    
    [chat.chatHHManager shshsh];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void) watchPersonForChangeOfAddress:(Person *)p
//{
//    
//}



// whenever an observed key path changes, this method will be called

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
