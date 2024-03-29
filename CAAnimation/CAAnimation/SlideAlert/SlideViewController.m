//
//  SlideViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/10/8.
//  Copyright © 2019 CB. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideMenuView.h"

@interface SlideViewController ()

@property (nonatomic,strong) SlideMenuView *slideMenu;

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self backAction];
    
    // 菜单框滑入动画
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake((CGRectGetWidth(self.view.frame)-120)/2.0, 200, 120, 40);
    menuBtn.backgroundColor = [UIColor blueColor];
    menuBtn.layer.masksToBounds = YES;
    menuBtn.layer.cornerRadius = 40/2.0;
    [menuBtn setTitle:@"-show-" forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    
    // 初始化
    self.slideMenu = [[SlideMenuView alloc] init];
    
    // menu模拟数据
    NSMutableArray *listArray = [[NSMutableArray alloc] initWithCapacity:0];
    CGFloat aW = 68;
    NSArray *items = @[@"cat", @"cat", @"cat", @"cat"];
    for (int i=0; i<items.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(20+aW)*i, (self.slideMenu.frame.size.height-aW)/2, aW, aW);
        [btn setImage:[UIImage imageNamed:items[i]] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [self.slideMenu addSubview:btn];
        [listArray addObject:btn];
    }
    self.slideMenu.menuItems = listArray;
}

- (void)showMenuAction:(UIButton *)sender {
    [self.slideMenu showAcition];
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
