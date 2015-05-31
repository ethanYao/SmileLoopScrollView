//
//  ViewController.m
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//

#import "ViewController.h"
#import "LoopScrollView.h"


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
    
    LoopScrollView *loopView = [[LoopScrollView alloc] initWithFrame:CGRectMake(0, 200, LSScreenWidth, 200)];
    loopView.loops = [NSArray arrayWithObjects:@"广", @"州", @"恒",  @"大", @"威", @"武", @"霸", @"气", @"^.^", nil];
    [loopView loadLoopScrollView];
    
    loopView.loopDelegate = self;
    [self.view addSubview:loopView];
    
}

#pragma mark - LoopScrollViewDelegate  -> -> do something
- (void)didSelectedItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"=====%ld=====", (long)indexPath.item);
}

@end
