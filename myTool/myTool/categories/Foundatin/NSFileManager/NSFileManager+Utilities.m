//
//  NSFileManager+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "NSFileManager+Utilities.h"

@implementation NSFileManager (Utilities)

+ (void)cleanUpFilesInDirectory:(NSString *)directory
{
  NSFileManager *fileMgr = [NSFileManager defaultManager];
  
  NSArray *contents = [fileMgr contentsOfDirectoryAtPath:directory error:nil];
  
  for (NSString *content in contents) {
    NSString *path = [directory stringByAppendingPathComponent:content];
    [fileMgr removeItemAtPath:path error:nil];
  }
}

+ (NSArray *)getFileNamesInDirectory:(NSString *)directory
{
  NSFileManager *fileMgr = [NSFileManager defaultManager];
  
  NSArray *contents = [fileMgr contentsOfDirectoryAtPath:directory error:nil];
  
  return contents;
}

+ (void)removeFilesWithout:(NSArray *)keepFilenames
               inDirectory:(NSString *)directory
{
  NSFileManager *fileMgr = [NSFileManager defaultManager];
  
  NSArray *contents = [self getFileNamesInDirectory:directory];
  for (NSString *content in contents) {
    BOOL isKeep = NO;
    for (NSString *filename in keepFilenames) {
      if ([content isEqualToString:filename]) {
        isKeep = YES;
        break;
      }
    }
    if (!isKeep) {
      NSString *path = [NSString stringWithFormat:@"%@/%@",directory,content];
      [fileMgr removeItemAtPath:path error:nil];
    }
  }
}

+ (void)removeFiles:(NSArray *)filenames inDirectory:(NSString *)directory
{
  NSFileManager *fileMgr = [NSFileManager defaultManager];
  
  for (NSString *filename in filenames) {
    NSString *path = [NSString stringWithFormat:@"%@/%@",directory,filename];
    [fileMgr removeItemAtPath:path error:nil];
  }
}


@end
