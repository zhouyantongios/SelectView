//
//  ViewController.m
//  SelectorView
//
//  Created by 周彦彤 on 16/3/24.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"
@interface ViewController ()<SelectViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"123",@"123123",@"112",@"1212",@"hhe"];
    SelectView *selectView = [[SelectView alloc]initWithSelectView:titleArray Delegate:self andFrame:CGRectMake(0, 100, self.view.bounds.size.width, 80)];
    __weak typeof(self)weakSelf = self;
    selectView.changeBlock = ^(NSInteger index) {
        [weakSelf printLog:index];
    };
    [self.view addSubview:selectView];
}

#pragma mark -- SelectViewDelegate
- (void)tapSelectViewIndex:(NSInteger)index {
    NSLog(@"Delegate:%ld",index);
}

#pragma mark -- ResponseSelectViewBlockMethod
- (void)printLog:(NSInteger)index {
    NSLog(@"Block:%zd",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
