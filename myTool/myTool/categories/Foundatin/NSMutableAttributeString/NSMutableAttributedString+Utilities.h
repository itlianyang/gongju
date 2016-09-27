//
//  NSMutableAttributedString+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSMutableAttributedString (Utilities)

- (void)addAttributedWithString:(NSString *)string
                          color:(UIColor *)color;

- (void)addAttributedWithString:(NSString *)string
                           font:(UIFont *)font
                          color:(UIColor *)color;

- (void)addAttributedWithString:(NSString *)string
                      alignment:(NSTextAlignment)alignment
                           font:(UIFont *)font
                          color:(UIColor *)color;

@end
