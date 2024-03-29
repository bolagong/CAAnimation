//
//  PraiseViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/8.
//  Copyright © 2019 CB. All rights reserved.
//

#import "PraiseViewController.h"
#import "PraiseView.h"

@interface PraiseViewController ()

@end

@implementation PraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self backAction];
    
    
    // 点赞动画
    PraiseView *praiseView = [[PraiseView alloc] initWithFrame:CGRectMake(50, 140, 80, 80)];
    praiseView.backgroundColor = [UIColor whiteColor];
    [praiseView setBtnImage:[UIImage imageNamed:@"praise"] selectImage:[UIImage imageNamed:@"praise_H"]];
    praiseView.isExplosion = YES;
    praiseView.isExpSure = NO;
    [self.view addSubview:praiseView];
    
    PraiseView *collectView = [[PraiseView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(praiseView.frame)+10, CGRectGetMaxY(praiseView.frame)+10, 80, 80)];
    collectView.backgroundColor = [UIColor whiteColor];
    [collectView setBtnImage:[UIImage imageNamed:@"collect"] selectImage:[UIImage imageNamed:@"collect_H"]];
    collectView.isExplosion = YES;
    collectView.isExpSure = YES;
    [self.view addSubview:collectView];
    
    PraiseView *collect2View = [[PraiseView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(collectView.frame)+10, CGRectGetMaxY(collectView.frame)+10, 80, 80)];
    collect2View.backgroundColor = [UIColor whiteColor];
    [collect2View setBtnImage:[UIImage imageNamed:@"collect"] selectImage:[UIImage imageNamed:@"collect_H"]];
    collect2View.isExplosion = NO;
    collect2View.isExpSure = NO;
    [self.view addSubview:collect2View];
    
    CGSize aSize = [UIScreen mainScreen].bounds.size;
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.frame = CGRectMake(20, CGRectGetMaxY(collect2View.frame)+20, aSize.width-20*2, 40);
    textLayer.backgroundColor = [UIColor brownColor].CGColor;      //背景颜色
    textLayer.fontSize = [UIFont systemFontOfSize:18].pointSize;   //字体大小
    textLayer.alignmentMode = kCAAlignmentCenter;                  //对齐方式
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;      //字体颜色
    textLayer.wrapped = YES;                                       //自动换行
    textLayer.truncationMode = kCATruncationEnd;                   //文本末尾显示省略号
    textLayer.string = @"可以根据需要自定义设置图片和参数";
    [self.view.layer addSublayer:textLayer];
    
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
