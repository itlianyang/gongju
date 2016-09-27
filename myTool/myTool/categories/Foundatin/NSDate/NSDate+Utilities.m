//
//  NSDate+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSDate+Utilities.h"
#import "NSDateComponents+Utilities.h"

#import "DateFormatCategory.h"

@implementation NSDate (Utilities)

- (long long)milliseconds
{
  return [self timeIntervalSince1970] * 1000;
}

+ (long long)millisecondsSince1970
{
  return [Now() timeIntervalSince1970] * 1000;
}

+ (long long)millisecondsWithDate:(NSDate *)date
{
  return [date timeIntervalSince1970] * 1000;
}

+ (NSDate *)dateWithMilliseconds:(long long)milliseconds
{
  return [NSDate dateWithTimeIntervalSince1970:milliseconds / 1000];
}

- (BOOL)isSameDayWithDate:(NSDate *)otherDate
{
  if (!otherDate) {
    return NO;
  }
  
  NSDateComponents *otherComponents = [NSDateComponents componentsFromDate:otherDate];
  NSDateComponents *components      = [NSDateComponents componentsFromDate:self];

  return (components.year  == otherComponents.year  &&
          components.month == otherComponents.month &&
          components.day   == otherComponents.day);
}

- (BOOL)isToday
{
  return [self isSameDayWithDate:Now()];
}

- (BOOL)isInThisWeek
{
  NSDateComponents *nowComponents = [NSDateComponents currentComponents];
  NSDateComponents *components    = [NSDateComponents componentsFromDate:self];
  
  return nowComponents.year       == components.year       &&
         nowComponents.weekOfYear == components.weekOfYear;
}

- (BOOL)isInThisMonth
{
  NSDateComponents *nowComponents = [NSDateComponents currentComponents];
  NSDateComponents *components    = [NSDateComponents componentsFromDate:self];
  
  return nowComponents.year  == components.year  &&
         nowComponents.month == components.month;
}


+ (BOOL)isTodayFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSDateComponents *nowComponents = [NSDateComponents componentsFromDate:fromDate];
    NSDateComponents *components    = [NSDateComponents componentsFromDate:toDate];
    
    return (components.year  == nowComponents.year  &&
            components.month == nowComponents.month &&
            components.day   == nowComponents.day);
}

+ (BOOL)isTomorrowFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSDateComponents *components = [NSDateComponents componentsWithDayFromDate:fromDate
                                                                        toDate:toDate];
    return components.day == 1;
}

+ (BOOL)isTheDayAfterTomorrowFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSDateComponents *components = [NSDateComponents componentsWithDayFromDate:fromDate
                                                                        toDate:toDate];
    return components.day == 2;
}

+ (BOOL)isInThisWeekFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    // 计算toDate所在周的周一日期和周日日期
    NSDateComponents *toDateCp = [NSDateComponents componentsFromDate:toDate];
    NSInteger toSundayCount = 0;
    NSInteger toMondayCount = 0;
    if (toDateCp.weekday > 1) {
        toSundayCount = 8 - toDateCp.weekday;
        toMondayCount = toDateCp.weekday - 2;
    } else {
        toSundayCount = 0;
        toMondayCount = 6;
    }
    
    NSTimeInterval oneDay = 60*60*24*1;
    
    NSTimeInterval mondayTime = [toDate timeIntervalSince1970] - oneDay*toMondayCount;
    NSTimeInterval sundayTime = [toDate timeIntervalSince1970] + oneDay*toSundayCount;
    NSDate *mondayDate = [NSDate dateWithTimeIntervalSince1970:mondayTime];
    NSDate *sundayDate = [NSDate dateWithTimeIntervalSince1970:sundayTime];
    NSDateComponents *minCps = [NSDateComponents componentsWithDayFromDate:mondayDate
                                                                    toDate:fromDate];
    NSDateComponents *maxCps = [NSDateComponents componentsWithDayFromDate:fromDate
                                                                    toDate:sundayDate];
    if (minCps.day >= 0 && maxCps.day >= 0) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isInAfterWeekFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    // 计算toDate下周日日期
    NSDateComponents *toDateCp = [NSDateComponents componentsFromDate:toDate];
    NSInteger toNextSundayCount = 0;
    if (toDateCp.weekday > 1) {
        toNextSundayCount = 8 - toDateCp.weekday;
    } else {
        toNextSundayCount = 0;
    }
    toNextSundayCount += 7;
    
    NSTimeInterval oneDay = 60*60*24*1;
    NSTimeInterval nextSundayTime = [toDate timeIntervalSince1970] + oneDay*toNextSundayCount;
    NSDate *nextSundayDate = [NSDate dateWithTimeIntervalSince1970:nextSundayTime];

    NSDateComponents *minCps = [NSDateComponents componentsWithDayFromDate:fromDate
                                                                    toDate:toDate];
    NSDateComponents *maxCps = [NSDateComponents componentsWithDayFromDate:fromDate
                                                                    toDate:nextSundayDate];
    if (minCps.day <= 0 && maxCps.day >= 0) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)dayOfWeekInChinese
{
  NSString *str[] = {
    @"星期日",
    @"星期一",
    @"星期二",
    @"星期三",
    @"星期四",
    @"星期五",
    @"星期六",
  };
  NSInteger i = [[self stringWithFormat:NSDateFormatDayOfWeek] intValue];
  return str[i - 1];
}
- (NSString *)uppercaseWeekNumber
{
    NSString *weekString = [self dayOfWeekInChinese];
    NSRange range = [weekString rangeOfString:@"星期"];
    return [weekString substringFromIndex:range.location + range.length];
}

