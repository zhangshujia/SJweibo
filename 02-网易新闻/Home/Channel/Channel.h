//
//  Channel.h
//  02-网易新闻
//
//  Created by teacher on 15/4/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject
///  频道名称
@property (nonatomic, copy) NSString *tname;
///  频道代号-生成新闻页面URL
///  http://c.m.163.com/nc/article/headline/tid/0-20.html
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, assign) int bannerOrder;

+ (instancetype)channelWithDict:(NSDictionary *)dict;

///  返回频道数据数组
+ (NSArray *)channels;

@end
