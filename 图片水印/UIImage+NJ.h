//
//  UIImage+NJ.h
//  06-图片水印
//
//  Created by apple on 14-6-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NJ)

/**
 *  生成水印
 *
 *  @param bgName  背景图片
 *  @param logNmae 水印图片
 *
 *  @return 生成好的图片(带水印的图片)
 */
+ (instancetype)imageWithBackgroundImageName:(NSString *)bgName log:(NSString *)logNmae;


@end
