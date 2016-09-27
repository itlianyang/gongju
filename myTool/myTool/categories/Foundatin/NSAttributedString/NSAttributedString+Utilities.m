//
//  NSAttributedString+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSAttributedString+Utilities.h"
#import "NSObject+Utilities.h"

@implementation NSAttributedString (Utilities)

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                   alignment:(NSTextAlignment)alignment
                                        font:(UIFont *)font
                                       color:(UIColor *)color
{
    if (![string isValidInstance]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if (font) {
        return [[NSAttributedString alloc] initWithString:string
                                               attributes:@{
                                                            NSParagraphStyleAttributeName:paragraphStyle,
                                                            NSFontAttributeName : font,
                                                            NSForegroundColorAttributeName : color}];
    } else {
        return nil;
    }
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                       color:(UIColor *)color
{
    if (![string isValidInstance]) return nil;
    return [NSAttributedString attributedWithString:string
                                          alignment:NSTextAlignmentLeft
                                               font:[UIFont systemFontOfSize:14]
                                              color:color];
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color
{
    if (![string isValidInstance]) return nil;
    
    return [NSAttributedString attributedWithString:string
                                          alignment:NSTextAlignmentLeft
                                               font:font
                                              color:color];
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing
                                   lineBreak:(NSLineBreakMode)lineBreak
{
    if (![string isValidInstance]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:lineBreak];
    
    return [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font,
                                                                          NSParagraphStyleAttributeName:paragraphStyle,
                                                                          NSForegroundColorAttributeName:color}];
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing
{
    if (![string isValidInstance]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    //    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    
    return [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font,
                                                                          NSParagraphStyleAttributeName:paragraphStyle,
                                                                          NSForegroundColorAttributeName:color}];
}

+ (NSAttributedString *)attributedWithString:(NSString *)string
                                   alignment:(NSTextAlignment)alignment
                                        font:(UIFont *)font
                                       color:(UIColor *)color
                                 lineSpacing:(CGFloat)lineSpacing
{
    if (![string isValidInstance]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    //    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [paragraphStyle setLineSpacing:lineSpacing];
    
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:@ {
                                           NSParagraphStyleAttributeName:paragraphStyle,
                                               NSFontAttributeName : font,
                                               NSForegroundColorAttributeName : color}];
}

+ (NSAttributedString *)attributedStringWithImage:(UIImage *)image
{
    if (image == nil) return nil;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, -2, attachment.image.size.width, attachment.image.size.height);  //-2 是让图片与文本结合的时候能够对齐。
    return [NSAttributedString attributedStringWithAttachment:attachment];
}

+ (NSAttributedString *)attributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds
{
    if (image == nil) return nil;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = bounds;
    return [NSAttributedString attributedStringWithAttachment:attachment];
}

- (CGSize)sizeWithMaxSize:(CGSize)maxSize
{
    CGRect bounds = [self boundingRectWithSize:maxSize
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                       context:nil];
    return bounds.size;
}

@end
