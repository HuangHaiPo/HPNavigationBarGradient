//
//  UIColor+HPHex.m
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

#import "UIColor+HPHex.h"

@implementation UIColor (HPHex)

+ (UIColor *)hexColorFromString:(NSString *)hexValue {
    if ([hexValue length] == 0) {
        return [UIColor clearColor];
    }
    if ( [hexValue rangeOfString:@"#"].location != 0){
        // error
        return [UIColor redColor];
    }
    if ([hexValue length] == 7){
        hexValue = [hexValue stringByAppendingString:@"FF"];
    }
    if ([hexValue length] != 9){
        // error
        return [UIColor redColor];
    }
    const char * strBuf= [hexValue UTF8String];
    
    unsigned long iColor = strtoul((strBuf+1), NULL, 16);
    typedef struct colorByte{
        unsigned char a;
        unsigned char b;
        unsigned char g;
        unsigned char r;
    }CLRBYTE;
    
    CLRBYTE  pclr ;
    memcpy(&pclr, &iColor, sizeof(CLRBYTE));
    
    return [UIColor colorWithRed:(pclr.r/255.0)
                           green:(pclr.g/255.0)
                            blue:(pclr.b/255.0)
                           alpha:(pclr.a/255.0)];
}

@end
