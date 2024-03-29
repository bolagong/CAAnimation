//
//  ViewController.m
//  CAAnimation
//
//  Created by changbo on 2019/9/23.
//  Copyright © 2019 CB. All rights reserved.
//

#import "ViewController.h"
#import "PraiseViewController.h"
#import "SlideViewController.h"
#import "BezierViewController.h"
#import "CurveViewController.h"
#import "GradientViewController.h"
#import "TransitionOneViewController.h"



@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    CGSize aSize = [UIScreen mainScreen].bounds.size;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, aSize.width, aSize.height-100)];
    tableView.backgroundColor = self.view.backgroundColor;
    tableView.rowHeight = 50;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    _listArray = @[@"自定义转场动画",@"点赞动画",@"底部框弹性动画",@"贝塞尔曲线",@"曲线移动",@"帧动画旋转和颜色过渡"];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
    
    cell.textLabel.text = [self.listArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            TransitionOneViewController *oneVC = [[TransitionOneViewController alloc] init];
            UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:oneVC];
            navC.navigationBar.hidden = YES;
            [self presentViewController:navC animated:YES completion:nil];
        }
            break;
        case 1: {
            PraiseViewController *praiseVC = [[PraiseViewController alloc] init];
            [self presentViewController:praiseVC animated:YES completion:nil];
        }
            break;
        case 2: {
            SlideViewController *slideVC = [[SlideViewController alloc] init];
            [self presentViewController:slideVC animated:YES completion:nil];
        }
            break;
        case 3: {
            BezierViewController *bezierVC = [[BezierViewController alloc] init];
            [self presentViewController:bezierVC animated:YES completion:nil];
        }
            break;
        case 4: {
            CurveViewController *curveVC = [[CurveViewController alloc] init];
            [self presentViewController:curveVC animated:YES completion:nil];
        }
            break;
        case 5: {
            GradientViewController *gradientVC = [[GradientViewController alloc] init];
            [self presentViewController:gradientVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}




@end
