//
//  ZXNineCollectionViewCell.m
//  ZXCollectionViewNineDemo
//
//  Created by Rocent on 2017/8/1.
//  Copyright © 2017年 stronger. All rights reserved.
//

#import "ZXNineCollectionViewCell.h"
#define KscreenWidth self.bounds.size.width
#define KscreenHeight self.bounds.size.height

@interface ZXNineCollectionViewCell (){
    UIImageView * imageView;
    UILabel * label;
}

@end

@implementation ZXNineCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createZXNineCollectionViewCellUIWihFrame:frame];
    }
    
    return self;
}

- (void)createZXNineCollectionViewCellUIWihFrame:(CGRect)frame{
    CGFloat height = KscreenWidth * 2/3;
    imageView = [[UIImageView alloc] init];
    
    imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(height/4, height/8, height/2, height/2)];
    imageView.image = [UIImage imageNamed:@"icon_homepage_hotelCategory"];
    [self.contentView addSubview:imageView];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, height * 17/24, height, height/6)];
    label.textAlignment = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:label];
    
   
    
}

- (void)setName:(NSString *)name{
    _name = name;
    label.text = name;
}


@end
