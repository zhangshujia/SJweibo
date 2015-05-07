//
//  ChannelLabel.m
//  02-网易新闻
//
//  Created by teacher on 15/4/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "ChannelLabel.h"

// 默认字体大小
#define NormalSize 14.0
// 选中字体大小
#define SelectedSize 18.0

@implementation ChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title {
    
    ChannelLabel *l = [[ChannelLabel alloc] init];
    
    l.text = title;
    // 设置大字体，是为了占地方
    l.font = [UIFont systemFontOfSize:SelectedSize];
    l.textColor = [UIColor blackColor];
    l.textAlignment = NSTextAlignmentCenter;
    
    [l sizeToFit];
    
    // 修改成小的字体
    l.font = [UIFont systemFontOfSize:NormalSize];
    
    return l;
}

@end
