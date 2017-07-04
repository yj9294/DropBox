//
//  DropBoxView.m
//  DropBox
//
//  Created by cptech on 2017/6/19.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import "DropBoxView.h"

@interface DropBoxView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIButton *bgBtn;

@end


@implementation DropBoxView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame])
    {

        //背景btn
        self.bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.bgBtn.frame = self.bounds;
        self.bgBtn.backgroundColor = [UIColor clearColor];
        [self.bgBtn addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.bgBtn];
        
        //选择btn
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self.btn setBackgroundColor:[UIColor blueColor]];
        [self.btn setTitle:@"请选择" forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(setUpView:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.btn];

        
    }
    return self;
}
- (void)setUpView:(UIButton *)btn
{
    CGRect frame = self.frame;
    self.frame = [UIScreen mainScreen].bounds;
    self.bgBtn.frame = self.frame;
    self.btn.frame = CGRectMake(frame.origin.x, frame.origin.y, CGRectGetWidth(frame), CGRectGetHeight(frame));
    btn.enabled = NO;
    if(!self.isUp)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x,
                                                                       frame.origin.y+CGRectGetHeight(frame),
                                                                       CGRectGetWidth(frame),
                                                                       CGRectGetHeight(frame)+self.heightOfTableView)];

    }
    else{
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x,
                                                                       frame.origin.y,
                                                                       CGRectGetWidth(frame),
                                                                       -self.heightOfTableView)];
    }
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addSubview:self.tableView];

}
- (void)removeView
{
    _btn.enabled = YES;
    self.frame = CGRectMake(_btn.frame.origin.x, _btn.frame.origin.y, CGRectGetWidth(_btn.frame), CGRectGetHeight(_btn.frame));
    self.btn.frame = CGRectMake(0, 0, CGRectGetWidth(_btn.frame), CGRectGetHeight(_btn.frame));
    self.bgBtn.frame = self.btn.frame;
    [self.tableView removeFromSuperview];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dropBoxCell"];
    if(!cell)
    {
        //下拉列表可以自定义风格
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"dropBoxCell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _btn.enabled = YES;
    self.frame = CGRectMake(_btn.frame.origin.x, _btn.frame.origin.y, CGRectGetWidth(_btn.frame), CGRectGetHeight(_btn.frame));
    self.bgBtn.frame = CGRectMake(0, 0,  CGRectGetWidth(_btn.frame),  CGRectGetHeight(_btn.frame));
    self.btn.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    [self.btn setTitle:self.dataSource[indexPath.row] forState:UIControlStateNormal];
    _text = self.dataSource[indexPath.row];
    [self.tableView removeFromSuperview];
    
    [self.delegate view:self didSelectRowAtIndex:indexPath.row];
    
}

@end
