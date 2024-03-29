//
//  CircleTransition.m
//  CAAnimation
//
//  Created by changbo on 2019/10/9.
//  Copyright © 2019 CB. All rights reserved.
//

#import "CircleTransition.h"
#import "TransitionOneViewController.h"
#import "TransitionTwoViewController.h"


@interface CircleTransition ()<CAAnimationDelegate>

@property (nonatomic,strong) id<UIViewControllerContextTransitioning> transContext;

@end


@implementation CircleTransition

// 计算两点距离
CGFloat DistanceBetweenPoints(CGPoint first, CGPoint second) {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY);
};


#pragma mark -- UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 持有上下文
    self.transContext = transitionContext;
    
    // 获取点击的按钮，fromVC(跳转的控制器)，toVC(要跳转到的控制器)
    UIButton *clickBtn = nil;
    TransitionOneViewController *fromVC = nil;
    TransitionTwoViewController *toVC = nil;
    if (self.isPush) {
        fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        clickBtn = fromVC.oneBtn;
    }else {
        toVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        fromVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        clickBtn = toVC.twoBtn;
    }
    
    // 获取view容器
    UIView *containerView = [transitionContext containerView];
    // 添加到容器里面
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    // 获取大圆的半径（也就是圆心在屏幕上所达到的最大直线距离）
    UIViewController *aToVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 判断aToVC四个角(相当屏幕四个角)和当前的点击按钮中心点计算出直线距离，那一个直线距离远，那么它就是大圆半径
    CGPoint point0 = CGPointMake(0, 0);
    CGPoint point1 = CGPointMake(CGRectGetWidth(aToVC.view.bounds), 0);
    CGPoint point2 = CGPointMake(CGRectGetWidth(aToVC.view.bounds), CGRectGetHeight(aToVC.view.bounds));
    CGPoint point3 = CGPointMake(0, CGRectGetHeight(aToVC.view.bounds));
    
    CGFloat distance0 = DistanceBetweenPoints(clickBtn.center, point0);
    CGFloat distance1 = DistanceBetweenPoints(clickBtn.center, point1);
    CGFloat distance2 = DistanceBetweenPoints(clickBtn.center, point2);
    CGFloat distance3 = DistanceBetweenPoints(clickBtn.center, point3);
    
    CGFloat radius = MAX(MAX(distance0, distance1), MAX(distance2, distance3));
    
    // 画出小圆(点击按钮大小的那个圆)
    UIBezierPath *smallPath = [UIBezierPath bezierPathWithOvalInRect:clickBtn.frame];
    // 大小圆的圆心是同一个
    CGPoint aCenter = clickBtn.center;
    // 画大圆
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithArcCenter:aCenter radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    if (self.isPush) {
        shapeLayer.path = bigPath.CGPath;
    }else {
        shapeLayer.path = smallPath.CGPath;
    }
    
    // 添加蒙板
    UIViewController *aVC = nil;
    if (self.isPush) {
        aVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }else {
        aVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    }
    aVC.view.layer.mask = shapeLayer;
    
    // 添加Layero动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    if (self.isPush) {
        anim.fromValue = (id)smallPath.CGPath;
    }else {
        anim.fromValue = (id)bigPath.CGPath;
    }
    anim.duration = [self transitionDuration:self.transContext];
    anim.delegate = self;
    [shapeLayer addAnimation:anim forKey:nil];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // 执行完成动画
    [self.transContext completeTransition:flag];
    
    // 去掉设置的蒙板
    if (self.isPush) {
        UIViewController *toVC = [self.transContext viewControllerForKey:UITransitionContextToViewControllerKey];
        toVC.view.layer.mask = nil;
    }else {
        UIViewController *fromVC = [self.transContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        fromVC.view.layer.mask = nil;
    }
}

@end
