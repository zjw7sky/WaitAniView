//
//  WaitAniView2.h
//  WaitAni
//
//  Created by zjw7sky on 15/12/14.
//  Copyright © 2015年 zjw7sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitAniView2 : UIView

@property (nonatomic,strong) UIColor *ballColor;
@property (nonatomic,assign) CGFloat ballRadius;

@property (nonatomic,assign) CGFloat duration;


- (void)startAnimation;
- (void)stopAnimation;
@end
