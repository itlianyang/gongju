//
//  NSMutableArray+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSMutableArray+Utilities.h"

@implementation NSMutableArray (Utilities)

- (void)reverse
{
    for (int i = 0; i < [self count] / 2; i++) {
        int j = (int)[self count] - 1 - (int)i;
        id iObj = self[i];
        id jObj = self[j];
        [self replaceObjectAtIndex:i withObject:jObj];
        [self replaceObjectAtIndex:j withObject:iObj];
    }
}
@end
