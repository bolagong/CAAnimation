//
//  TransitionTwoViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/9.
//  Copyright © 2019 CB. All rights reserved.
//

#import "TransitionTwoViewController.h"
#import "CircleTransition.h"


@interface TransitionTwoViewController ()<UINavigationControllerDelegate>

@end

@implementation TransitionTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.64 green:0.14 blue:0.46 alpha:1];
    
    // 跳转按钮
    CGSize mSize = [UIScreen mainScreen].bounds.size;
    _twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _twoBtn.frame = CGRectMake((mSize.width-100)/2.0, (mSize.height-100)/2.0, 100, 100);
    _twoBtn.backgroundColor = [UIColor brownColor];
    [_twoBtn setTitle:@"Pop" forState:UIControlStateNormal];
    [_twoBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    _twoBtn.layer.cornerRadius = _twoBtn.bounds.size.width/2.0;
    _twoBtn.layer.masksToBounds = YES;
    [self.view addSubview:_twoBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 实现代理和协议
    self.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
// 通过nav的delegate 自定义转场动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    // 如果是Pop就自定义
    if (operation == UINavigationControllerOperationPop) {
        CircleTransition *trans = [CircleTransition new];
        trans.isPush = NO;
        return trans;
    }
    
    return nil;
}


- (void)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
