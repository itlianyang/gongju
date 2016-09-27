//
//  NSDate+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//
#import <Foundation/Foundation.h>

#define MSECONDS_PER_DAY  86400000
#define SECONDS_PER_DAY   86400

#define MSECONDS_PER_HOUR 3600000
#define SECONDS_PER_HOUR  3600

#define MSECONDS_PER_MINITE 60000
#define SECONDS_PER_MINITE  60

#define HOURS_PER_DAY 24

#define MIDDAY_HOUR 12

NS_INLINE NSDate* Now() {
  return [NSDate date];
}

@interface NSDate (Utilities)

- (long long)milliseconds;

+ (long long)millisecondsSince1970 DEPRECATED_ATTRIBUTE; // 使用 [Now() milliseconds] 替代
+ (long long)millisecondsWithDate:(NSDate *)date DEPRECATED_ATTRIBUTE;
+ (NSDate *)dateWithMilliseconds:(long long )milliseconds;

- (BOOL)isSameDayWithDate:(NSDate *)otherDate;
- (BOOL)isToday;
- (BOOL)isInThisWeek;
- (BOOL)isInThisMonth;

/**
 *  fromDate相对toDate的时间比较（toDate - fromDate）
 *
 *  主要用于房东订单倒计时，toDate与服务器时间比较(习惯按照周一为每周第一天)
 *
 *  @param fromDate 要比较的时间
 *  @param toDate   做为比较参照的时间
 */
+ (BOOL)isTodayFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (BOOL)isTomorrowFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (BOOL)isTheDayAfterTomorrowFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (BOOL)isInThisWeekFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (BOOL)isInAfterWeekFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

- (NSString *)dayOfWeekInChinese;
- (NSString *)uppercaseWeekNumber;

- (BOOL)isExpired;

+ (NSDate *)firstDayOfMonth;
+ (NSDate *)lastDayOfMonth;
+ (NSDate *)firstDayBeforeMonth:(NSInteger)beforeMonth;
+ (NSDate *)lastDayBeforeMonth:(NSInteger)beforeMonth;

+ (NSDate *)firstDayOfWeek;
+ (NSDate *)lastDayOfWeek;

+ (NSDate *)today;
+ (NSDate *)yesterday;

// Zhiming Wang : 这两个方法什么意思？
// Yang: 定制化较强，不推荐使用
+ (NSDate *)dayBefore:(NSDate *)date DEPRECATED_ATTRIBUTE;
+ (NSDate *)dayAfter:(NSDate *)date DEPRECATED_ATTRIBUTE;

- (long long)millisecondsAtHour:(NSInteger)hour;

- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;

// Zhiming Wang : 以下四个方法弃用，将来增加 NSDate 相应的实例方法
//+ (NSInteger)currentHour DEPRECATED_ATTRIBUTE;
//+ (NSInteger)currentYear DEPRECATED_ATTRIBUTE;
//+ (NSInteger)currentMonth DEPRECATED_ATTRIBUTE;
//+ (NSInteger)currentDay DEPRECATED_ATTRIBUTE;

+ (NSInteger)nextYear;
+ (NSInteger)nextMonth;
+ (NSInteger)nextMonthYear;
+ (NSInteger)lastMonthWithMonth:(NSInteger)month;
+ (NSInteger)lastMonthYearWithYear:(NSInteger)year month:(NSInteger)month;
+ (NSInteger)nextMonthWithMonth:(NSInteger)month;
+ (NSInteger)nextMonthYearWithYear:(NSInteger)year month:(NSInteger)month;

+ (NSDate *)nextMonthDate;
+ (NSDate *)lastMonthDate;

+ (NSInteger)monthOfString:(NSString *)str;
+ (NSString *)stringOfMonth:(NSInteger)month;
+ (NSString *)fullStringOfMonth:(NSInteger)month;

+ (NSDate *)startDateWithYear:(NSInteger)year month:(NSInteger)month DEPRECATED_ATTRIBUTE;
+ (NSDate *)endDateWithYear:(NSInteger)year month:(NSInteger)month DEPRECATED_ATTRIBUTE;
+ (NSDate *)startDateWithYear:(NSInteger)year
                        month:(NSInteger)month
                          day:(NSInteger)day DEPRECATED_ATTRIBUTE;

+ (NSInteger)daysOfMonth:(NSInteger)month year:(NSInteger)year;
+ (BOOL)isLeapYear:(NSInteger)year;


/**
 *  计算日期长度
 *
 *  @param startDate 开始日期
 *  @param lastDate  结束日期
 *
 *  @return 日期长度
 */
+ (NSInteger)daysBetweenStartDate:(NSDate *)startDate lastDate:(NSDate *)lastDate;

//- (NSInteger)yearsBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

/**
 *  是否晚于date
 */
- (BOOL)latterThanDate:(NSDate *)date;
/**
 *  是否早于date
 */
- (BOOL)earlierThanDate:(NSDate *)date;

- (BOOL)earlierThanDay:(NSDate *)day;
- (BOOL)latterThanDay:(NSDate *)day;
@end
