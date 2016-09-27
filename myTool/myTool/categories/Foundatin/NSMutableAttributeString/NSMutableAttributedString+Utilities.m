//
//  NSMutableAttributedString+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSMutableAttributedString+Utilities.h"

#import "NSAttributedString+Utilities.h"

@implementation NSMutableAttributedString (Utilities)

- (void)addAttributedWithString:(NSString *)string
                          color:(UIColor *)color
{
  if (!string) {
    return;
  }
  NSAttributedString *att = [NSAttributedString attributedWithString:string
                                                               color:color];
  [self appendAttributedString:att];
}

- (void)addAttributedWithString:(NSString *)string
                           font:(UIFont *)font
                          color:(UIColor *)color
{
  if (!string) {
    return;
  }
  NSAttributedString *att = [NSAttributedString attributedWithString:string
                                                                font:font
                                                               color:color];
  [self appendAttributedString:att];
}

- (void)addAttributedWithString:(NSString *)string
                      alignment:(NSTextAlignment)alignment
                           font:(UIFont *)font
                          color:(UIColor *)color
{
    if (!string) {
        return;
    }
    NSAttributedString *att = [NSAttributedString attributedWithString:string
                                                             alignment:alignment
                                                                  font:font
                                                                 color:color];
    [self appendAttributedString:att];
}

@end
