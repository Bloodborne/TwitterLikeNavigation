//
//  CollectionViewCell.m
//  TwitterLikeNavigationDemo
//
//  Created by Nadesico on 16/3/27.
//  Copyright © 2016年 edu.scau. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        ;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"Demo";
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

@end
