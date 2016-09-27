//
//  NSDateComponents+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSDateComponents+Utilities.h"

@implementation NSDateComponents (Utilities)

+ (id)componentsFromDate:(NSDate *)date
{
    return [self componentsFromDate:date firstWeekday:0];
}

+ (id)componentsFromDate:(NSDate *)date firstWeekday:(NSInteger)firstWeekday
{
    NSCalendarUnit unit =   NSCalendarUnitEra               |
                            NSCalendarUnitYear              |
                            NSCalendarUnitMonth             |
                            NSCalendarUnitDay               |
                            NSCalendarUnitHour              |
                            NSCalendarUnitMinute            |
                            NSCalendarUnitSecond            |
                            NSCalendarUnitWeekday           |
                            NSCalendarUnitWeekdayOrdinal    |
//                            NSCalendarUnitQuarter           |
                            NSCalendarUnitWeekOfMonth       |
                            NSCalendarUnitWeekOfYear        //|
//                            NSCalendarUnitYearForWeekOfYear |
//                            NSCalendarUnitNanosecond        | // Unavailable
//                            NSCalendarUnitCalendar          |
//                            NSCalendarUnitTimeZone
    ;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    if (firstWeekday) {
        calendar.firstWeekday = firstWeekday;
    }
    return [calendar components:unit fromDate:date];
}

+ (id)componentsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear   |
                          NSCalendarUnitMonth  |
                          NSCalendarUnitDay    |
                          NSCalendarUnitHour   |
                          NSCalendarUnitMinute |
                          NSCalendarUnitSecond;
    
    NSDateComponents *components = [calendar components:unit
                                               fromDate:fromDate
                                                 toDate:toDate
                                                options:NSCalendarWrapComponents];
    return components;
}

+ (id)componentsWithDayFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    // 将日期转为当日的0点
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *toDateString = [formatter stringFromDate:toDate];
    NSDate *referenceDate = [formatter dateFromString:toDateString];
    
    NSString *fromDateString = [formatter stringFromDate:fromDate];
    NSDate *comparedDate = [formatter dateFromString:fromDateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *components = [calendar components:unit
                                               fromDate:comparedDate
                                                 toDate:referenceDate
                                                options:NSCalendarWrapComponents];
    
    return components;
}

+ (id)currentComponents
{
  return [self componentsFromDate:[NSDate date]];
}

@end
