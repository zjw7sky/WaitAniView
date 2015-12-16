//
//  WaitAniView2.m
//  WaitAni
//
//  Created by zjw7sky on 15/12/14.
//  Copyright © 2015年 zjw7sky. All rights reserved.
//

#import "WaitAniView2.h"

@interface WaitAniView2 ()

@property (nonatomic, strong) CALayer *ball1;

@property (nonatomic, strong) CALayer *ball2;

@property (nonatomic, strong) CALayer *ball3;


@property (nonatomic, assign) BOOL enableAni;

@end

@implementation WaitAniView2

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ballColor = [UIColor redColor];
        _ballRadius = 6;
        _duration = 1;
        
        CGRect rect = CGRectMake(0, 0, _ballRadius, _ballRadius);
        
        CALayer *ball2 = [[CALayer alloc]init];
        ball2.bounds = rect;
        ball2.position = self.center;
        ball2.cornerRadius = _ballRadius / 2; // 成为圆形
        ball2.backgroundColor = _ballColor.CGColor;
        [self.layer addSublayer:ball2];
        _ball2 = ball2;
        
        CALayer *ball1 = [[CALayer alloc] init];
        ball1.bounds = rect;
        ball1.position = CGPointMake(ball2.position.x - (2*_ballRadius),ball2.position.y);
        ball1.cornerRadius = _ballRadius / 2; // 成为圆形
        ball1.backgroundColor = _ballColor.CGColor;
        [self.layer addSublayer:ball1];
        _ball1 = ball1;
        
        
        CALayer *ball3 = [[CALayer alloc] init];
        ball3.bounds = rect;
        ball3.position = CGPointMake(ball2.position.x + (2*_ballRadius),ball2.position.y);
        ball3.cornerRadius = _ballRadius / 2; // 成为圆形
        ball3.backgroundColor = _ballColor.CGColor;
        [self.layer addSublayer:ball3];
        _ball3 = ball3; 
        
    }
    return self;
}
#pragma mark - func
-(void)setBallColor:(UIColor *)ballColor{
    _ballColor = ballColor;
    _ball1.backgroundColor = _ballColor.CGColor;
    _ball2.backgroundColor = _ballColor.CGColor;
    _ball3.backgroundColor = _ballColor.CGColor;
}

- (void)setBallRadius:(CGFloat)ballRadius{
    _ballRadius = ballRadius;
}


#pragma mark - main


- (void)startAnimation{
    _enableAni = YES;
    
    CGPoint center = self.center;
    CGPoint center1 = CGPointMake(center.x - (_ballRadius*2), center.y);
    CGPoint center3 = CGPointMake(center.x + (_ballRadius*2), center.y);
    
    CGFloat radius = _ballRadius;
    
    CGPoint centerLeft = CGPointMake(center.x  - radius, center.y);
    CGPoint centerRight = CGPointMake(center.x + radius, center.y);
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:center1];
    path1.lineCapStyle = kCGLineCapRound;  //线条拐角
    [path1 addCurveToPoint:center3 controlPoint1:CGPointMake(center.x, center.y - (3 *radius)) controlPoint2:CGPointMake(center.x, center.y + (3 *radius) )];
    CAKeyframeAnimation *animation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.path = path1.CGPath;
    animation1.duration = _duration; 
    animation1.removedOnCompletion = YES;
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:centerLeft radius:radius startAngle:0 endAngle:M_PI clockwise:YES];
    CAKeyframeAnimation *animation2 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.path = path2.CGPath;
    animation2.duration = _duration;
    animation2.removedOnCompletion = YES;
    
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:centerRight radius:radius startAngle:0 endAngle:M_PI clockwise:NO];
    CAKeyframeAnimation *animation3 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation3.path = path3.CGPath;
    animation3.duration = _duration;
    animation3.removedOnCompletion = YES;
    animation3.delegate = self;
    
//    if (_ball1.position.x == center1.x ) {
        [_ball1 addAnimation:animation1 forKey:@"animation"];
        [_ball2 addAnimation:animation2 forKey:@"animation"];
        [_ball3 addAnimation:animation3 forKey:@"animation"];
//    }
//    else if(_ball2.position.x == center1.x){
//        [_ball1 addAnimation:animation3 forKey:@"animation"];
//        [_ball2 addAnimation:animation1 forKey:@"animation"];
//        [_ball3 addAnimation:animation2 forKey:@"animation"];
//    }else if(_ball3.position.x == center1.x){
//        [_ball1 addAnimation:animation2 forKey:@"animation"];
//        [_ball2 addAnimation:animation3 forKey:@"animation"];
//        [_ball3 addAnimation:animation1 forKey:@"animation"];
//    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_duration/2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_enableAni) {
            [self startAnimation];
        }
    });
}
- (void)stopAnimation{
    [_ball1 removeAllAnimations];
    [_ball2 removeAllAnimations];
    [_ball3 removeAllAnimations];
    _enableAni = NO;
}
@end
