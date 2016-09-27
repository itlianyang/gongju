//
//  UICollectionView+Utilities.m
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UICollectionView+Utilities.h"

@implementation UICollectionView (Utilities)

- (void)reloadSection:(NSInteger)section
{
  NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
  [self reloadSections:indexSet];
}

@end
