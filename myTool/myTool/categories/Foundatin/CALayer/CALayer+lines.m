//
//  CALayer+lines.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CALayer+lines.h"

@implementation CALayer (lines)
+ (CALayer *)lineLayerRect:(CGRect)rect
{
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = [[UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0] CGColor];
    lineLayer.frame = rect;
    return lineLayer;
}

+ (CALayer *)squareShapeLayerRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius{
    //255, 64, 129
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor colorWithRed:(255)/255.0 green:(64)/255.0 blue:(129)/255.0 alpha:1.0].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath;
    border.frame = rect;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@5, @3.5];
    
    return border;
}

+ (CAShapeLayer *)dottedLineBorderRect:(CGRect)rect
                                 color:(UIColor *)color
                          cornerRadius:(CGFloat)cornerRadius
                             lineWidth:(CGFloat)lineWidth
                           dashPattern:(NSArray *)dashPattern {
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = color.CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath;
    border.frame = rect;
    border.lineWidth = lineWidth;
    border.lineCap = @"square";
    border.lineDashPattern = dashPattern;
    return border;
}
@end
