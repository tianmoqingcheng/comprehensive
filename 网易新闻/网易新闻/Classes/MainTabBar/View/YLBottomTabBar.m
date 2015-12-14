//
//  YLBottomTabBar.m
//  网易新闻
//
//  Created by mac on 15/12/14.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "YLBottomTabBar.h"
#import "YLBottomTabBarBtn.h"
#import "UIView+HMExtension.h"

@interface YLBottomTabBar()
// 记录当前被选中的tabBarBtn
@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation YLBottomTabBar

- (void)addBottomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected
{
    // 1. 创建一个按钮
    YLBottomTabBarBtn *btn = [[YLBottomTabBarBtn alloc]init];
    
    // 2. 设置按钮的背景图片
    [btn setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    // 3. 把按钮添加到底部的bottomTabBar中
    [self addSubview:btn];
    
    // 3. 为按钮绑定一个点击事件
    [btn addTarget:self action:@selector(didClickTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
}

// tabBarBtn点击事件
- (void)didClickTabBarButton:(UIButton *)button
{
    // 1. 让当前被选中的按钮取消选中状态
    self.selectedButton.selected = NO;
    // 2. 设置传进来的按钮为选中状态
    button.selected = YES;
    // 3. 记录传进来的按钮为当前选中的按钮
    self.selectedButton = button;
    
    // 4. 获取当前被点击的按钮索引,调用代理的协议方法,让tabBarController来切换当前显示的子控制器
    int index = (int)button.tag;
    // 代理步骤三 - 判断代理是否实现了协议中的方法,如果实现了,就调用!
    if ([self.delegate respondsToSelector:@selector(bottomTabBar:didClickButtonTabBarWithIndex:)]) {
        [self.delegate bottomTabBar:self didClickButtonTabBarWithIndex:index];
    }
}

#pragma mark - 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 获取总按钮的长度
    NSUInteger count = self.subviews.count;
    
    // 设置frame
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    CGFloat y = 0;
    for (int i = 0; i < count; i++) {
        CGFloat x = i * w;
        // 获取对应的按钮,设置frame
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(x, y, w, h);
        
        // 为每一个按钮绑定一个tag值
        button.tag = i;
        
        // 如果按钮为第0个,那么就设置第0个按钮为当前选中状态
        if (i == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }


}


@end
