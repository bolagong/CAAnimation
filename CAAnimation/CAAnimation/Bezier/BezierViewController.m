//
//  BezierViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/8.
//  Copyright © 2019 CB. All rights reserved.
//

#import "BezierViewController.h"

@interface BezierViewController ()

@end

@implementation BezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self backAction];
    
    // 贝塞尔曲线画人
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 190)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    [self matchPeopelWithSuperView:bgView];
}


- (void)matchPeopelWithSuperView:(UIView *)aView {
    
    CGSize mSize = aView.bounds.size;
    CGFloat radius = 30;
    
    // 推手人
    CGFloat aLeft = mSize.width/4.0;
    UIBezierPath *bezier0 = [UIBezierPath bezierPath];
    [bezier0 moveToPoint:CGPointMake(aLeft+radius, 10+radius)]; //起点
    [bezier0 addArcWithCenter:CGPointMake(aLeft, 10+radius) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES]; // 顺时针
    CGFloat sTop = 10+radius+radius;
    [bezier0 moveToPoint:CGPointMake(aLeft, sTop)]; //设置起点
    [bezier0 addLineToPoint:CGPointMake(aLeft, sTop+30)]; //竖线
    [bezier0 addLineToPoint:CGPointMake(aLeft-36, sTop+30+56)]; //左腿
    [bezier0 moveToPoint:CGPointMake(aLeft, sTop+30)]; //设置起点
    [bezier0 addLineToPoint:CGPointMake(aLeft+36, sTop+30+56/2.0)]; //右腿
    [bezier0 addLineToPoint:CGPointMake(aLeft+36-20, sTop+30+56/2.0+38)]; //右腿
    [bezier0 moveToPoint:CGPointMake(aLeft, sTop+30/2.0)]; //设置起点
    [bezier0 addLineToPoint:CGPointMake(aLeft+30, sTop+30/2.0)]; //横线
    [bezier0 addLineToPoint:CGPointMake(aLeft+30+20, sTop+30/2.0-20)]; //上斜线
    [bezier0 moveToPoint:CGPointMake(aLeft+30, sTop+30/2.0)]; //设置起点
    [bezier0 addLineToPoint:CGPointMake(aLeft+30+20, sTop+30/2.0+20)]; //上斜线
    
    CAShapeLayer *shape0 = [CAShapeLayer layer];
    shape0.path = bezier0.CGPath;
    shape0.strokeColor = [UIColor redColor].CGColor; //画笔颜色
    shape0.lineWidth = 2;
    shape0.fillColor = [UIColor clearColor].CGColor;
    shape0.lineCap = kCALineCapRound; //两个端点是圆的
    shape0.lineJoin = kCALineJoinRound; //两个连接点是圆的
    [aView.layer addSublayer:shape0];
    
    
    // 心❤️
    CGFloat mTop = 58;
    CGFloat mX = mSize.width/2.0-40;
    CGFloat mR = 16; //小圆半径
    UIBezierPath *bezier1 = [UIBezierPath bezierPath];
    [bezier1 moveToPoint:CGPointMake(mX, mTop+mR)]; //起点
    // 开始度数 旋转 依次为：（0）（M_PI/2.0）（M_PI）（M_PI*2）我们只需要上半圆即可，clockwise：yes顺时针
    [bezier1 addArcWithCenter:CGPointMake(mX+mR, mTop+mR) radius:mR startAngle:M_PI endAngle:M_PI*2 clockwise:YES]; // 左半圆
    [bezier1 addArcWithCenter:CGPointMake(mX+mR*3, mTop+mR) radius:mR startAngle:M_PI endAngle:M_PI*2 clockwise:YES]; // 右半圆
    [bezier1 addQuadCurveToPoint:CGPointMake(mX+mR*2, mTop+mR+42) controlPoint:CGPointMake(mX+mR*2+32, mTop+mR+42-13)]; // 右半弧
    [bezier1 moveToPoint:CGPointMake(mX, mTop+mR)]; //起点
    [bezier1 addQuadCurveToPoint:CGPointMake(mX+mR*2, mTop+mR+42) controlPoint:CGPointMake(mX+mR*2-32, mTop+mR+42-13)]; // 左半弧
    
    
    CAShapeLayer *mShape = [CAShapeLayer layer];
    mShape.path = bezier1.CGPath;
    mShape.strokeColor = [UIColor redColor].CGColor; //画笔颜色
    mShape.lineWidth = 2;
    mShape.fillColor = [UIColor clearColor].CGColor;
    mShape.lineCap = kCALineCapRound; //两个端点是圆的
    mShape.lineJoin = kCALineJoinRound; //两个连接点是圆的
    [aView.layer addSublayer:mShape];
    
    
    // 火柴人
    CGFloat aX = mSize.width*3/4.0;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(aX+radius, 10+radius)]; //起点
    [bezierPath addArcWithCenter:CGPointMake(aX, 10+radius) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES]; // 顺时针
    CGFloat sY = 10+radius+radius;
    [bezierPath moveToPoint:CGPointMake(aX, sY)]; //设置起点
    [bezierPath addLineToPoint:CGPointMake(aX, sY+30)]; //竖线
    [bezierPath addLineToPoint:CGPointMake(aX-30, sY+30+50)]; //左腿
    [bezierPath moveToPoint:CGPointMake(aX, sY+30)]; //设置起点
    [bezierPath addLineToPoint:CGPointMake(aX+30, sY+30+50)]; //右腿
    [bezierPath moveToPoint:CGPointMake(aX-40, sY+30/2.0)]; //设置起点
    [bezierPath addLineToPoint:CGPointMake(aX+40, sY+30/2.0)]; //横线
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor; //画笔颜色
    shapeLayer.lineWidth = 2;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound; //两个端点是圆的
    shapeLayer.lineJoin = kCALineJoinRound; //两个连接点是圆的
    [aView.layer addSublayer:shapeLayer];
}

- (void)backAction {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 40, 50, 40);
    backBtn.backgroundColor = [UIColor lightTextColor];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
