//
//  LeftViewController.m
//  Custom
//
//  Created by jiahao on 15/8/12.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "LeftViewController.h"
#import "ViewController.h"



@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Left";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(back)];
    
    // Do any additional setup after loading the view.
}

- (void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"stroryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"当前是第 %ld 行",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *mainstoryBoard = [UIStoryboard  storyboardWithName:@"Main" bundle:nil];
    
    ViewController *mianVC = [[ViewController alloc]init];
    mianVC.view.backgroundColor = [UIColor redColor];
    [mianVC setValue:@"tranfer" forKeyPath:@"name"];
    mianVC.name = @"cahnge again";
        
    UIStoryboard *storyBoard = [UIStoryboard  storyboardWithName:@"Left" bundle:nil];
    
    UIViewController *myVC = [storyBoard instantiateViewControllerWithIdentifier:@"myLeft"];
    
    myVC.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:myVC animated:YES];
    
    //[self performSegueWithIdentifier:@"leftPush" sender:nil];
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
