//
//  NSString+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSString+Utilities.h"
#import "NSObject+Utilities.h"
#import <sys/stat.h>

@implementation NSString (Utilities)

- (NSString *)firstCharacter
{
    if (self.length > 0) {
        return [self substringToIndex:1];
    }
    
    return nil;
}

- (NSString *)lastCharacter
{
    if (self.length > 0) {
        return [self substringWithRange:NSMakeRange(self.length - 1, 1)];
    }
    
    return nil;
}

- (NSString*)URLEncode
{
    // !   @   $   &   (   )   =   +   ~   `   ;   '   :   ,   /   ?
    //%21 %40 %24 %26 %28 %29 %3D %2B %7E %60 %3B %27 %3A %2C %2F %3F
    
    NSArray *escapeChars  = @[
                              @";"  , @"/"  , @"?"  , @":"  , @"@"  , @"&"  ,
                              @"="  , @"+"  , @"$"  , @","  , @"!"  , @"'"  ,
                              @"("  , @")"  , @"*"
                              ];
    NSArray *replaceChars = @[
                              @"%3B", @"%2F", @"%3F", @"%3A", @"%40", @"%26",
                              @"%3D", @"%2B", @"%24", @"%2C", @"%21", @"%27",
                              @"%28", @"%29", @"%2A"
                              ];
    
    int len = [escapeChars count];
    
    NSString *tempStr = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableString *temp = [NSMutableString stringWithString:tempStr];
    
    for (int i = 0; i < len; i++) {
        [temp replaceOccurrencesOfString:escapeChars[i]
                              withString:replaceChars[i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *outStr = [NSString stringWithString:temp];
    
    return outStr;
}

- (NSString *)URLDecode
{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (CGFloat)CGFloatValue
{
#if defined(__LP64__) && __LP64__
    return [self doubleValue];
#else
    return [self floatValue];
#endif
}

- (CGSize)sizeWithFontSize:(CGFloat)fontSize constrainedToWidth:(CGFloat)width
{
    CGSize size = [self sizeWithFont:[UIFont systemFontOfSize:fontSize]
                   constrainedToSize:CGSizeMake(width, MAXFLOAT)
                       lineBreakMode:NSLineBreakByWordWrapping];
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

- (CGFloat)heightWithFontSize:(CGFloat)fontSize constrainedToWidth:(CGFloat)width
{
    return [self sizeWithFontSize:fontSize constrainedToWidth:width].height;
}

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    if (font) {
        CGRect bounds = [self boundingRectWithSize:size
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
        CGSize size = bounds.size;
        return CGSizeMake(ceil(size.width), ceil(size.height));
    } else {
        return CGSizeZero;
    }
}

- (NSString *)firstAlphabet
{
    NSString *alphabet;
    
    int charCode = [self characterAtIndex:0];
    if (charCode < 65 || (charCode > 90 && charCode < 97) || charCode > 122) {
        alphabet =  @"#";
    }
    else {
        alphabet = [[self firstCharacter] uppercaseString];
    }
    
    return alphabet;
}

- (BOOL)isOneOf:(NSArray *)strings
{
    for (NSString *str in strings) {
        if ([self isEqualToString:str]) {
            return YES;
        }
    }
    
    return NO;
}

static int g_nStringLength = 21;
static int g_nHeadIndex = 6;
static int g_nFootIndex = 2;
static int g_nTimeIntervalLength = 13;

- (long long)longLongValueOfServerString
{
    if (self.length == g_nStringLength &&
        [[self substringToIndex:g_nHeadIndex] isEqualToString:@"/Date("] &&
        [[self substringFromIndex:self.length - g_nFootIndex] isEqualToString:@")/"])
    {
        NSString *timeString = [self substringWithRange:NSMakeRange(g_nHeadIndex, g_nTimeIntervalLength)];
        return [timeString longLongValue];
    }
    
    return 0L;
}

- (long long)fileSize
{
    struct stat st;
    if (lstat([self cStringUsingEncoding:NSUTF8StringEncoding], &st) == 0) {
        return st.st_size;
    }
    return 0;
}


+ (NSString *)stringWithArray:(NSArray *)array
{
    NSMutableString *mulString = [NSMutableString string];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *string = (NSString *)obj;
        [mulString appendFormat:@"%@,", string];
    }];
    NSInteger length = [mulString length];
    if (length > 0) {
        [mulString deleteCharactersInRange:NSMakeRange(length - 1, 1)];
    }
    
    return mulString;
}

- (long long)millionSecondsWithHourMinute {
    NSString *hourStr = [self substringWithRange:NSMakeRange(0, 2)];
    NSString *minuteStr = [self substringWithRange:NSMakeRange(3, 2)];
    NSInteger hour = [hourStr intValue];
    NSInteger minute = [minuteStr intValue];
    
    return 1000 * (minute * 60 + hour * 3600);
}

+ (NSString *)chineseStringWithNum:(NSInteger)num
{
    switch (num) {
        case 0:
            return @"零";
        case 1:
            return @"一";
        case 2:
            return @"二";
        case 3:
            return @"三";
        case 4:
            return @"四";
        case 5:
            return @"五";
        case 6:
            return @"六";
        case 7:
            return @"七";
        case 8:
            return @"八";
        case 9:
            return @"九";
        default:
            return @"";
    }
}

+ (NSString *)getUniqueStrByUUID
{
    
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    
    return uuidString ;
    
}

- (NSUInteger)lengthByUnicodeEncoding
{
    return [self lengthByEncoding:NSUnicodeStringEncoding];
}

- (NSUInteger)lengthByEncoding:(NSStringEncoding)encoding
{
    int length = 0;
    char *character = (char *)[self cStringUsingEncoding:encoding];
    for (int i = 0; i < [self lengthOfBytesUsingEncoding:encoding]; i++) {
        if (*character) {
            character++;
            length++;
        } else {
            character++;
        }
    }
    return length;
}

/**
 *  去掉字符串中的数字
 *
 *  @return
 */
- (NSString *)stringDeleteNumbers
{
    return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]] componentsJoinedByString:@""];
}

