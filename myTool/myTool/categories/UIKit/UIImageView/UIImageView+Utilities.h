//
//  UIImageView+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Utilities)
- (instancetype)initWithTarget:(id)target action:( SEL)action;

- (void)addTarget:( id)target action:( SEL)action;

+ (UIImageView *)imageViewWithGIFData:(NSData *)data;

@end