- (BOOL)isExpired
{
  return [self milliseconds] < [Now() milliseconds];
}

+ (NSDate *)firstDayOfMonth
{
  return [self firstDayBeforeMonth:0];
}

+ (NSDate *)lastDayOfMonth
{
  return [self lastDayBeforeMonth:0];
}

+ (NSDate *)firstDayBeforeMonth:(NSInteger)beforeMonth
{
  NSDateComponents *components = [NSDateComponents currentComponents];
  
  NSInteger y = components.year;
  NSInteger m = components.month;
  NSInteger d = 1;
  
  for (int i = 0; i < beforeMonth; i++) {
    if (--m < 1) {
      --y;
      m = 12;
    }
  }
  
  NSString *dateString = [NSString stringWithFormat:@"%d-%02d-%02d", (int)y, (int)m, (int)d];

  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"yyyy-MM-dd"];
  
  return [formatter dateFromString:dateString];
}

+ (NSDate *)lastDayBeforeMonth:(NSInteger)beforeMonth
{
  NSDateComponents *components = [NSDateComponents currentComponents];
  
  NSInteger y = components.year;
  NSInteger m = components.month;

  for (int i=0; i<beforeMonth; i++) {
      if (--m < 1) {
          --y;
          m = 12;
      }
  }
  
  NSInteger d = [self daysOfMonth:m year:y];
  
  NSString *string = [NSString stringWithFormat:@"%d-%02d-%02d", (int)y, (int)m, (int)d];
  return [string dateWithFormat:NSDateFormatYearMonthDay];
}

+ (NSInteger)daysOfMonth:(NSInteger)month year:(NSInteger)year
{
  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  }
  else if (month == 2) {
    return [self isLeapYear:year] ? 29 : 28;
  }
  
  return 31;
}

+ (BOOL)isLeapYear:(NSInteger)year
{
  return year % 100 == 0 ? year % 400 == 0 : year % 4 == 0;
}

+ (NSDate *)firstDayOfWeek
{
  NSDateComponents *components = [NSDateComponents currentComponents];
  
  NSInteger w = components.weekday;
  
  long long firstDayOfWeekMillsecond = [Now() millisecondsAtHour:0] - MSECONDS_PER_DAY * (w - 1);
  
  return [NSDate dateWithMilliseconds:firstDayOfWeekMillsecond];
}

+ (NSDate *)lastDayOfWeek
{
  NSDateComponents *components = [NSDateComponents currentComponents];
  
  NSInteger w = components.weekday;
  
  long long lastDayOfWeekMillsecond = [Now() millisecondsAtHour:0] + MSECONDS_PER_DAY * (7 - w);
  
  return [NSDate dateWithMilliseconds:lastDayOfWeekMillsecond];
}

+ (NSDate *)today
{
  NSTimeInterval timeInterval = [Now() timeIntervalAtHour:0];

  return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

+ (NSDate *)yesterday{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    
    NSDateComponents *components = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]-24];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    NSDate *yesterday = [calendar dateByAddingComponents:components toDate:[[NSDate alloc]init] options:0];
    return yesterday;
}

