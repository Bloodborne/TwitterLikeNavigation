//
//  ViewController.m
//  TwitterLikeNavigationDemo
//
//  Created by Nadesico on 16/3/27.
//  Copyright © 2016年 edu.scau. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIPageControl *pageControl;

@end

static int const kPageNumber = 5;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CollectionViewController *vc = [[CollectionViewController alloc] initWithCollectionViewLayout:[UICollectionViewLayout new]];
    vc.pageNumber = kPageNumber;
    [self addChildViewController:vc];
    [self.view addSubview:vc.collectionView];
}

- (void)configNavigationBar
{
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, bar.bounds.size.width, bar.bounds.size.height)];
    self.pageControl.numberOfPages = kPageNumber;
    
    bar.backgroundColor = [UIColor lightGrayColor];
    bar.opaque = YES;
    [bar addSubview:self.pageControl];
    
    self.title = @"Demo";
}

@end
