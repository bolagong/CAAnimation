//
//  TransitionOneViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/9.
//  Copyright © 2019 CB. All rights reserved.
//

#import "TransitionOneViewController.h"
#import "TransitionTwoViewController.h"
#import "CircleTransition.h"


@interface TransitionOneViewController ()<UINavigationControllerDelegate>

@end

@implementation TransitionOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.24 green:0.34 blue:0.26 alpha:1];
    
    // 返回按钮
    [self backAction];
    
    // 跳转按钮
    CGSize mSize = [UIScreen mainScreen].bounds.size;
    _oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _oneBtn.frame = CGRectMake((mSize.width-100)/2.0, mSize.height-20-100, 100, 100);
    _oneBtn.backgroundColor = [UIColor brownColor];
    [_oneBtn setTitle:@"Push" forState:UIControlStateNormal];
    [_oneBtn addTarget:self action:@selector(goNext:) forControlEvents:UIControlEventTouchUpInside];
    _oneBtn.layer.cornerRadius = _oneBtn.bounds.size.width/2.0;
    _oneBtn.layer.masksToBounds = YES;
    [self.view addSubview:_oneBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 实现代理和协议
    self.navigationController.delegate = self;
}

- (void)goNext:(UIButton *)sender {
    TransitionTwoViewController *twoVC = [[TransitionTwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}


#pragma mark - UINavigationControllerDelegate
// 通过nav的delegate 自定义转场动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    // 如果是push就自定义
    if (operation == UINavigationControllerOperationPush) {
        CircleTransition *trans = [CircleTransition new];
        trans.isPush = YES;
        return trans;
    }
    
    return nil;
}










- (void)backAction {
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat BarHeight = self.navigationController.navigationBar.frame.size.height;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, statusBarHeight+BarHeight, 50, 50);
    backBtn.backgroundColor = [UIColor lightGrayColor];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
