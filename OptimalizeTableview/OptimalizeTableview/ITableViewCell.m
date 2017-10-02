//
//  ITableViewCell.m
//  OptimalizeTableview
//
//  Created by NowOrNever on 02/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ITableViewCell.h"

@implementation ITableViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setuserInterface];
    }
    return self;
}

- (void)setuserInterface{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 20)];
    _label.textColor = [UIColor blueColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"测试优化列表列表列表列表富家大室拉法；事件发生发；束带结发；啥飞机撒开了";
    [self.contentView addSubview:_label];
    
    _imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.bounds.size.width/3,100)];
    [self.contentView addSubview:_imageview1];
    _imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/3, 20, self.bounds.size.width/3, 100)];
    [self.contentView addSubview:_imageview2];
    _imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width*2/3, 20, self.bounds.size.width/3, 100)];
    [self.contentView addSubview:_imageview3];
    
}

@end
