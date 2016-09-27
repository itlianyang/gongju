//
//  UIBarButtonItem+XZBarButtonItem.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIBarButtonItem+XZBarButtonItem.h"

@implementation UIBarButtonItem (XZBarButtonItem)


+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage target:(id)target action:(SEL)action
{
        // 1.创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 2.设置按钮背景图片
        UIImage *normal = [UIImage imageNamed:image];
        [btn setBackgroundImage:normal forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
//        [btn setImage:normal forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
    
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    
    
        // 3.设置按钮的尺寸
        btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
//        btn.bounds = CGRectMake(0, 0, 50, 40);

        
        // 4.监听按钮点击
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        // 5.返回创建好的item
        return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (UIBarButtonItem *)initWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
             highlightedTitleColor:(UIColor *)highlightedTitleColor
                              font:(UIFont *)font
                            target:(id)target
                            action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = (CGRect){CGPointZero, [title sizeWithFont:font]};
    [btn.titleLabel setFont:font];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
