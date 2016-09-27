//
//  DateFormatCategory.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DateFormatCategory.h"
#import <UIKit/UIKit.h>
CG_INLINE NSString *formatString(NSDateFormat format) {
	NSString *formatString = nil;

	switch (format) {
		case NSDateFormatFull:
			formatString = @"yyyy-MM-dd HH:mm:ss";
			break;
		case NSDateFormatYear:
			formatString = @"yyyy";
			break;
		case NSDateFormatMonth:
			formatString = @"MM";
			break;
		case NSDateFormatDay:
			formatString = @"dd";
			break;
        case NSDateFormatYearMonthDayPoint:
			formatString = @"yyyy.MM.dd";
            break;
        case NSDateFormatYearMonthDaySlash:
            formatString = @"yyyy/MM/dd";
            break;
		case NSDateFormatYearMonthDay:
			formatString = @"yyyy-MM-dd";
			break;
		case NSDateFormatYearMonth:
			formatString = @"yyyy-MM";
			break;
		case NSDateFormatMonthDay:
			formatString = @"MM-dd";
			break;
        case NSDateFormatMonthDayPoint:
            formatString = @"M.d";
            break;
		case NSDateFormatHour:
			formatString = @"HH";
			break;
		case NSDateFormatMinute:
			formatString = @"mm";
			break;
		case NSDateFormatSecond:
			formatString = @"ss";
			break;
		case NSDateFormatHourMinuteSecond:
			formatString = @"HH:mm:ss";
			break;
		case NSDateFormatHourMinute:
			formatString = @"HH:mm";
			break;
		case NSDateFormatMinuteSecond:
			formatString = @"mm:ss";
			break;
        case NSDateFormatYearMonthDayHourMinute:
            formatString = @"yyyy-MM-dd HH:mm";
            break;
        case NSDateFormatMonthDayHourMinute:
            formatString = @"MM-dd HH:mm";
            break;
		case NSDateFormatDayOfWeek:
			formatString = @"c";
			break;
        case NSDateFormatMonth_English:
            formatString = @"MMM";
            break;
        case NSDateFormatYearMonth_Chinese:
			formatString = @"yyyy年MM月";
            break;
		case NSDateFormatYearMonthDay_Chinese:
			formatString = @"yyyy年MM月dd日";
			break;
        case NSDateFormatMonthDay_Chinese:
            formatString = @"M月d日";
            break;
        case NSDateFormatYearMonthDayAMPM_Chinese:
            formatString = @"yyyy年MM月dd日 a";
            break;
        case NSDateFormatAMPM:
            formatString = @"a";
            break;
		default:
			break;
	}

	return formatString;
}

static NSDateFormatter *g_pDateFormatter = nil;

@implementation NSDate (DateFormat)

- (NSString *)stringWithFormat:(NSDateFormat)format {
    if (!g_pDateFormatter) {
        g_pDateFormatter = [[NSDateFormatter alloc] init];
    }
    
    if (NSDateFormatMonth_English == format) {
        [g_pDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    } else if (NSDateFormatDayOfWeek == format) {
        [g_pDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    }
    
    [g_pDateFormatter setDateFormat:formatString(format)];
    
    if (NSDateFormatYearMonthDayAMPM_Chinese == format || NSDateFormatAMPM == format) {
        [g_pDateFormatter setAMSymbol:@"上午"];
        [g_pDateFormatter setPMSymbol:@"下午"];
    }
    
    return [g_pDateFormatter stringFromDate:self];
}

@end

@implementation NSString (DateFormat)

- (NSDate *)dateWithFormat:(NSDateFormat)format {
    if (!g_pDateFormatter) {
        g_pDateFormatter = [[NSDateFormatter alloc] init];
    }
    
    [g_pDateFormatter setDateFormat:formatString(format)];
    
    if (NSDateFormatYearMonthDayAMPM_Chinese == format || NSDateFormatAMPM == format) {
        [g_pDateFormatter setAMSymbol:@"上午"];
        [g_pDateFormatter setPMSymbol:@"下午"];
    }
    
    return [g_pDateFormatter dateFromString:self];
}

@end
