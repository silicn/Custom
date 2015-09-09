//
//  SLImageViewController.m
//  Custom
//
//  Created by jiahao on 15/9/6.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "SLImageViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "DetaiImageTableViewController.h"


@interface SLImageViewController ()

@property (nonatomic , strong)NSMutableArray *group;

@property (nonatomic, strong)ALAssetsLibrary *assetsLib;

@property (nonatomic, strong)NSMutableArray *restArray;


@end

@implementation SLImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = YES;
//    self.group = [NSMutableArray arrayWithCapacity:1];
//    self.restArray = [NSMutableArray arrayWithCapacity:1];
//    
//    self.assetsLib = [[ALAssetsLibrary alloc]init];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Whatcell"];
//    [_assetsLib enumerateGroupsWithTypes:ALAssetsGroupAll  usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//        if (group) {
//            [self.group addObject:group];
//        }
//       
//        NSLog(@"%@",group);
//         [self.tableView reloadData]; 
//      
//    } failureBlock:^(NSError *error) {
//        
//    }];
  //   [self.group sortUsingSelector:@selector(sort:)];
     
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(NSComparisonResult)sort:(ALAssetsGroup *)group
{
    if (50 >= group.numberOfAssets) {
        return NSOrderedAscending;
    }else{
        return NSOrderedDescending;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.group.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Whatcell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.group[indexPath.row] valueForProperty:ALAssetsGroupPropertyName];    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetaiImageTableViewController *deVC = [[DetaiImageTableViewController alloc]initWithNibName:@"DetaiImageTableViewController" bundle:nil];
    
    ALAssetsGroup *grou = [self.group objectAtIndex:indexPath.row];
    [grou enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        NSLog(@"%@",result);
        if (result) {
            [self.restArray addObject:result];
        }else{
            [deVC.tableView reloadData];
        }
    }];
    deVC.imageArray = self.restArray;
    
    [self.navigationController pushViewController:deVC animated:YES];
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
