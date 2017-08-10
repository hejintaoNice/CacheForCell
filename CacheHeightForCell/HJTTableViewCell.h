//
//  HJTTableViewCell.h
//  CacheHeightForCell
//
//  Created by 何锦涛 on 2017/8/10.
//  Copyright © 2017年 何锦涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "TestModel.h"

@interface HJTTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;

-(void)configUIWithData:(TestModel*)model;

@end
