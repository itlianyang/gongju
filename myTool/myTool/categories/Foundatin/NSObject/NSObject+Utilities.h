//
//  NSObject+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utilities)

- (BOOL)isClass:(NSString *)className;

- (BOOL)isValidInstance;

/*!
 @method swizzleMethod:withMethod:error:
 @abstract 对实例方法进行替换
 @param oldSelector 想要替换的方法
 @param newSelector 实际替换为的方法
 @param error 替换过程中出现的错误，如果没有错误为nil
 */
+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;
@end
