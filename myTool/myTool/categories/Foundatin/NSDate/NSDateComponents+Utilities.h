//
//  NSDateComponents+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (Utilities)

+ (id)currentComponents;
+ (id)componentsFromDate:(NSDate *)date;
+ (id)componentsFromDate:(NSDate *)date firstWeekday:(NSInteger)firstWeekday;
+ (id)componentsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
/**
 *  两个日期比较得出的NSDateComponents(注：精确到day， 运算方式：toDate - fromDate)
 *
 *  @param fromDate 从这个日期
 *  @param toDate   到这个日期的时间差
 */
+ (id)componentsWithDayFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

@end
