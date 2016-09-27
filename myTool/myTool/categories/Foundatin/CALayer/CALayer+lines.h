//
//  CALayer+lines.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CALayer (lines)
/// 分割线
+ (CALayer *)lineLayerRect:(CGRect)rect;

/// 生成圆角矩形虚线
+ (CALayer *)squareShapeLayerRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;

/// 生成圆角矩形虚线
+ (CAShapeLayer *)dottedLineBorderRect:(CGRect)rect
                                 color:(UIColor *)color
                          cornerRadius:(CGFloat)cornerRadius
                             lineWidth:(CGFloat)lineWidth
                           dashPattern:(NSArray *)dashPattern;
@end
