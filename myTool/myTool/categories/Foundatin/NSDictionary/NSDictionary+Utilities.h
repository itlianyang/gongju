//
//  NSDictionary+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utilities)

- (id)deepCopy;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jasonString;

@end
