//
//  ViewController.m
//  ZXCollectionViewNineDemo
//
//  Created by Rocent on 2017/8/1.
//  Copyright © 2017年 stronger. All rights reserved.
//

#import "ViewController.h"
#import "ZXNineCollectionView.h"
#import "ZXNineCollectionViewCell.h"

@interface ViewController ()<ZXNineCollectionViewDelegate>

@property (nonatomic, strong) NSArray *arr1;
@property (nonatomic, strong) NSArray *arr2;
@property (nonatomic, strong) NSArray *arr3;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) ZXNineCollectionView *nineCollectionView;

@end

@implementation ViewController


- (ZXNineCollectionView *)nineCollectionView{
    if (!_nineCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        NSString * cellId = @"CellId";
        NSString * headerId = @"HeaderId";
        _nineCollectionView = [[ZXNineCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout DataArray:self.dataArr cellId:cellId headerId:headerId];
        _nineCollectionView.backgroundColor = [UIColor clearColor];
        _nineCollectionView.nineDelegate = self;
        [_nineCollectionView registerClass:[ZXNineCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        _nineCollectionView.showsVerticalScrollIndicator = YES;
        [_nineCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    }
    return _nineCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.arr1 = [NSArray arrayWithObjects:@"1", @"2",@"3",@"4",@"5",@"2",@"3",@"4",nil];
    self.arr2 = [NSArray arrayWithObjects:@"222", @"333",@"444",@"555",@"666",@"777",@"888",@"999",nil];
    self.arr3 = [NSArray arrayWithObjects:@"33333",@"44444",nil];
    self.dataArr = [NSMutableArray arrayWithObjects:_arr1, _arr2, _arr3, nil].mutableCopy;
    [self.view addSubview:self.nineCollectionView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -ZXNineCollectionViewDelegate
- (void)menuCollectionView:(ZXNineCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath dataDic:(NSDictionary *)dataDic{
    NSLog(@"点击的按钮是%ld",(long)indexPath.row);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