/** 查找字符串中所有匹配项 */
- (NSArray *)matchsWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&error];
    if (error) {
        NSLog(@"匹配模式不正确");
        return nil;
    }
    // 匹配所有内容
    NSArray *array = [regex matchesInString:self
                                    options:NSMatchingReportCompletion
                                      range:NSMakeRange(0, self.length)];
    if (array == nil) {
        NSLog(@"没有找到匹配内容");
    }
    return array;
}
/**
 *  @brief  反转字符串
 *
 *  @param strSrc 被反转字符串
 *
 *  @return 反转后字符串
 */
+ (NSString *)reverseString:(NSString *)strSrc
{
    NSMutableString* reverseString = [[NSMutableString alloc] init];
    NSInteger charIndex = [strSrc length];
    while (charIndex > 0) {
        charIndex --;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reverseString appendString:[strSrc substringWithRange:subStrRange]];
    }
    return reverseString;
}

- (BOOL)isUnsignedInt
{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isUnsignedFloat
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."].invertedSet;
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    NSString *resultStr = [resultArray componentsJoinedByString:@""];
    if (self.length == resultStr.length) {
        return YES;
    } else {
        NSInteger dotCount = 0;
        for (NSString *sort in resultArray) {
            if ([sort isEqualToString:@"."]) {
                dotCount++;
            }
        }
        return dotCount > 1 ? NO : YES;
    }
}

/**
 *  过滤出字母、数字、汉字
 */
- (NSString *)filtrateToAlphanumeric
{
    NSCharacterSet *set = [NSCharacterSet alphanumericCharacterSet].invertedSet;
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    return [resultArray componentsJoinedByString:@""];
}

/**
 *  过滤出字母、汉字
 */
