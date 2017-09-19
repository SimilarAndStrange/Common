//
//  NSObject+MP.m
//  MobileProject
//
//  Created by wujunyang on 16/7/9.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MBProgressHUD+Aorise.h"

#define CHINESE_MBProgressHUD_SYSTEM(x) [UIFont fontWithName:@"Heiti SC" size:x]

@implementation MBProgressHUD (Aorise)

#pragma mark - 加载提示
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message ToView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text=message;
    hud.label.font=CHINESE_MBProgressHUD_SYSTEM(15);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    return hud;
    
}

//加载视图
+ (MBProgressHUD *)showLoadingToView:(UIView *)view{
    return [self showLoadingMessage:@"加载中..." ToView:view];
}

+ (MBProgressHUD *)showToView:(UIView *)view{
    return [self showLoadingMessage:@"" ToView:view];
}

#pragma mark - 自动消失带图提示
+ (MBProgressHUD *)showError:(NSString *)error ToView:(UIView *)view{
   return [self showCustomIcon:@"core_error" Title:error ToView:view];
}

+ (MBProgressHUD *)showSuccess:(NSString *)success ToView:(UIView *)view
{
    return [self showCustomIcon:@"core_success" Title:success ToView:view];
}

+ (MBProgressHUD *)showWarn:(NSString *)Warn ToView:(UIView *)view
{
   return [self showCustomIcon:@"core_waring" Title:Warn ToView:view];
}

+ (MBProgressHUD *)showCustomIcon:(NSString *)iconName Title:(NSString *)title ToView:(UIView *)view
{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    [self hideHUDForView:view];

    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [hud setupCustomIcon:iconName Title:title];
    
    return hud;
}


- (void)setupCustomIcon:(NSString *)iconName Title:(NSString *)title
{
    self.label.text = @"";
    self.detailsLabel.text = title;
    self.detailsLabel.font=CHINESE_MBProgressHUD_SYSTEM(15);
    // 设置图片
    NSString * bundleurl = [[NSBundle mainBundle] resourcePath];
    NSString * path = [NSString stringWithFormat:@"%@/Frameworks/XTesting.framework/Core.bundle/%@",bundleurl,iconName];
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    self.customView = [[UIImageView alloc] initWithImage:image];
    
    // 再设置模式
    self.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    self.removeFromSuperViewOnHide = YES;
    
    // 代表需要蒙版效果
    //self.dimBackground = YES;
    self.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    
    // 2秒之后再消失
    [self hideAnimated:YES afterDelay:2];
}

#pragma mark - 自动消失无图提示
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}


//自动消失提示，无图
+ (MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view{
    return [self showMessage:message ToView:view RemainTime:1 Model:MBProgressHUDModeText];
}

//自动消失提示,自定义停留时间，无图
+(MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time{
   return [self showMessage:message ToView:view RemainTime:time Model:MBProgressHUDModeText];
}

+(MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time Model:(MBProgressHUDMode)model{
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    [self hideHUDForView:view];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text=message;
    hud.label.font=CHINESE_MBProgressHUD_SYSTEM(15);
    //模式
    hud.mode = model;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 代表需要蒙版效果
    //hud.dimBackground = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // X秒之后再消失
    [hud hideAnimated:YES afterDelay:time];
    
    return hud;
}

//自动消失，无图，有消失之后的回调
+ (void)showText:(NSString *)text ToView:(UIView *)view finshed:(void(^)())succesBlock {
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    [self hideHUDForView:view];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = @"";
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = CHINESE_MBProgressHUD_SYSTEM(15);
    
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:hud];
    [hud showAnimated:YES];
    hud.completionBlock = ^() {
        if(succesBlock) {
            succesBlock();
        }
    };
}

@end
