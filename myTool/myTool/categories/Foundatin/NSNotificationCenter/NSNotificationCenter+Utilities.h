//
//  NSNotificationCenter+Addition.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (Utilities)

/**
 *  只发送一个通知
 */
+ (void)postNotification:(NSString *)notiname;

/**
 *  发送一个通知
 *
 *  @param notiname 通知名字
 *  @param object 通知内容
 */
+ (void)postNotification:(NSString *)notiname object:(id)object;

/**
 *  移除所有通知的注册者
 */
+ (void)removeAllObserverForObj:(id)obj;

/**
 *  注册一个通知
 */
+ (void)addObserver:(id)observer action:(SEL)action name:(NSString *)name;

@end
