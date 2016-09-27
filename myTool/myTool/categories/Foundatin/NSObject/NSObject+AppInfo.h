//
//  NSObject+AppInfo.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AppInfo)
+ (NSString *)ai_version;
+ (NSInteger)ai_build;
+ (NSString *)ai_identifier;
+ (NSString *)ai_currentLanguage;
+ (NSString *)ai_deviceModel;
@end
