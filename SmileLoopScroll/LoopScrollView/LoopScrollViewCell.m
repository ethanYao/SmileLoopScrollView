//
//  LoopScrollViewCell.m
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//

#import "LoopScrollViewCell.h"

@interface LoopScrollViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@end


@implementation LoopScrollViewCell


- (void)setupCellTitle:(NSString *)title andImage:(UIImage *)image
{
    self.label.text = title;
    self.imageIcon.image = image;
}



@end
