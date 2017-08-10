//
//  HJTTableViewCell.m
//  CacheHeightForCell
//
//  Created by 何锦涛 on 2017/8/10.
//  Copyright © 2017年 何锦涛. All rights reserved.
//

#import "HJTTableViewCell.h"
#import "UITableViewCell+AutoHeightForCell.h"

@implementation HJTTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.timeLab];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(5);
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).with.offset(-10);
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).with.offset(5);
        make.left.mas_equalTo(self.titleLab);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).with.offset(-10);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLab.mas_bottom).with.offset(10);
        make.left.mas_equalTo(self.contentLab);
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentImageView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(self.titleLab);
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameLab);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
    }];

    
    self.cellBottomView = self.nameLab;
    
}


-(UILabel *)titleLab{
    if (!_titleLab) {
        self.titleLab = [[UILabel alloc]init];
        self.titleLab.font = [UIFont boldSystemFontOfSize:15];
        [self.titleLab sizeToFit];
        self.titleLab.textColor = [UIColor colorWithRed:245/255.0 green:78/255.0 blue:84/255.0 alpha:1];
    }
    return _titleLab;
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        self.contentLab = [[UILabel alloc]init];
        self.contentLab.font = [UIFont systemFontOfSize:15];
        [self.contentLab sizeToFit];
        self.contentLab.numberOfLines = 0;
        self.contentLab.textColor = [UIColor colorWithRed:117/255.0 green:115/255.0 blue:128/255.0 alpha:1];
    }
    return _contentLab;
}

-(UIImageView *)contentImageView{
    if (!_contentImageView) {
        self.contentImageView = [[UIImageView alloc]init];
        [self.contentImageView sizeToFit];
        self.contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.contentImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.contentImageView.clipsToBounds = YES;
    }
    return _contentImageView;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        self.nameLab = [[UILabel alloc]init];
        self.nameLab.font = [UIFont systemFontOfSize:14];
        [self.nameLab sizeToFit];
        self.nameLab.textColor = [UIColor colorWithRed:217/255.0 green:215/255.0 blue:224/255.0 alpha:1];
    }
    return _nameLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        self.timeLab = [[UILabel alloc]init];
        self.timeLab.font = [UIFont systemFontOfSize:14];
        [self.timeLab sizeToFit];
        self.timeLab.textColor = [UIColor colorWithRed:217/255.0 green:215/255.0 blue:224/255.0 alpha:1];
    }
    return _timeLab;
}

-(void)configUIWithData:(TestModel *)model{
    self.titleLab.text = model.title;
    self.contentLab.text = model.content;
    self.contentImageView.image = [UIImage imageNamed:model.imageName];
    self.nameLab.text = model.username;
    self.timeLab.text = model.time;
}

@end
