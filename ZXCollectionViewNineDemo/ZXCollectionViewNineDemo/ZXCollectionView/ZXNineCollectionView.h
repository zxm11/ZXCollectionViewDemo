//
//  ZXNineCollectionView.h
//  ZXCollectionViewNineDemo
//
//  Created by Rocent on 2017/8/1.
//  Copyright © 2017年 stronger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXNineCollectionView;

@protocol ZXNineCollectionViewDelegate <NSObject>

- (void)menuCollectionView:(ZXNineCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath dataDic:(NSDictionary*)dataDic;

@end

@interface ZXNineCollectionView : UICollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout DataArray:(NSArray *)dataArray cellId:(NSString *)cellId headerId:(NSString *)headerId;

@property(nonatomic,weak)id<ZXNineCollectionViewDelegate>nineDelegate;



@end
