//
//  UIView+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#define LineWidth  0.5f

#import "UIView+Utilities.h"
#import "UIView+Frame.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Utilities)

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

- (void)setBorderWithColor:(UIColor *)color
{
  [self setBorderWithColor:color width:1.0];
}

- (void)setBorderWithColor:(UIColor *)color width:(CGFloat)width
{
  self.layer.borderColor = color.CGColor;
  self.layer.borderWidth = width;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self.layer.cornerRadius = cornerRadius;
}

+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor
{
  UIView *view = [[UIView alloc] initWithFrame:frame];
  view.backgroundColor = backgroundColor;
  return view;
}

- (void)removeSubviews
{
  NSArray *subviews = self.subviews;
  
  for (UIView *subview in subviews) {
      [subview removeFromSuperview];
  }
}

- (UILabel *)addLabel:(NSString *)text
            textColor:(UIColor *)textColor
                 font:(UIFont *)font
                frame:(CGRect)frame
{
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
  label.text = text;
  label.backgroundColor = [UIColor clearColor];
  if (textColor) {
      label.textColor = textColor;
  }
  if (font) {
      label.font = font;
  }
  [self addSubview:label];
  
  return label;
}

- (UIImage *)snapshot
{
  CGFloat scale = [[UIScreen mainScreen] scale];
  UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, scale);
  [self.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return viewImage;
}

- (UIImage *)snapshotWithFrame:(CGRect)frame
{
  UIGraphicsBeginImageContext(frame.size);
  [self.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return viewImage;
}

+ (void)animateWithDuration:(NSTimeInterval)duration
                     delay:(NSTimeInterval)delay
                animations:(void (^)(void))animations
                completion:(void (^)(BOOL))completion
{
  [self animateWithDuration:duration
                      delay:delay
                    options:0
                 animations:animations
                 completion:completion];
}

+ (void)animateWithDuration:(NSTimeInterval)duration
                     delay:(NSTimeInterval)delay
                animations:(void (^)(void))animations
{
  [self animateWithDuration:duration
                      delay:delay
                    options:0
                 animations:animations
                 completion:^(BOOL finished) {}];
}

- (void)addLineWithMode:(LineMode)lineMode lineColor:(UIColor *)lineColor
{
    switch ((NSInteger)lineMode) {
        case LineModeBorder:{
            self.layer.borderWidth = LineWidth;
            self.layer.borderColor = lineColor.CGColor;
        }
            break;
        case LineModeTop:{
            [self addTopLine:lineColor];
        }
            break;
        case LineModeBottom:{
            [self addBottomLine:lineColor];
        }
            break;
        case LineModeLeft:{
            [self addLeftLine:lineColor];
        }
            break;
        case LineModeRight:{
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeLeft):{
            [self addTopLine:lineColor];
            [self addLeftLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeBottom):{
            [self addTopLine:lineColor];
            [self addBottomLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeRight):{
            [self addTopLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeLeft | LineModeBottom):{
            [self addLeftLine:lineColor];
            [self addBottomLine:lineColor];
        }
            break;
        case (LineModeLeft | LineModeRight):{
            [self addLeftLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeBottom | LineModeRight):{
            [self addBottomLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeLeft | LineModeBottom):{
            [self addTopLine:lineColor];
            [self addLeftLine:lineColor];
            [self addBottomLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeLeft | LineModeRight):{
            [self addTopLine:lineColor];
            [self addLeftLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeTop | LineModeBottom | LineModeRight):{
            [self addTopLine:lineColor];
            [self addBottomLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        case (LineModeLeft | LineModeBottom | LineModeRight):{
            [self addLeftLine:lineColor];
            [self addBottomLine:lineColor];
            [self addRightLine:lineColor];
        }
            break;
        default:
            break;
    }
}
- (void)addTopLine:(UIColor *)lineColor
{
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = lineColor;
    line.frame = CGRectMake(0, 0, self.width, LineWidth);
}
- (void)addBottomLine:(UIColor *)lineColor
{
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = lineColor;
    line.frame = CGRectMake(0, self.height-LineWidth, self.width, LineWidth);
}
- (void)addLeftLine:(UIColor *)lineColor
{
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = lineColor;
    line.frame = CGRectMake(0, 0, LineWidth, self.height);
}
- (void)addRightLine:(UIColor *)lineColor
{
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = lineColor;
    line.frame = CGRectMake(self.width-LineWidth, 0, LineWidth, self.height);
}

@end
