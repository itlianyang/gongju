//
//  UIImage+NJ.m
//  06-图片水印
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIImage+NJ.h"

@implementation UIImage (NJ)


+ (instancetype)imageWithBackgroundImageName:(NSString *)bgName log:(NSString *)logNmae
{
    // 0. 加载背景图片
    UIImage *image = [UIImage imageNamed:bgName];
    
	// 1.创建bitmap上下文
    // 执行完这一行在内存中就相遇创建了一个UIImage
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2.绘图图片
    // 绘制背景图片
    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 绘制水印'
    
     UIImage *logImage = [UIImage imageNamed:logNmae];
     
     CGFloat margin = 10;
     CGFloat logY = margin;
     CGFloat logX = image.size.width - margin - logImage.size.width;
     [logImage drawAtPoint:CGPointMake(logX, logY)];
    
//    NSString *str = @"黑马程序员";
//    [str drawAtPoint:CGPointMake(150, 50) withAttributes:nil];
    
    // 3.获得图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}
@end
