//
//  NSString+Encrypt.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

/**
 *  字符串md5加密
 */
- (NSString *) stringWithMD5;

/**
 *  字符串sha1加密
 */
- (NSString *) stringWithSha1;

@end
