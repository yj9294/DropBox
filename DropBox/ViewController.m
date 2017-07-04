//
//  ViewController.m
//  DropBox
//
//  Created by cptech on 2017/6/19.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DropBoxViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpView
{
    //引用下拉列表
    DropBoxView *view = [[DropBoxView alloc] initWithFrame:CGRectMake(100, 100, 60 , 30)];
    //代理点击事件
    view.delegate = self;
    //上拉还是下拉
    view.isUp = NO;
    //列表的高度
    view.heightOfTableView = 80;
    //数据源
    view.dataSource = @[@"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9"];
    [self.view addSubview:view];
}
#pragma mark - DropBoxViewDelegate

- (void)view:(DropBoxView *)view didSelectRowAtIndex:(NSInteger)index{
    
    NSLog(@"点击的是第%ld行",(long)index);
}

@end
