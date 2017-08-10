//
//  ViewController.m
//  CacheHeightForCell
//
//  Created by 何锦涛 on 2017/8/10.
//  Copyright © 2017年 何锦涛. All rights reserved.
//

#import "ViewController.h"
#import "HJTTableViewCell.h"
#import "UITableViewCell+AutoHeightForCell.h"
#import "TestModel.h"

#define WeakSelf __weak typeof(self) weakSelf = self;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self configData];
}

-(void)configUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.bottom.right.mas_equalTo(self.view);
    }];
}

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HJTTableViewCell class] forCellReuseIdentifier:@"HJTTableViewCell_reu_id"];
    }
    return _tableView;
}

-(void)configData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"demoData"];
        
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[TestModel alloc] initWithDictionary:obj]];
        }];
        [self.datas removeAllObjects];
        [self.datas addObjectsFromArray:entities];
        [self.tableView reloadData];
    });
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [HJTTableViewCell CellHeightForTableView:tableView indexPath:indexPath cellContentViewWidth:0 bottomOffset:10];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HJTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HJTTableViewCell_reu_id"];
    if (!cell) {
        cell = [[HJTTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HJTTableViewCell_reu_id"];
    }
    [cell configUIWithData:_datas[indexPath.row]];
    return cell;
}

@end
