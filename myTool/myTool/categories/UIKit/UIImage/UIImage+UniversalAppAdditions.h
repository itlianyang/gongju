//
//  UIImage+UniversalAppAdditions.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UniversalAppAdditions)

+ (UIImage *)specificImageNamed:(NSString *)name;
+ (UIImage *)universalImageNamed:(NSString *)name;

@end
