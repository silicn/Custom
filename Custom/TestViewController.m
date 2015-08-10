//
//  TestViewController.m
//  Custom
//
//  Created by jiahao on 15/7/10.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "TestViewController.h"
#import "ViewController.h"
#import <AFNetworking.h>
#import <POP.h>
#import "MyTableViewCell.h"

#import "SerViewController.h"



@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)UISearchBar *searchBar;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    self.navigationItem.prompt = @"这是什么";
    
    
    //这样
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self initTabelView];
    
    self.tableView.tableHeaderView = self.searchBar;
    
  //  UISearchController *searchVC = [[UISearchController alloc]initWithSearchResultsController:self];
//    searchVC.searchBar = _searchBar;
  //  __weak typeof(self) weakSelf = self;
    
//    [self doTest:^{
//        NSLog(@"%@ ",self.view);
//    }];
//    
//    [[AFHTTPRequestOperationManager manager] GET:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (UISearchBar *)searchBar
{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    SerViewController *serVC = [[SerViewController alloc]initWithNibName:@"SerViewController" bundle:nil];
    UISearchController  *secrVC = [[UISearchController alloc]initWithSearchResultsController:serVC];
    [self.navigationController presentViewController:secrVC animated:YES completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   
}

- (void)initTabelView
{
    if (self.tableView == nil) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
      //  [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indeti = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indeti];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indeti];
    }
  //  cell.textLabel.text = [NSString stringWithFormat:@"%ld 层面",(long)indexPath.row];
    return cell;
}


- (IBAction)buttonClick:(UIButton *)sender {
        
    
}

- (void)dealloc
{
    NSLog(@"%@ Delloc",[self class]);
}



- (void)doTest:(void (^)())complete
{
    complete = [complete copy];
    
    NSLog(@"你好");
    if (complete) {
        complete();
    }
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
