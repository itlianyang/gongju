//
//  UIView+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

typedef enum{
    LineModeBorder = 0,// 四周
    LineModeTop    = 1 << 0,
    LineModeBottom = 1 << 1,
    LineModeLeft   = 1 << 2,
    LineModeRight  = 1 << 3
}LineMode;

#import <UIKit/UIKit.h>

@interface UIView (Utilities)

/**
 *  获得view所在的控制器
 */
@property (readonly) UIViewController *parentController;

- (void)setBorderWithColor:(UIColor *)color;
- (void)setBorderWithColor:(UIColor *)color width:(CGFloat)width;
- (void)setCornerRadius:(CGFloat)cornerRadius;

+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor;

- (void)removeSubviews;

- (UILabel *)addLabel:(NSString *)text
            textColor:(UIColor *)textColor
                 font:(UIFont *)font
                frame:(CGRect)frame DEPRECATED_ATTRIBUTE;

- (UIImage *)snapshot DEPRECATED_ATTRIBUTE;
- (UIImage *)snapshotWithFrame:(CGRect)frame DEPRECATED_ATTRIBUTE;

+ (void)animateWithDuration:(NSTimeInterval)duration
                      delay:(NSTimeInterval)delay
                 animations:(void (^)(void))animations
                 completion:(void (^)(BOOL finished))completion DEPRECATED_ATTRIBUTE;

+ (void)animateWithDuration:(NSTimeInterval)duration
                      delay:(NSTimeInterval)delay
                 animations:(void (^)(void))animations DEPRECATED_ATTRIBUTE;

/**
 *  加线
 */
- (void)addLineWithMode:(LineMode)lineMode lineColor:(UIColor *)lineColor;

@end
