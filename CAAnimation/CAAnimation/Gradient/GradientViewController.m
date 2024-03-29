//
//  GradientViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/8.
//  Copyright © 2019 CB. All rights reserved.
//

#import "GradientViewController.h"
#import "ShakeView.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self backAction];
    
    // 彩色条
    [self gradientColorToolView];
    
    // 旋转抖动
    ShakeView *shakeView = [[ShakeView alloc] initWithFrame:CGRectMake(20, 200, 80, 80)];
    shakeView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:shakeView];
    
    // label
    [self tipLabel];
}

- (void)tipLabel {
    // CATextLayer 也可以作为label来使用
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(10, 300, CGRectGetWidth(self.view.bounds)-10*2, 60);
    textLayer.backgroundColor = [UIColor brownColor].CGColor;      //背景颜色
    textLayer.fontSize = [UIFont systemFontOfSize:20].pointSize;   //字体大小
    textLayer.alignmentMode = kCAAlignmentCenter;                  //对齐方式
    textLayer.foregroundColor = [UIColor blackColor].CGColor;      //字体颜色
    textLayer.wrapped = YES;                                       //自动换行
    textLayer.truncationMode = kCATruncationEnd;                   //文本末尾显示省略号
    textLayer.string = @"😄CATextLayer😄：五星红旗迎风飘扬,胜利歌声多么响亮; 歌唱我们亲爱的祖国,从今走向繁荣富强。五星红旗迎风飘扬,胜利歌声多么响亮; 歌唱我们亲爱的祖国,从今走向繁荣富强。";
    [self.view.layer addSublayer:textLayer];
}

- (void)gradientColorToolView {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.bounds)-20*2, 40);
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor, (id)[UIColor brownColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];
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
