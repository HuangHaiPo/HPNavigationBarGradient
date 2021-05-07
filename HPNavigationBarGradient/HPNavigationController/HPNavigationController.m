//
//  HPNavigationController.m
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

#import "HPNavigationController.h"
#import "UIImage+HPConvert.h"
#import "UIColor+HPHex.h"
#import "HPNavigationBar.h"


@interface HPNavigationController ()

@end

@implementation HPNavigationController
- (void)viewWillAppear:(BOOL)animate{
    [super viewWillAppear:animate];
    ///修改状态栏文字颜色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    /// 直接在self添加渐变视图会遮盖子视图 所有转换为图片 添加为背景图
    [self.navigationBar setBackgroundImage:[UIImage convertViewToImage:[[HPNavigationBar alloc]initWithFrame:CGRectMake(0, -STATUS_BAR_HEIGHT, MN_WIDTH, NAVIGATION_HRIGHT)]] forBarMetrics:UIBarMetricsDefault];
    ///修改导航字体颜色和适配字体大小
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor hexColorFromString:@"#FFFFFF"],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    ///下面的代码写在这无效
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18 * MN_FONT_SCALE],NSForegroundColorAttributeName:[UIColor redColor]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    ///push的隐藏底部tabbar
    if (self.viewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = true;
        self.tabBarController.tabBar.hidden = true;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)dismiss{
    [self.navigationController popViewControllerAnimated:true];
}

@end
