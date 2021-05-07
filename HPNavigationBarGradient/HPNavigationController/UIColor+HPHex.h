//
//  UIColor+HPHex.h
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HPHex)

/// 根据字符串获取颜色的函数 传入16进制的颜色值
/// @param hexValue  颜色字符串形如：“#rrggbb”或“#rrggbbaa”,最后两位为透明度
/// @return 颜色对象指针

+ (UIColor *)hexColorFromString:(NSString *)hexValue;

@end

NS_ASSUME_NONNULL_END
