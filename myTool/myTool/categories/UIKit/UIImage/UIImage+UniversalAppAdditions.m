//
//  UIImage+UniversalAppAdditions.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIImage+UniversalAppAdditions.h"

#define UIImage_UniversalAppAdditions_DeviceIsIPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

@implementation UIImage (UniversalAppAdditions)

+ (UIImage *)specificImageNamed:(NSString *)name {
  NSString *imageName = nil;
  NSString *extension = [name pathExtension];
  NSUInteger extensionIndex = [name rangeOfString:extension].location;
  imageName = [name substringToIndex:extensionIndex - 1];
  
  NSString *suffix = UIImage_UniversalAppAdditions_DeviceIsIPad ? @"iPad" : @"iPhone";
  NSString *fullname = [NSString stringWithFormat:@"%@~%@", imageName, suffix];
  NSString *path = [[NSBundle mainBundle] pathForResource:fullname ofType:extension];
  
  return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)universalImageNamed:(NSString *)name {
  NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
  return [UIImage imageWithContentsOfFile:path];
}

@end
