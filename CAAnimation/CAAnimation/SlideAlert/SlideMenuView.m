//
//  SlideMenuView.m
//  CAAnimation
//
//  Created by changbo on 2019/9/30.
//  Copyright © 2019 CB. All rights reserved.
//

#import "SlideMenuView.h"

// 屏幕size
#define MainSize ([UIScreen mainScreen].bounds.size)

// 弹框高度
#define MenuHeight 260

// 绘制内容比父视图小一些才有弹性
#define DiffSpace  20


@interface SlideMenuView()

// 父视图
@property (nonatomic,strong) UIWindow *aWindow;

// 模糊背景
@property (nonatomic,strong) UIVisualEffectView *effectView;

// 辅助视图1
@property (nonatomic,strong) UIView *helper1View;

// 辅助视图2
@property (nonatomic,strong) UIView *helper2View;

// 频率计时器
@property (nonatomic,strong) CADisplayLink *display;

// 弹性差值
@property (nonatomic,assign) CGFloat diff;


@end

@implementation SlideMenuView

- (void)dealloc {
    [self.helper1View removeFromSuperview];
    [self.helper2View removeFromSuperview];
    [self.effectView removeFromSuperview];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self viewLayout];
    }
    return self;
}

- (void)viewLayout {
    _aWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, MainSize.height, MainSize.width, MenuHeight);
    self.backgroundColor = [UIColor clearColor];
    
    _effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _effectView.frame = CGRectMake(0, 0, MainSize.width, MainSize.height);
    _effectView.alpha = 0;
    [_aWindow addSubview:_effectView];
    [_aWindow addSubview:self];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
    [_effectView addGestureRecognizer:tap];
    
    _helper1View = [[UIView alloc] initWithFrame:CGRectMake(0, MainSize.height, 40, 40)];
    _helper2View = [[UIView alloc] initWithFrame:CGRectMake((MainSize.width-40)/2.0, MainSize.height, 40, 40)];
    _helper1View.backgroundColor = [UIColor clearColor];
    _helper2View.backgroundColor = [UIColor clearColor];
    [_aWindow addSubview:_helper1View];
    [_aWindow addSubview:_helper2View];
}

- (void)showAcition {
    // 菜单栏滑入
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, MainSize.height-MenuHeight, MainSize.width, MenuHeight);
        self.effectView.alpha = 1;
    }];
    
    // 添加弹簧动画
    [UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.6 initialSpringVelocity:.9 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.helper1View.frame = CGRectMake(0, MainSize.height-MenuHeight, 40, 40);
    } completion:nil];
    [UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.helper2View.frame = CGRectMake((MainSize.width-40)/2.0, MainSize.height-MenuHeight, 40, 40);
    } completion:^(BOOL finished) {
        [self removeDisplayLink];
    }];
    
    // 获取弹性差值
    [self getDisplay];
    
    // item menu
    [self itemMenuButon];
}

// add displayLink
- (void)getDisplay {
    if (!_display) {
        _display = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
        [_display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

// remove displayLink
- (void)removeDisplayLink{
    [_display invalidate];
    _display = nil;
}

- (void)displayLinkAction:(CADisplayLink *)sender {
    CALayer *layer1 = self.helper1View.layer.presentationLayer;
    CALayer *layer2 = self.helper2View.layer.presentationLayer;
    self.diff = layer1.frame.origin.y - layer2.frame.origin.y;
    
    NSLog(@"%f",self.diff);
    [self setNeedsDisplay];
}

// 绘制动画
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, MainSize.height)];
    [path addLineToPoint:CGPointMake(0, DiffSpace)];
    [path addQuadCurveToPoint:CGPointMake(MainSize.width, DiffSpace) controlPoint:CGPointMake(MainSize.width/2.0, DiffSpace+self.diff)];
    [path addLineToPoint:CGPointMake(MainSize.width, MainSize.height)];
    [path closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    UIColor *menuColor = [UIColor colorWithRed:0 green:0.722 blue:1 alpha:1];
    [menuColor set];
    CGContextFillPath(context);
}

- (void)dismissView {
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, MainSize.height, MainSize.width, MenuHeight);
        self.effectView.alpha = 0;
        self.helper1View.frame = CGRectMake(0, MainSize.height, 40, 40);
        self.helper2View.frame = CGRectMake((MainSize.width-40)/2.0, MainSize.height, 40, 40);
    }];
}

//
- (void)itemMenuButon {
    for (int i=0; i<self.menuItems.count; i++) {
        UIButton *btn = self.menuItems[i];
        btn.transform = CGAffineTransformMakeTranslation(0, 90);
        [UIView animateWithDuration:.7 delay:i*(0.3/self.menuItems.count) usingSpringWithDamping:.6 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            btn.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
}

@end
