//
//  UIColor+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIColor+Utilities.h"

@implementation UIColor (Utilities)

+ (UIColor *)colorWithRedValue:(CGFloat)red
                    greenValue:(CGFloat)green
                     blueValue:(CGFloat)blue
{
  return [self colorWithRed:red / 255.0
                      green:green / 255.0
                       blue:blue / 255.0
                      alpha:1.0];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
  return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                         green:((float)((hexValue & 0xFF00) >> 8))/255.0
                          blue:((float)(hexValue & 0xFF))/255.0
                         alpha:alphaValue];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
  return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)grayColorWithRGBValue:(CGFloat)rgbValue
{
  return [self colorWithRedValue:rgbValue
                      greenValue:rgbValue
                       blueValue:rgbValue];
}

@end
