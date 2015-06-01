//
//  LoopScrollView.m
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//

#import "LoopScrollView.h"
#import "LoopScrollViewCell.h"

#define LSIdentifier @"loop"
#define LSMaxSections 100

@interface LoopScrollView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UIPageControl *pageView;

@property (nonatomic, strong) NSTimer *timer;

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation LoopScrollView

- (void)loadLoopScrollView
{
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self setupLoopScrollView];
    [self startTimer];
}

#pragma mark - personal methods
- (void)setupLoopScrollView
{
    // set collectionView flowLayout
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    
    
    // set collectionView frame & layout
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    
    
    //  load xib
    [self.collectionView registerNib:[UINib nibWithNibName:@"LoopScrollViewCell" bundle:nil] forCellWithReuseIdentifier:LSIdentifier];
    
    
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.pagingEnabled = YES;
    [self addSubview:self.collectionView];
    
    // set cell size
    flow.itemSize = self.collectionView.frame.size;
    
    // set pageControl
    UIPageControl *pageView = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 20)];
    
    /*****************************  set pageView color  **********************************/
    
    pageView.pageIndicatorTintColor = _pageTintColor;
    pageView.currentPageIndicatorTintColor = _currentPageTintColor;
    
    /*****************************  set pageView color  **********************************/
    
    pageView.numberOfPages = _images.count;
    self.pageView = pageView;
    [self addSubview:pageView];
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
        
    /**
     *  scroll to the first picture
     */
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:LSMaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

/**
 *  set timer
 */
- (void)startTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:_scrollTime target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.timer = timer;
}

/**
 *  delete timer
 */
- (void)deleteTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

/**
 *  reset picture to scroll the middle of the array
 *
 *  @return return a position of the middle position
 */
- (NSIndexPath *)resetPage
{
    // get the middle picture position
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    // scroll the picture to the middle position
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:LSMaxSections/2];
    
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    return currentIndexPathReset;
}

/**
 *  calculate the position of the next picture
 */
- (void)nextPage
{
    NSIndexPath *currentPage = [self resetPage];
    
    // calculate the indexPath of the next picture & array & position
    NSInteger nextItem = currentPage.item + 1;
    NSInteger nextSection = currentPage.section;
    if (nextItem >= _images.count) {
        
        nextItem = 0;
        nextSection++;
        
    }
    
    NSIndexPath *nextPagePath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    // scroll to the next page
    [self.collectionView scrollToItemAtIndexPath:nextPagePath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return LSMaxSections;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LoopScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifier forIndexPath:indexPath];
    
    [cell setupCellTitle:_loops[indexPath.item] andImage:_images[indexPath.item]];
    
    return cell;
}

#pragma mark - Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.loopDelegate respondsToSelector:@selector(didSelectedItemAtIndexPath:)]) {
        [self.loopDelegate didSelectedItemAtIndexPath:indexPath];
    }
}

// delete timer when began to draging
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self deleteTimer];
}

// start the timer when stop to draging
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // plus 0.5 to round,
    int page = (int)((scrollView.contentOffset.x)/(self.bounds.size.width) + 0.5)%(_images.count);
    self.pageView.currentPage = page;
}

@end
