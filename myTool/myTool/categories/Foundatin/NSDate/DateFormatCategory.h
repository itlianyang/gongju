//
//  DateFormatCategory.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, NSDateFormat) {
	NSDateFormatFull,                    // 2012-11-30 18:30:59
	NSDateFormatYear,                    // 2012
	NSDateFormatMonth,                   // 11
	NSDateFormatDay,                     // 30
	NSDateFormatYearMonthDayPoint,       // 2012.11.30
    NSDateFormatYearMonthDaySlash,       // 2012/11/30
	NSDateFormatYearMonthDay,            // 2012-11-30
	NSDateFormatYearMonth,               // 2012-11
	NSDateFormatMonthDay,                // 11-30
    NSDateFormatMonthDayPoint,           // 11.30
	NSDateFormatHour,                    // 18
	NSDateFormatMinute,                  // 30
	NSDateFormatSecond,                  // 59
	NSDateFormatHourMinuteSecond,        // 18:30:59
	NSDateFormatHourMinute,              // 18:30
	NSDateFormatMinuteSecond,            // 30:59
    NSDateFormatYearMonthDayHourMinute,  // 2014-11-30 18:30
    NSDateFormatMonthDayHourMinute,      // 11-30 18:30
	NSDateFormatDayOfWeek,               // 1~7 (1为星期日)
  
    NSDateFormatMonth_English,           // Jan
  
  // Chinese Formats
    NSDateFormatYearMonth_Chinese,
	NSDateFormatYearMonthDay_Chinese,    // 2012年11月30日
	NSDateFormatMonthDay_Chinese,        // 11月30日
    NSDateFormatYearMonthDayAMPM_Chinese,// 2012年11月30日 下午
  
    NSDateFormatAMPM // ???
};

CG_INLINE NSString *formatString(NSDateFormat format);

@interface NSDate (DateFormat)

- (NSString *)stringWithFormat:(NSDateFormat)format;

@end


@interface NSString (DateFormat)

- (NSDate *)dateWithFormat:(NSDateFormat)format;

@end

CG_INLINE NSString*
FormatStringWithMilliseconds(long long ms, NSDateFormat format)
{
  return [[NSDate dateWithTimeIntervalSince1970:ms / 1000.0]
          stringWithFormat:format];
}