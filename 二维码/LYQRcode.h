//
//  LYQRcode.h
//  
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYQRcode;

@protocol LYQRcodeDelegate <NSObject>
/**
 *  代理回调扫描结果
 *
 *  @param view   扫一扫视图
 *  @param result 扫描结果
 */
- (void)qrcode:(LYQRcode*)view ScanResult:(NSString*)result;

@end
@interface LYQRcode : UIView

@property(nonatomic,assign)id<LYQRcodeDelegate> delegate;


- (void)startScan;
- (void)stopScan;
@end