//
//  ZXNineCollectionView.m
//  ZXCollectionViewNineDemo
//
//  Created by Rocent on 2017/8/1.
//  Copyright © 2017年 stronger. All rights reserved.
//

#import "ZXNineCollectionView.h"
#import "ZXNineCollectionViewCell.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ZXNineCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) NSArray *dataArr;


@property(nonatomic,copy)NSString * cellId;

@property(nonatomic,copy)NSString * headerId;

@end

@implementation ZXNineCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout DataArray:(NSArray *)dataArray cellId:(NSString *)cellId headerId:(NSString *)headerId{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self){
        
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.dataArr = dataArray;
        self.cellId = cellId;
        self.headerId = headerId;
        
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  
    return _dataArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dataArr[section] count];
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZXNineCollectionViewCell *cell = (ZXNineCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:_cellId forIndexPath:indexPath];
    cell.name = _dataArr[indexPath.section][indexPath.row];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_headerId forIndexPath:indexPath];
        header.backgroundColor = [UIColor whiteColor];
        NSString * name = [NSString stringWithFormat:@"标题%ld",(long)indexPath.section];
        UIView * view = [self addHeaderViewWithTitle:name andFrame:header.bounds];
        for (UIView *view in header.subviews) {
            [view removeFromSuperview];
        } // 防止复用分区头
        [header addSubview:view];
        return header;
    } else {
        return nil;
    }
}

- (UIView *)addHeaderViewWithTitle:(NSString *)title andFrame:(CGRect)frame{
    UIView * bgView = [[UIView alloc] initWithFrame:frame];
    bgView.backgroundColor = [UIColor whiteColor];
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    lineLabel.frame = CGRectMake(0, 0, frame.size.width,frame.size.height * 1/8);
    [bgView addSubview:lineLabel];
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.frame = CGRectMake(frame.size.width * 20/375, frame.size.height * 1/8, frame.size.width, frame.size.height * 7/8);
    titleLabel.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:titleLabel];
    return bgView;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.nineDelegate respondsToSelector:@selector(menuCollectionView:didSelectItemAtIndexPath:dataDic:)]){
        //实际应用时可以传递点击item对应的data
        [self.nineDelegate menuCollectionView:self didSelectItemAtIndexPath:indexPath dataDic:nil];
    }
    
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(screenWidth/3, screenWidth * 2/9);
}


//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if ([_headerId isEqualToString:@"headerId"]) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(screenWidth, screenHeight * 50/667);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


@end
