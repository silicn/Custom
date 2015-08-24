//
//  MyTableViewCell.m
//  Custom
//
//  Created by jiahao on 15/7/31.
//  Copyright (c) 2015年 jiahao. All rights reserved.
//

#import "MyTableViewCell.h"


@interface MyTableViewCell () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tabelView;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.textLabel.text = @"你好";
   // [self initTabelView];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initTabelView];
    }
    return self;
}


- (void)initTabelView
{
    if (self.tabelView == nil) {
        self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(60, 0, [UIScreen mainScreen].bounds.size.width - 120, 220) style:UITableViewStylePlain];
        self.tabelView.backgroundColor = [UIColor whiteColor];
        self.tabelView.delegate = self;
        self.tabelView.dataSource = self;
        [self addSubview:self.tabelView];
        self.tabelView.scrollEnabled = NO;
    }
}

+ (CGFloat)heightOfCell
{
    return 5 * 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indetifier = @"cellofcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld 层面",(long)indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0  blue:arc4random()%256/255.0  alpha:1.0];
    cell.textLabel.textAlignment = arc4random()%2 ? NSTextAlignmentLeft:NSTextAlignmentCenter;
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