+ (NSDate *)dayBefore:(NSDate *)date
{
  NSTimeInterval timeInterval = [[NSDate date] timeIntervalAtHour:0];

  timeInterval -= SECONDS_PER_DAY;
  
  return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

+ (NSDate *)dayAfter:(NSDate *)date
{
  NSTimeInterval timeInterval = [[NSDate date] timeIntervalAtHour:0];

  timeInterval += SECONDS_PER_DAY;

  return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (NSTimeInterval)timeIntervalAtHour:(NSInteger)hour
{
  NSCalendar       *calendar   = [NSCalendar currentCalendar];
  NSDateComponents *components = [NSDateComponents componentsFromDate:self];
  
  [components setHour:hour];
  [components setMinute:0];
  [components setSecond:0];
  
  NSDate *date = [calendar dateFromComponents:components];
  return [date timeIntervalSince1970];
}

- (long long)millisecondsAtHour:(NSInteger)hour
{
  return [self timeIntervalAtHour:hour] * 1000;
}

- (NSInteger)year
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitYear;
  NSDateComponents *currentDC = [calendar components:unit fromDate:self];

  return [currentDC year];
}

- (NSInteger)month
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitMonth;
  NSDateComponents *currentDC = [calendar components:unit fromDate:self];

  return [currentDC month];
}

- (NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSDateComponents *currentDC = [calendar components:unit fromDate:self];
    
    return [currentDC day];
    
}

+ (NSInteger)currentHour
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitHour;
  NSDateComponents *currentDC = [calendar components:unit fromDate:[NSDate date]];

  return [currentDC hour];
}

+ (NSInteger)currentYear
{
  return [[NSDate date] year];
}

+ (NSInteger)currentMonth
{
  return [[NSDate date] month];
}

+ (NSInteger)currentDay
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitDay;
  NSDateComponents *currentDC = [calendar components:unit fromDate:[NSDate date]];
  
  return [currentDC day];
}

+ (NSInteger)nextYear
{
  return [NSDate currentYear] + 1;
}

+ (NSInteger)nextMonth
{
  NSInteger currentMonth = [NSDate currentMonth];
  
  if (currentMonth == 12) {
    return 1;
  }
  
  return currentMonth + 1;
}

+ (NSInteger)nextMonthYear
{
  NSInteger currentMonth = [NSDate currentMonth];
  NSInteger currentYear  = [NSDate currentYear];
  
  if (currentMonth == 12) {
    return ++currentYear;
  }
  
  return currentYear;
}

+ (NSInteger)lastMonthWithMonth:(NSInteger)month
{
  if (month == 1) {
    return 12;
  }
  return --month;
}

+ (NSInteger)lastMonthYearWithYear:(NSInteger)year
                             month:(NSInteger)month
{
  if (month == 1) {
    return --year;
  }
  
  return year;
}

+ (NSInteger)nextMonthWithMonth:(NSInteger)month
{
  if (month == 12) {
    return 1;
  }
  
  return month + 1;
}

+ (NSInteger)nextMonthYearWithYear:(NSInteger)year month:(NSInteger)month
{  
  if (month == 12) {
    return ++year;
  }
  
  return year;
}

+ (NSDate *)nextMonthDate
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitMonth | NSCalendarUnitYear;
  NSDateComponents *currentDC = [calendar components:unit fromDate:[NSDate date]];

  NSInteger year = currentDC.year;
  NSInteger month = currentDC.month;
  if (month == 12) {
    month = 1;
    year++;
  }
  else {
    month++;
  }

  [currentDC setYear:year];
  [currentDC setMonth:month];

  NSDate *nextMonth = [calendar dateFromComponents:currentDC];
  return nextMonth;
}

+ (NSDate *)lastMonthDate
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSCalendarUnit unit = NSCalendarUnitMonth | NSCalendarUnitYear;
  NSDateComponents *currentDC = [calendar components:unit fromDate:[NSDate date]];

  NSInteger year = currentDC.year;
  NSInteger month = currentDC.month;
  if (month == 1) {
    month = 12;
    year--;
  }
  else {
    month--;
  }

  [currentDC setYear:year];
  [currentDC setMonth:month];

  NSDate *lastMonth = [calendar dateFromComponents:currentDC];
  return lastMonth;
}

