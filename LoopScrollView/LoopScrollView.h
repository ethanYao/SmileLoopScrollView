//
//  LoopScrollView.h
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//


/************************************************************************
 ******   must be implimentation & observe the delegate   ***************
 ***********************************************************************/


#import <UIKit/UIKit.h>

@protocol LoopScrollViewDelegate <NSObject>

@optional
- (void)didSelectedItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LoopScrollView : UIView

@property (nonatomic, strong) NSArray *loops;

@property (weak, nonatomic) id <LoopScrollViewDelegate> loopDelegate;

- (void)loadLoopScrollView;

@end
