//
//  UITableViewCell+AutoHeightForCell.h
//  CacheHeightForCell
//
//  Created by 何锦涛 on 2017/8/10.
//  Copyright © 2017年 何锦涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (AutoHeightForCell)

//传入cell最底部的视图
@property (nonatomic,strong) UIView *cellBottomView;

/**
 返回对应的行高度

 @param tableView 需要计算高度的tableView
 @param indexPath 对应的indexPath
 @param contentViewWidth 内容宽度  不确定的情况下传0
 @param bottomOffset 不确定的情况下传0
 @return 对应的行高度
 */
+ (CGFloat)CellHeightForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath cellContentViewWidth:(CGFloat)contentViewWidth bottomOffset:(CGFloat)bottomOffset;

@end