+ (NSInteger)monthOfString:(NSString *)str
{
  if ([str length] < 3) {
    return 0;
  }
  NSString *str3 = [[str substringToIndex:3] lowercaseString];

  NSArray *monthStrList = @[@"jan", @"feb", @"mar", @"apr", @"may", @"jun",
                            @"jul", @"aug", @"sep", @"oct", @"nov", @"dec"];

  NSInteger index = [monthStrList indexOfObject:str3];
  if (index < monthStrList.count && index >= 0) {
    return index + 1;
  }
  return 0;
}

+ (NSString *)stringOfMonth:(NSInteger)month
{
  NSString *str = nil;
  
  switch (month) {
    case 1:str = @"Jan.";break;
    case 2:str = @"Feb.";break;
    case 3:str = @"Mar.";break;
    case 4:str = @"Apr.";break;
    case 5:str = @"May.";break;
    case 6:str = @"Jun.";break;
    case 7:str = @"Jul.";break;
    case 8:str = @"Aug.";break;
    case 9:str = @"Sep.";break;
    case 10:str = @"Oct.";break;
    case 11:str = @"Nov.";break;
    case 12:str = @"Dec.";break;
    default:break;
  }
  
  return str;
}

+ (NSString *)fullStringOfMonth:(NSInteger)month
{
  NSString *str = nil;
  
  switch (month) {
    case 1:str = @"January";break;
    case 2:str = @"February";break;
    case 3:str = @"March";break;
    case 4:str = @"April";break;
    case 5:str = @"May";break;
    case 6:str = @"June";break;
    case 7:str = @"July";break;
    case 8:str = @"August";break;
    case 9:str = @"September";break;
    case 10:str = @"October";break;
    case 11:str = @"November";break;
    case 12:str = @"December";break;
    default:break;
  }
  
  return str;
}

+ (NSDate *)startDateWithYear:(NSInteger)year month:(NSInteger)month
{
  NSCalendar       *calendar   = [NSCalendar currentCalendar];
  NSDateComponents *components = [[NSDateComponents alloc] init];

  [components setYear:year];
  [components setMonth:month];
  
  return [calendar dateFromComponents:components];
}

+ (NSDate *)endDateWithYear:(NSInteger)year month:(NSInteger)month
{
  if (++month > 12) {
    ++year;
    month = 1;
  }
  
  return [self startDateWithYear:year month:month];
}

+ (NSDate *)startDateWithYear:(NSInteger)year
                        month:(NSInteger)month
                          day:(NSInteger)day
{
  NSCalendar       *calendar   = [NSCalendar currentCalendar];
  NSDateComponents *components = [[NSDateComponents alloc] init];
  
  [components setYear:year];
  [components setMonth:month];
  [components setDay:day];
  
  return [calendar dateFromComponents:components];
}

+ (NSInteger)daysBetweenStartDate:(NSDate *)startDate lastDate:(NSDate *)lastDate
{
    NSTimeInterval startInterval = [startDate timeIntervalSince1970];
    NSTimeInterval lastInterval = [lastDate timeIntervalSince1970];
    
    NSTimeInterval interval = lastInterval - startInterval;
    
    return ceil(interval / 60 / 60 /24);
}

- (NSInteger)yearsBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    return [endDate year] - [startDate year];
}

- (BOOL)latterThanDate:(NSDate *)date
{
    NSDateComponents *cps = [NSDateComponents componentsFromDate:date
                                                          toDate:self];
    if (cps.year > 0 ||
        cps.month > 0 ||
        cps.day > 0 ||
        cps.hour > 0 ||
        cps.minute > 0 ||
        cps.second > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)earlierThanDate:(NSDate *)date
{
    NSDateComponents *cps = [NSDateComponents componentsFromDate:date
                                                          toDate:self];
    if (cps.year < 0 ||
        cps.month < 0 ||
        cps.day < 0 ||
        cps.hour < 0 ||
        cps.minute < 0 ||
        cps.second < 0) {
        return YES;
    } else {
        return NO;
    }
}


- (BOOL)earlierThanDay:(NSDate *)day{
    
    NSDateComponents *cps = [NSDateComponents componentsFromDate:day
                                                          toDate:self];
    if (cps.year < 0 ||
        cps.month < 0 ||
        cps.day < 0)
    {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)latterThanDay:(NSDate *)day
{
    NSDateComponents *cps = [NSDateComponents componentsFromDate:day
                                                          toDate:self];
    if (cps.year > 0 ||
        cps.month > 0 ||
        cps.day > 0)
    {
        return YES;
    } else {
        return NO;
    }
}

@end
