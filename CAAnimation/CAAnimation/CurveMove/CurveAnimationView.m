//
//  CurveAnimationView.m
//  CAAnimation
//
//  Created by changbo on 2019/9/24.
//  Copyright © 2019 CB. All rights reserved.
//

#import "CurveAnimationView.h"

@interface CurveAnimationView()

@property (nonatomic,strong) CALayer *moveLayer;

// 帧动画
@property (nonatomic,strong) CAKeyframeAnimation *keyframeAnimation;

@end

@implementation CurveAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self curveAnimation];
    }
    return self;
}

- (void)curveAnimation {
    CGFloat mW = self.bounds.size.width;
    CGFloat mH = self.bounds.size.height;
    CGFloat mX = 20;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(mX, 80)];
    [path addCurveToPoint:CGPointMake(mW-mX, 80) controlPoint1:CGPointMake(mX+(mW-mX*2)/4.0, -mH/2) controlPoint2:CGPointMake(mX+(mW-mX*2)*3/4.0, mH+mH/2)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    _moveLayer = [CALayer layer];
    _moveLayer.frame = CGRectMake(0, 76, 30, 30);
    _moveLayer.backgroundColor = [UIColor orangeColor].CGColor;
    _moveLayer.anchorPoint = CGPointMake(0.5, 0.96); //设置锚点
    //_moveLayer.cornerRadius = 30/2.0;
    //_moveLayer.masksToBounds = YES;
    [self.layer addSublayer:_moveLayer];
    
    // 帧动画
    _keyframeAnimation = [CAKeyframeAnimation animation];
    _keyframeAnimation.keyPath = @"position";
    _keyframeAnimation.path = path.CGPath;
    _keyframeAnimation.duration = 4;
    _keyframeAnimation.rotationMode = kCAAnimationRotateAuto; //根据path方向自动旋转角度
    _keyframeAnimation.autoreverses = YES;  // 自动返回
    
    UIButton *beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beginBtn.frame = CGRectMake(mX+200, 20, 50, 30);
    beginBtn.backgroundColor = [UIColor blueColor];
    [beginBtn setTitle:@"move" forState:UIControlStateNormal];
    beginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [beginBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [beginBtn addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    beginBtn.selected = YES;
    [self addSubview:beginBtn];
}


- (void)starAction:(UIButton *)sender {
    if (sender.selected) {
        [_moveLayer addAnimation:_keyframeAnimation forKey:@"keyframeAnimation"];
    }else {
        [_moveLayer removeAnimationForKey:@"keyframeAnimation"];
    }
    sender.selected = !sender.selected;
}

@end
