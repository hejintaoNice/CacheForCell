//
//  TestModel.h
//  CacheHeightForCell
//
//  Created by 何锦涛 on 2017/8/10.
//  Copyright © 2017年 何锦涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
