//
//  HomeViewController.m
//  02-网易新闻
//
//  Created by teacher on 15/4/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"

@interface HomeViewController ()
///  频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentView;

///  频道数据
@property (nonatomic, strong) NSArray *channels;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChannel];
    NSLog(@"%@", self.channels);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

///  设置频道视图
- (void)setupChannel {
   
    // automaticallyAdjustsScrollViewInsets 能够解决 因为 nav 导致的 -64 的边距差。
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.channelView.showsHorizontalScrollIndicator = NO;
    
    // 两边的边距
    CGFloat margin = 8;
    CGFloat x = margin;
    CGFloat h = self.channelView.bounds.size.height;
    
    for (Channel *channel in self.channels) {
        // 尺寸已经计算好了
        ChannelLabel *l = [ChannelLabel channelLabelWithTitle:channel.tname];
        // 设置 label 的位置
        l.frame = CGRectMake(x, 0, l.bounds.size.width, h);
        NSLog(@"%@", NSStringFromCGRect(l.frame));
        
        x += l.bounds.size.width;
        
        [self.channelView addSubview:l];
    }
    
    self.channelView.contentSize = CGSizeMake(x + margin, h);
}

// MARK: - 懒加载
- (NSArray *)channels {
    if (_channels == nil) {
        _channels = [Channel channels];
    }
    return _channels;
}

@end