- (NSString *)filtrateToLetter
{
    NSCharacterSet *set = [NSCharacterSet letterCharacterSet].invertedSet;
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    return [resultArray componentsJoinedByString:@""];
}

/**
 *  过滤出数字
 */
- (NSString *)filtrateToNumber
{
    NSCharacterSet *set = [NSCharacterSet decimalDigitCharacterSet].invertedSet;
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    return [resultArray componentsJoinedByString:@""];
}

/**
 *  过滤掉数字
 */
- (NSString *)filtrateNumber
{
    NSCharacterSet *set = [NSCharacterSet decimalDigitCharacterSet];
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    return [resultArray componentsJoinedByString:@""];
}

/**
 *  过滤掉空格
 */
- (NSString *)filtrateSpaceCharacter
{
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    NSArray *resultArray = [self componentsSeparatedByCharactersInSet:set];
    return [resultArray componentsJoinedByString:@""];
}

/**
 *  是否包含iOS系统表情
 */
+ (BOOL)isContainsSystemEmoji:(NSString *)string {
    
    __block BOOL isEomji = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    isEomji = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                isEomji = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                isEomji = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                isEomji = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                isEomji = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                isEomji = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                isEomji = YES;
            }
        }
    }];
    return isEomji;
}


/**
 *  根据限制类型返回是否可以继续输入下一个字符
 */
- (BOOL)nextWordCanKeepInput:(NSString *)nextWord withStringLimitType:(LYStringLimitType)limitType{
    
    
    if (limitType == LYStringLimitTypeOnlyOnlyDecimal) {
        
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."]invertedSet];
        NSCharacterSet *cs2 = [[NSCharacterSet characterSetWithCharactersInString:@"."] invertedSet];
        NSCharacterSet *cs3 = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        NSString *filtered;
        if ([self.firstCharacter isEqualToString:@"0"]) {
            
            if ([self hasPrefix:@"0."]) {
                //如果前两个字符是“0.”,则可继续输入其他数字
                filtered = [[nextWord componentsSeparatedByCharactersInSet:cs3]componentsJoinedByString:@""];
            }else{
                //如果首字母是0，其后只能输入小数点
                filtered = [[nextWord componentsSeparatedByCharactersInSet:cs2]componentsJoinedByString:@""];
            }
        }else{
            //如果已经包含"."，其后只能输入数字
            NSRange rang = [self rangeOfString:@"."];
            if (rang.location != NSNotFound) {
                filtered = [[nextWord componentsSeparatedByCharactersInSet:cs3]componentsJoinedByString:@""];
            }else{
                //按cs分离出数组,数组按@""分离出字符串
                filtered = [[nextWord componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
            }
        }
        
        BOOL canKeepInput = [nextWord isEqualToString:filtered];
        
        return canKeepInput;
        
    }else if(limitType == LYStringLimitTypeOnlyNumber){
        
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        NSString *filtered = [[nextWord componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
        
        return [nextWord isEqualToString:filtered];
        
    }else{
        return YES;
    }
    
}


/**
 *  过滤出小数点后X位
 */
- (NSString *)filtrateCountDigitsAfterTheDecimalPoint:(NSUInteger)count{
    
    NSString *string = [self isValidInstance] ? self : @"";
    NSRange rang = [string rangeOfString:@"."];
    if (rang.location != NSNotFound) {
        
        //如果第一位就是".",再在第一位补上"0"
        if ([string.firstCharacter isEqualToString:@"."]) {
            string = [NSString stringWithFormat:@"0%@",string];
        }
        
        //如果最后一位是".",则去掉最后一位
        if ([string.lastCharacter isEqualToString:@"."]) {
            string = [string substringToIndex:string.length - 1];
        }
        
        NSRange range = [string rangeOfString:@"."];
        if (range.location != NSNotFound) {
            NSUInteger toIndex = range.location + count + 1 >= string.length ? string.length : range.location + count + 1;
            string = [string substringToIndex:toIndex];
        }
    }
    return string;
}

@end
