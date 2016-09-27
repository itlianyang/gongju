//
//  NSAttributedString+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSAttributedString (Utilities)
+ (NSAttributedString *)attributedWithString:(NSString *)string
                                   alignment:(NSTextAlignment)alignment
                                        font:(UIFont *)font
                                       color:(UIColor *)color;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                       color:(UIColor *)color;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                   alignment:(NSTextAlignment)alignment
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing;

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing
                                   lineBreak:(NSLineBreakMode)lineBreak;

- (CGSize)sizeWithMaxSize:(CGSize)maxSize;

+ (NSAttributedString *)attributedStringWithImage:(UIImage *)image;

+ (NSAttributedString *)attributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds;
@end
