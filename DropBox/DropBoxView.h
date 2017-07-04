//
//  DropBoxView.h
//  DropBox
//
//  Created by cptech on 2017/6/19.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropBoxView;
@protocol DropBoxViewDelegate <NSObject>

@optional
//点击tableview的cell的事件
- (void)view:(DropBoxView *)view didSelectRowAtIndex:(NSInteger)index;

@end

@interface DropBoxView : UIView


@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,assign) BOOL isUp;// YES弹出的是向上。no是向下，默认的是NO

@property (nonatomic,assign) BOOL animation;//是否有动画

@property (nonatomic, assign) CGFloat heightOfTableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) id <DropBoxViewDelegate> delegate;

@property (nonatomic,strong,readonly) NSString *text;

@end
