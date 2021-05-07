//
//  UIImage+HPConvert.h
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HPConvert)

/// 把视图转换为图片 比如视图画渐变色 直接添加可能导致遮盖其他子控件 直接转变为图片放到底部即可
/// @param view 需要转换图片的视图
+ (UIImage *)convertViewToImage:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
