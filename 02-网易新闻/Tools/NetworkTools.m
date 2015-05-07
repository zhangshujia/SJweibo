//
//  NetworkTools.m
//  02-网易新闻
//
//  Created by teacher on 15/4/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)sharedNetworkTools {
    static NetworkTools *tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // baseURL 的目的，就是让后续的网络访问直接使用 相对路径即可！
        // 重要提示：baseURL 的路径一定要有 / 结尾！
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        tools = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        
        // 修改 解析数据格式 能够接受的内容类型 － 官方推荐的做法
        // 民间做法：直接修改 AFN 的源代码！
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return tools;
}

@end
