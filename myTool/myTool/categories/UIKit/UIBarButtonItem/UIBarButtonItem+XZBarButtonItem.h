//
//  UIBarButtonItem+XZBarButtonItem.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XZBarButtonItem)

/**
 *  快速创建一个item对象（内部包装一个按钮UIButton）
 *
 *  @param image           按钮图片
 *  @param higlightedImage 按钮高亮图片
 *  @param target          按钮的监听器
 *  @param action          按钮的监听器的回调方法
 *
 *  @return 创建好的item对象
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                   higlightedImage:(NSString *)higlightedImage
                            target:(id)target
                            action:(SEL)action;

- (UIBarButtonItem *)initWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
             highlightedTitleColor:(UIColor *)highlightedTitleColor
                              font:(UIFont *)font
                            target:(id)target
                            action:(SEL)action;



@end
