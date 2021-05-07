//
//  HPNavigationBar.m
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

#import "HPNavigationBar.h"
#import "UIColor+HPHex.h"

@implementation HPNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self constructView];
    }
    return self;
}
- (void)constructView {
    // gradient
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.startPoint = CGPointMake(0.1, 0.1);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.colors = @[(__bridge id)[UIColor hexColorFromString:@"#00ADDE"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00B8D6"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00CAC9"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00D6C1"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00E0B8"].CGColor
    ];
    gradientLayer.locations = @[@(0), @(0.24f), @(0.48f), @(0.6f), @(0.85f)];
    self.layer.shadowColor = [UIColor colorWithRed:70/255.0 green:199/255.0 blue:200/255.0 alpha:0.5].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,3);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 9;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
