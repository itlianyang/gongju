//
//  NSFileManager+Utilities.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Utilities)

+ (void)cleanUpFilesInDirectory:(NSString *)directory;

+ (NSArray *)getFileNamesInDirectory:(NSString *)directory;

+ (void)removeFilesWithout:(NSArray *)keepFilenames inDirectory:(NSString *)directory;

+ (void)removeFiles:(NSArray *)filenames inDirectory:(NSString *)directory;

@end
