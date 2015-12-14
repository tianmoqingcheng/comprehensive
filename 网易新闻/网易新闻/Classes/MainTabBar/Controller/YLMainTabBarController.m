//
//  YLMainTabBarController.m
//  网易新闻
//
//  Created by mac on 15/12/14.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "YLMainTabBarController.h"
#import "YLMainViewController.h"
#import "YLReadingTableViewController.h"
#import "YLDiscoverTableViewController.h"
#import "YLVideoViewController.h"
#import "YLMeViewController.h"
#import "YLNavigationController.h"
#import "YLBottomTabBar.h"
#import <UIKit/UIKit.h>


@interface YLMainTabBarController ()<YLBottomTabBarDelegate>

@end

@implementation YLMainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1. 初始化子控制器
    [self setupChildViewControllers];
    
    // 2. 初始化自定义底部TabBar
    [self setupCustomTabBar];
    
    
}

#pragma mark - 初始化子控制器
- (void)setupChildViewControllers
{
    // 加载5个storyboard文件中的导航控制器,并且把这些导航控制器添加到self中
    
    // 1. 新闻中心
    YLNavigationController *navMainHall = [self navigationControllerWithStoryboardName:@"Main"];
    
    // 2. 阅读中心
    YLNavigationController *navReadingHall = [self navigationControllerWithStoryboardName:@"Reading"];
    
    // 3. 视听中心
    YLNavigationController *navDiscoverHall = [self navigationControllerWithStoryboardName:@"Discover"];
    
    // 4. 发现
    YLNavigationController *navVedioHall = [self navigationControllerWithStoryboardName:@"Video"];
    // 5. 我
    YLNavigationController *navMeHall = [self navigationControllerWithStoryboardName:@"Me"];
    // 6. 将上面的这5个控制器添加到HMTabBarController控制器中
    self.viewControllers = @[navMainHall, navReadingHall, navVedioHall, navDiscoverHall, navMeHall];
}

// 封装一个根据storyboard文件名快速创建箭头指向的初始化控制器 (YLNavigationController)
- (YLNavigationController *)navigationControllerWithStoryboardName:(NSString *)name
{
    // 1. 加载storyboard文件
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    // 2. 创建storyboard中箭头指向的初始化控制器, 也就是自定义的导航控制器
    return [storyboard instantiateInitialViewController];
}

#pragma mark - 初始化自定义底部TabBar
- (void)setupCustomTabBar
{
    // 1. 创建自定义的tabBar
    YLBottomTabBar *tabBar = [[YLBottomTabBar alloc]init];
    
    // 2. 通过循环来创建若干个tabBarButton (自定义tabBar按钮)
    NSUInteger count = self.viewControllers.count;
    for (int i = 0; i < count; i++) {
        // 获取普通图片和选中图片的名称
        NSString *normal = [NSString stringWithFormat:@"TabBar%d",(i+1)];
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel",(i + 1)];
        // 调用内部封装的方法来快速创建自定义tabBar按钮
        [tabBar addBottomBarButtonWithImage:normal selected:selected];
    }
    
    // 3. 设置frame并添加到系统的tabBar中
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    
    // 代理步骤四 - 设置当前控制器为tabBar的代理
    tabBar.delegate = self;
}

#pragma mark -  <HMBottomTabBarDelegate>
// 代理步骤六 - 实现协议方法
- (void)bottomTabBar:(YLBottomTabBar *)tabBar didClickButtonTabBarWithIndex:(int)index
{
    // 让UITabBarController自己来切换需要显示的子控制器 selectedIndex是系统内部自己的属性
    self.selectedIndex = index;
}


@end
