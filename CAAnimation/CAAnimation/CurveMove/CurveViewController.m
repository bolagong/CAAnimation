//
//  CurveViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/8.
//  Copyright © 2019 CB. All rights reserved.
//

#import "CurveViewController.h"
#import "CurveAnimationView.h"

@interface CurveViewController ()

@end

@implementation CurveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self backAction];
    
    // 曲线动画
    CurveAnimationView *curveView = [[CurveAnimationView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), 200)];
    curveView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:curveView];
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
