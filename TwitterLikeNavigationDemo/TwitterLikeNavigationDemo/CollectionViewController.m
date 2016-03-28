//
//  CollectionViewController.m
//  TwitterLikeNavigationDemo
//
//  Created by Nadesico on 16/3/27.
//  Copyright © 2016年 edu.scau. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static int const kPageNumber = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //self.collectionView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*kPageNumber,[UIScreen mainScreen].bounds.size.height);
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self configNavigationBar];
}

- (void)configNavigationBar
{
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, bar.bounds.size.height - 5, bar.bounds.size.width, 0)];
    self.pageControl.numberOfPages = kPageNumber;
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    bar.backgroundColor = [UIColor lightGrayColor];
    bar.opaque = YES;
    [bar addSubview:self.pageControl];
    
    self.title = @"Demo";
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kPageNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/**************************** set the space between cells ZERO ****************************/

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

/**************************** set the space between cells ZERO ****************************/

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // expand cell to fill the entire view
    [collectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];      //Necessary!Except this line will results in a warning!
    return self.collectionView.frame.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

#pragma mark - Collection view rotation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

//-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
//    
//    [self.collectionView.collectionViewLayout invalidateLayout];
//    
//    // compute current idx from offset
//    float idx = roundf(self.collectionView.contentOffset.x / self.collectionView.frame.size.width);
//    
//    // compute new offset in target orientation
//    float newX = idx * ((toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
//                        (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) ?
//                        [[UIScreen mainScreen] bounds].size.height : // going to landscape, use screen H as new cell W
//                        [[UIScreen mainScreen] bounds].size.width); // going to portrait, use screen W as new cell W
//    
//    // set new offsset
//    [self.collectionView setContentOffset:CGPointMake(newX, 0)];
//    
//    // reload everything
//    [self.collectionView reloadData];
//}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    float fractionPage = scrollView.contentOffset.x / self.view.bounds.size.width;
    NSInteger neareastNumber = lround(fractionPage);
    
    self.pageControl.currentPage = neareastNumber;
}

@end
