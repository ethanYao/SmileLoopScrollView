//
//  UIView+Extension.m
//  SmileLoopScroll
//
//  Created by Mr_Yao on 31/5/15.
//  Copyright (c) 2015年 Mr_Yao. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    // change image size
    CGFloat imageW = LSScreenWidth;
    CGFloat imageH = 200;
    // 1.start bitmap
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    
    // 2.draw a color rect
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    // 3.get image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.end bitmap
    UIGraphicsEndImageContext();
    
    return image;
}



@end
