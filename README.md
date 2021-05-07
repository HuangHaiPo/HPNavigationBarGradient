### 实现渐变色的导航栏

*   效果图
![渐变色](https://upload-images.jianshu.io/upload_images/1483397-295fc53d25f4af5f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)


*   直接在navigationBar上添加一个渐变色View会导致遮盖导航上的标题和按钮，所以直接把渐变色view转换为图片设置为导航栏的背景图片，可以很方便解决上面的问题。

*   主要流程是在UIView上添加渐变色，然后把渐变色视图转变为图片，然后添加为NavigationBar的背景图片即可。

##### 渐变色

渐变色使用的`CAGradientLayer`绘制，主要属性有开始渐变的位置和结束渐变的位置，用来控制颜色渐变的方向.方向是由起始坐标`(startPoint)`指向结束坐标`(endPoint)`

```objective-c
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
```
![起始和结束坐标说明](https://upload-images.jianshu.io/upload_images/1483397-571d56d01b617b55.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)
* 左上角开始到右边中间结束
```
 gradientLayer.startPoint = CGPointMake(0.1, 0.1);
 gradientLayer.endPoint = CGPointMake(1, 0.5);
```
* colors`(数组)`设置渐变色颜色组，CGColor类型。
* locations`(数组)`可为空，用来控制颜色占比和颜色组中的颜色显示的位置的，传NSnumber类型的数字 0 ~ 1，正常来说是和`colors`数组对应的。
```objective-c
 gradientLayer.colors = @[(__bridge id)[UIColor hexColorFromString:@"#00ADDE"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00B8D6"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00CAC9"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00D6C1"].CGColor,
                             (__bridge id)[UIColor hexColorFromString:@"#00E0B8"].CGColor
    ];
gradientLayer.locations = @[@(0), @(0.24f), @(0.48f), @(0.6f), @(0.85f)];
```
##### 设置渐变色导航栏
渐变色视图画好后，我们只需要直接添加到导航控制器的navigationBar上即可。或者直接新建一个继承自`UINavigationController`的类，直接在上面添加如下。
```objective-c
/// 直接在self添加渐变视图会遮盖子视图 所有转换为图片 添加为背景图
[self.navigationBar setBackgroundImage:[UIImage convertViewToImage:[[HPNavigationBar alloc]initWithFrame:CGRectMake(0, -STATUS_BAR_HEIGHT, MN_WIDTH, NAVIGATION_HRIGHT)]] forBarMetrics:UIBarMetricsDefault];
```
* 视图转换为图片方法

```objective-c
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
```