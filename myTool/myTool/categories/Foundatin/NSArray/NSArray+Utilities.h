//
//  NSArray+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utilities)
- (id)deepCopy;

- (NSArray *)reversedArray;

/*
 @method objectAtIndexCheck:
 @abstract 检查是否越界和NSNull如果是返回nil
 @result 返回对象
 */
- (id)objectAtIndexCheck:(NSUInteger)index;

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;
@end
