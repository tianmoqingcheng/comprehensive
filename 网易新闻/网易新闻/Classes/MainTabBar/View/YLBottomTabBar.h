//
//  YLBottomTabBar.h
//  网易新闻
//
//  Created by mac on 15/12/14.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLBottomTabBar;

// 设置协议 - 将自定义内部被点击的按钮索引传给tabBarController.进行切换控制器
@protocol YLBottomTabBarDelegate <NSObject>

@optional
// 代理步骤一 - 定义协议方法
- (void)bottomTabBar:(YLBottomTabBar *)tabBar didClickButtonTabBarWithIndex:(int)index;

@end
@interface YLBottomTabBar : UIView
/** 实现一个通过传入两张图片,添加底部bottomBarBtn的方法 */
- (void)addBottomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected;

/** 代理步骤二 - 设置代理属性 */
@property (nonatomic, weak) id<YLBottomTabBarDelegate> delegate;
@end
