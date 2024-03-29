//
//  PraiseView.m
//  CAAnimation
//
//  Created by changbo on 2019/9/24.
//  Copyright © 2019 CB. All rights reserved.
//

#import "PraiseView.h"

/**
 1.首先将按钮点击放大缩小，用关键帧动画
 2.点赞的时候添加粒子动画
 */

@interface PraiseView()

@property (nonatomic,strong) UIButton *praiseBtn;

// 关键帧动画
@property (nonatomic,strong) CAKeyframeAnimation *keyframeAnim;

// 粒子动画
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;

@end

@implementation PraiseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self viewLayout];
    }
    return self;
}

- (void)viewLayout {
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _praiseBtn.frame = CGRectMake(0, 0, 40, 40);
    _praiseBtn.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    [_praiseBtn addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_praiseBtn];
    
    [self addExplosionAnimation];
}

- (void)setBtnImage:(UIImage *)aImage selectImage:(UIImage *)selectImage {
    [_praiseBtn setImage:aImage forState:UIControlStateNormal];
    [_praiseBtn setImage:selectImage forState:UIControlStateSelected];
}

// 粒子动画
- (void)addExplosionAnimation {
    
    // 关键帧动画
    _keyframeAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    
    // 粒子动画
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.name = @"explosionCell"; //类似标识符
    cell.lifetime = 0.8; //存活时间
    cell.birthRate = 80; //粒子数量
    cell.velocity = 20;    //开始速度
    cell.velocityRange = 16;  //后面变化速度
    cell.scale = 0.4; //开始大小
    cell.scaleRange = 0.2; //后面变化大小
    //cell.color = [UIColor redColor].CGColor;
    cell.contents = (id)[UIImage imageNamed:@"particle"].CGImage;
    
    
    _emitterLayer = [CAEmitterLayer layer]; // 创建一个发射器
    _emitterLayer.emitterPosition = CGPointMake(CGRectGetWidth(_praiseBtn.bounds)/2.0, CGRectGetHeight(_praiseBtn.bounds)/2.0); // 发射器位置
    _emitterLayer.name = @"emitterAnimation"; //动画名称
    _emitterLayer.emitterShape = kCAEmitterLayerCircle; //喷射形状
    _emitterLayer.emitterMode = kCAEmitterLayerOutline; //向外喷射
    _emitterLayer.emitterSize = CGSizeMake(20, 20);     //发射口大小
    _emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    _emitterLayer.emitterCells = @[cell];
    _emitterLayer.masksToBounds = NO;
    _emitterLayer.zPosition = 0; //层级，默认0
    _emitterLayer.birthRate = 0; //每秒产生粒子数
    
    [_praiseBtn.layer addSublayer:_emitterLayer];
}

- (void)praiseAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _keyframeAnim.values = @[@1.6, @0.8, @1.0, @1.2, @1.0];
        _keyframeAnim.duration = 0.6;
        
        if (self.isExplosion) {
            [self starExplosionAnimation];
        }
    }else {
        _keyframeAnim.values = @[@0.8, @1.0];
        _keyframeAnim.duration = 0.4;
        
        if (self.isExpSure) {
            [self starExplosionAnimation];
        }
    }
    [sender.layer removeAnimationForKey:@"keyframeAnimation"];
    [sender.layer addAnimation:_keyframeAnim forKey:@"keyframeAnimation"];
}

- (void)starExplosionAnimation {
    _emitterLayer.beginTime = CACurrentMediaTime();
    _emitterLayer.birthRate = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.emitterLayer.birthRate = 0;
    });
}

@end
