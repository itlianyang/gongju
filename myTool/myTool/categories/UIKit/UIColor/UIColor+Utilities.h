//
//  UIColor+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utilities)

+ (UIColor *)colorWithRedValue:(CGFloat)red greenValue:(CGFloat)green blueValue:(CGFloat)blue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

+ (UIColor *)grayColorWithRGBValue:(CGFloat)rgbValue;

@end
