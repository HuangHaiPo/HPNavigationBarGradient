//
//  UIImage+HPConvert.m
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

#import "UIImage+HPConvert.h"

@implementation UIImage (HPConvert)

+ (UIImage *)convertViewToImage:(UIView *)view{
    CGSize size = view.bounds.size;
    /**
     * size: 表示区域大小
     * opaque: 是否透明, NO - 半透明, YES - 非透明
     * scale: 屏幕密度(几倍像素)
     */
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
