//
//  NSString+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LYStringLimitType) {
    LYStringLimitTypeOnlyNumber      = 1, //只能输入整数
    LYStringLimitTypeOnlyOnlyDecimal = 2, //只能输入小数(整数+1个小数点)
};

@interface NSString (Utilities)

- (NSString *)firstCharacter;
- (NSString *)lastCharacter;

- (NSString *)URLEncode;
- (NSString *)URLDecode;

- (CGFloat)CGFloatValue;

- (CGSize)sizeWithFontSize:(CGFloat)fontSize constrainedToWidth:(CGFloat)width DEPRECATED_ATTRIBUTE;
- (CGFloat)heightWithFontSize:(CGFloat)fontSize constrainedToWidth:(CGFloat)width DEPRECATED_ATTRIBUTE;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (NSString *)firstAlphabet;

- (BOOL)isOneOf:(NSArray *)strings;

- (long long)longLongValueOfServerString DEPRECATED_ATTRIBUTE;

- (long long)fileSize;

/**
 *  将Array转换为以“，”分隔的String
 *
 *  @param array a list with NSString element
 */
+ (NSString *)stringWithArray:(NSArray *)array;

- (long long)millionSecondsWithHourMinute;//09:40

+ (NSString *)chineseStringWithNum:(NSInteger)num;

/**
 *  获取GUID
 *
 *  @return
 */
+ (NSString *)getUniqueStrByUUID;


//TODO 不同字符编码下计算字符串的长度
/**
 *  按照NSUnicodeStringEncoding编码计算的字符串长度
 *
 *  @return
 */
- (NSUInteger)lengthByUnicodeEncoding;

/**
 *  返回指定编码下计算的字符串长度
 *
 *  @param encoding 编码方式
 *
 *  @return
 */
- (NSUInteger)lengthByEncoding:(NSStringEncoding)encoding;

/**
 *  去掉字符串中的数字
 *
 *  @return
 */
- (NSString *)stringDeleteNumbers;

/**
 *  查找字符串中所有匹配项
 *
 *  @param pattern 匹配方案
 *  @return 匹配数组（NSTextCheckingResult）
 */
- (NSArray *)matchsWithPattern:(NSString *)pattern;

/**
 *  @brief  反转字符串
 *
 *  @param strSrc 被反转字符串
 *
 *  @return 反转后字符串
 */
+ (NSString *)reverseString:(NSString *)strSrc;

/**
 *  非负整数
 */
- (BOOL)isUnsignedInt;

/**
 *  非负浮点数
 */
- (BOOL)isUnsignedFloat;


/**
 *  过滤出字母、数字、汉字
 */
- (NSString *)filtrateToAlphanumeric;
/**
 *  过滤出字母、汉字
 */
- (NSString *)filtrateToLetter;
/**
 *  过滤出数字
 */
- (NSString *)filtrateToNumber;
/**
 *  过滤掉数字
 */
- (NSString *)filtrateNumber;
/**
 *  过滤掉空格
 */
- (NSString *)filtrateSpaceCharacter;

/**
 *  是否包含iOS系统表情
 */
+ (BOOL)isContainsSystemEmoji:(NSString *)string;

/**
 *  根据限制类型返回是否可以继续输入下一个字符
 */
- (BOOL)nextWordCanKeepInput:(NSString *)nextWord withStringLimitType:(LYStringLimitType)limitType;

/**
 *  过滤出小数点后X位
 */
- (NSString *)filtrateCountDigitsAfterTheDecimalPoint:(NSUInteger)count;

@end
