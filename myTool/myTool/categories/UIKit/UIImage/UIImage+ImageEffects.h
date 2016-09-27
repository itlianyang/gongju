//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

- (UIImage *)applySubtleEffect;
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

/// 将view转换成图片
+(UIImage*)convertViewToImage:(UIView*)view;

/// 在图片中添加文字
+ (UIImage *)addTextToImage:(UIImage *)img
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                   textFont:(UIFont *)textFont
                 textCenter:(CGPoint)textCenter;

/// 生成圆角矩形虚线图片
+ (UIImage *)image_SquareShapeLayerRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;

/// 生成圆角矩形实线图片
+ (UIImage *)image_SquareLineRect:(CGRect)rect color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius lineWidth:(CGFloat)lineWidth;

//+ (UIImage *)image_SquareDottedLineBorderRect:(CGRect)rect
//                                        color:(UIColor *)color
//                                 cornerRadius:(CGFloat)cornerRadius
//                                    lineWidth:(CGFloat)lineWidth
//                                  dashPattern:(NSArray *)dashPattern;

+ (UIImage *)renderImageWithColor:(UIColor *)color;
+ (UIImage *)renderImageWithColor:(UIColor *)color inSize:(CGSize)size;
+ (UIImage *)renderImageWithColor:(UIColor *)color inSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

- (UIImage *)renderImageWithCornerRadius:(NSInteger)cornerRadius;

@end

