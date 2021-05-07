//
//  ViewController.m
//  HPNavigationBarGradient
//
//  Created by 黄海泼 on 2021/5/6.
//

///当前手机是否是苹果
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
///当前型号是否是iPhone X以上的型号
#define Is_IPhoneX (MN_WIDTH >=375.0f && MN_HEIGHT >=812.0f && Is_Iphone)
///状态栏高度
#define STATUS_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)
///手机可见窗口宽度
#define MN_WIDTH [UIScreen mainScreen].bounds.size.width
///手机可见窗口高度
#define MN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define NAVIGATION_HRIGHT (Is_IPhoneX ? (STATUS_BAR_HEIGHT + 44.0f) : (44.0f + 20.0f))

#import "ViewController.h"
#import "UIImage+HPConvert.h"
#import "UIColor+HPHex.h"
#import "HPNavigationBar.h"
#import "HPViewController.h"
#import "HPNavigationController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航背景渐变色";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)jumpBtnClick:(UIButton *)sender {
    [self.navigationController pushViewController:[NSClassFromString(@"HPViewController") new] animated:true];
}

@end
