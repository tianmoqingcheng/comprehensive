//
//  YLAdViewController.m
//  网易新闻
//
//  Created by mac on 15/12/13.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "YLAdViewController.h"
#import "UIView+HMExtension.h"
#import "YLMainTabBarController.h"

@interface YLAdViewController ()

@end

@implementation YLAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.设置背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Default"]];
    [self.view addSubview:backgroundImageView];
    backgroundImageView.frame = self.view.bounds;
    
    // 2.设置广告图片(真实的广告图片应该先下载广告图片)
    UIImageView *adImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ad"]];
    [self.view addSubview:adImageView];
    // 图片原本的宽高
    adImageView.width = 306;
    adImageView.height = 310;
    adImageView.centerX = self.view.centerX;
    adImageView.centerY = self.view.height * 0.4;
    
    // 3.广告之后,获取主窗口,跳转到 mainTabBarVc
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 3.1 获取主窗口
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        // 3.2 创建UITabBarController
        YLMainTabBarController *mainTabBarVc = [[YLMainTabBarController alloc]init];
        
        // 3.3 设置UIWindow的根控制器为 mainTabBarVc
        window.rootViewController = mainTabBarVc;
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
