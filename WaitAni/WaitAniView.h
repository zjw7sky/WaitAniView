//
//  WaitAniView.h
//  WaitAni
//
//  Created by zjw7sky on 15/12/14.
//  Copyright © 2015年 zjw7sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitAniView : UIView

/** 球的颜色 */
@property (nonatomic,strong) UIColor *ballColor;

/** 展示加载动画*/
- (void)showHub;

/**
 *  关闭加载动画
 */
- (void)dismissHub;

@end
