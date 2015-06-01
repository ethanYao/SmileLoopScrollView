//
//  ViewController.m
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//

#import "ViewController.h"
#import "LoopScrollView.h"
#import "UIView+Extension.h"

#define LSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LSRandomColor LSColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/************************************************************************
 ******   must be implimentation & observe the delegate   ***************
 ***********************************************************************/

@interface ViewController () <LoopScrollViewDelegate>

@end

@implementation ViewController

/************************************************************************
 ******   The frame of the view is set when initialize view   ***********
 ******   The scroll speed is set in this method "setTimer"   ***********
 ***********************************************************************/


- (IBAction)buttonClick:(UIButton *)sender {
    
    LoopScrollView *loopView = [[LoopScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    loopView.loops = [NSArray arrayWithObjects:@"广", @"州", @"恒",  @"大", @"威", @"武", @"霸", @"气", @"^.^", nil];
    loopView.images = [self setupImageArrayCount:loopView.loops.count];
    loopView.scrollTime = 1.0f;
    loopView.pageTintColor = [UIColor blueColor];
    loopView.currentPageTintColor = [UIColor redColor];

    [loopView loadLoopScrollView];
    
    loopView.loopDelegate = self;
    [self.view addSubview:loopView];
    
}

/**
 *  setup demo imagesArray
 */
- (NSArray *)setupImageArrayCount:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        
        [array addObject:[UIView imageWithColor:LSRandomColor andSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)]];
        
    }
    NSArray *imageArray = (NSArray *)array;
    return imageArray;
}

#pragma mark - LoopScrollViewDelegate  -> -> do something
- (void)didSelectedItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"=====selected->%ld=====", (long)indexPath.item);
}

@end
