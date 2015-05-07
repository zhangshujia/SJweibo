//
//  Channel.m
//  02-网易新闻
//
//  Created by teacher on 15/4/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "Channel.h"

@implementation Channel

+ (instancetype)channelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    // 遍历属性数组
    for (NSString *key in [self properties]) {
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}

+ (NSArray *)properties {
    return @[@"tname", @"tid", @"bannerOrder"];
}

+ (NSArray *)channels {
    // 从本地 json 读取频道数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dict[@"tList"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    // 字典转模型
    [array enumerateObjectsUsingBlock:^(NSDictionary *d, NSUInteger idx, BOOL *stop) {
        [arrayM addObject:[self channelWithDict:d]];
    }];
    
    // 返回根据 bannerOrder 的排序结果
    return [arrayM sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel *obj2) {
        return obj1.bannerOrder > obj2.bannerOrder;
    }];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p>, %@", self.class, self, [self dictionaryWithValuesForKeys:[Channel properties]]];
}

@end
