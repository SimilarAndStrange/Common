//
//  MBProgressHUD+MP.h
//  MobileProject
//  当引入MBProgressHUD时把下面的代码开放出来
//  使用如下：
//  [MBProgressHUD showIconMessage:@"默认图,X秒后自动消失" ToView:self.view RemainTime:3];
//  如果没有视图则可以[MBProgressHUD showIconMessage:@"默认图,X秒后自动消失" ToView:nil RemainTime:3];
//  [MBProgressHUD showMessage:@"纯文字,不自动消失" ToView:self.view];  关掉则用：[MBProgressHUD hideHUD];//使用此方法进行隐藏
//  MBProgressHUD *hud = [MBProgressHUD showProgressToView:nil Text:@"loading"];  隐藏：[hud hide:YES];
//  [MBProgressHUD showAutoMessage:@"自动消失"];
//  [MBProgressHUD showSuccess:@"下载完成" ToView:self.view];
//  [MBProgressHUD showError:@"下载失败" ToView:self.view];
//  Created by wujunyang on 16/7/9.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "MBProgressHUD.h"

@interface MBProgressHUD (Aorise)

/**
 *  加载视图，文字+菊花提示
 *
 *  @param message 要显示的文字
 *  @param view    要添加的View
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message ToView:(UIView *)view;

/**
 *  加载视图 菊花+加载中...提示
 *
 *  @param view 要添加的View
 */
+ (MBProgressHUD *)showLoadingToView:(UIView *)view;

/**
 加载视图 菊花提示

 @param view 要添加的视图
 */
+ (MBProgressHUD *)showToView:(UIView *)view;

/**
 *  隐藏ProgressView
 *
 *  @param view superView
 */
+ (void)hideHUDForView:(UIView *)view;

/**
 *  快速从window中隐藏ProgressView
 */
+ (void)hideHUD;

/**
 *  自动消失提示，无图
 *
 *  @param message 要显示的文字
 *  @param view    要添加的View
 */
+ (MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view;

/**
 *  自定义停留时间，自动消失，无图
 *
 *  @param message 要显示的文字
 *  @param view 要添加的View
 *  @param time 停留时间
 */
+(MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time;

/**
 文本提示
 
 @param text 显示的文本
 @param view 要添加的view
 @param succesBlock 提示框消失之后的回调
 */
+ (void)showText:(NSString *)text ToView:(UIView *)view finshed:(void(^)())succesBlock;

/**
 *  自定义图片的提示，2s后自动消息
 *
 *  @param title 要显示的文字
 *  @param view 要添加的view
 */
+ (MBProgressHUD *)showCustomIcon:(NSString *)iconName Title:(NSString *)title ToView:(UIView *)view;

/**
 *  自动消失成功提示，带默认图
 *
 *  @param success 要显示的文字
 *  @param view    要添加的view
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success ToView:(UIView *)view;

/**
 *  自动消失错误提示,带默认图
 *
 *  @param error 要显示的错误文字
 *  @param view  要添加的View
 */
+ (MBProgressHUD *)showError:(NSString *)error ToView:(UIView *)view;

/**
 *  自动消失提示,带默认图
 *
 *  @param Warn 要显示的文字
 *  @param view  要添加的View
 */
+ (MBProgressHUD *)showWarn:(NSString *)Warn ToView:(UIView *)view;

@end
