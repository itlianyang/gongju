//
//  NSArray+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSArray+Utilities.h"
#import "NSMutableArray+Utilities.h"
@implementation NSArray (Utilities)
- (id)deepCopy
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id object in self) {
        id copy = nil;
        
        if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
            copy = [object deepCopy];
        }
        else {
            copy = [object copy];
        }
        
        [array addObject:copy];
    }
    
    return [NSArray arrayWithArray:array];
}

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    
    [array reverse];
    
    return [NSArray arrayWithArray:array];
}

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}


- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}



+ (NSArray *)arrayWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&error];
    if (error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    
    return array;
}
@end
