//
//  ShakeView.m
//  CAAnimation
//
//  Created by changbo on 2019/9/23.
//  Copyright © 2019 CB. All rights reserved.
//

#import "ShakeView.h"


#define AngleTo(angle)  ((angle)/180.0*M_PI)

@interface ShakeView()


@property (nonatomic,strong) UIImageView *iconImage;

// 关键帧动画
@property (nonatomic,strong) CAKeyframeAnimation *keyframeAnim;

@property (nonatomic,assign) BOOL isStarAnim;

@end

@implementation ShakeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self viewLayout];
    }
    return self;
}

- (void)viewLayout {
    _iconImage = [[UIImageView alloc] initWithFrame:self.bounds];
    _iconImage.image = [UIImage imageNamed:@"cat"];
    _iconImage.contentMode = UIViewContentModeScaleAspectFill;
    _iconImage.userInteractionEnabled = YES;
    _iconImage.layer.cornerRadius = 10;
    _iconImage.layer.masksToBounds = YES;
    [self addSubview:_iconImage];
    
    UITapGestureRecognizer *tapPress = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPressAction:)];
    [_iconImage addGestureRecognizer:tapPress];
    
    // 关键帧动画
    _keyframeAnim = [CAKeyframeAnimation animation];
    _keyframeAnim.keyPath = @"transform.rotation";
    _keyframeAnim.values = @[@AngleTo(-20),@AngleTo(20)];
    _keyframeAnim.autoreverses = YES;     // 返回的时候也执行动画
    _keyframeAnim.duration = 0.4;         // 持续时间
    _keyframeAnim.repeatCount = MAXFLOAT; // 重复次数
}


- (void)tapPressAction:(UITapGestureRecognizer *)sender {
    self.isStarAnim = !self.isStarAnim;
    if (self.isStarAnim) {
        [self.iconImage.layer addAnimation:_keyframeAnim forKey:@"CAKeyframeAnimation"];
    }else {
        [self.iconImage.layer removeAnimationForKey:@"CAKeyframeAnimation"];
    }
}


@end
