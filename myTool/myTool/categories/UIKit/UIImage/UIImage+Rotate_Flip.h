//
//  UIImage+Rotate_Flip.h
//  myTool
//
//  Created by lianyangyang on 16/9/26.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate_Flip)


/*
 * @brief rotate image 90 withClockWise
 */
- (UIImage*)rotate90Clockwise;

/*
 * @brief rotate image 90 counterClockwise
 */
- (UIImage*)rotate90CounterClockwise;

/*
 * @brief rotate image 180 degree
 */
- (UIImage*)rotate180;

/*
 * @brief rotate image to default orientation
 */
- (UIImage*)rotateImageToOrientationUp;

/*
 * @brief flip horizontal
 */
- (UIImage*)flipHorizontal;

/*
 * @brief flip vertical
 */
- (UIImage*)flipVertical;

/*
 * @brief flip horizontal and vertical
 */
- (UIImage*)flipAll;



typedef NS_ENUM(NSInteger, SvCropMode){
    // the image size will be equal to orignal image, some part of image may be cliped
    // clip模式下，旋转后的图片和原图一样大，部分图片区域会被裁剪掉
    enSvCropClip,
    
    // the image size will expand to contain the whole image, remain area will be transparent
    //expand模式下，旋转后的图片可能会比原图大，所有的图片信息都会保留，剩下的区域会是全透明的
    enSvCropExpand,
};

- (UIImage*)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode;

@end





