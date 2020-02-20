//
//  CollectionViewDataManager.m
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionViewDataManager.h"
#import "CVDMBaseCellViewModel.h"
#import "CVDMBaseCell.h"

@interface CollectionViewDataManager() <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation CollectionViewDataManager

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayViewModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CVDMBaseCellViewModel *viewModel = self.arrayViewModels[indexPath.row];
    CVDMBaseCell *cell = (CVDMBaseCell *)[collectionView dequeueReusableCellWithReuseIdentifier:[viewModel cellIdentifier] forIndexPath:indexPath];
    cell.viewModel = viewModel;

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CVDMBaseCellViewModel *viewModel = self.arrayViewModels[indexPath.row];
    
    if(viewModel.didSelectBlock){
        viewModel.didSelectBlock(viewModel);
    }
}

#pragma mark - Setters

- (void)setArrayViewModels:(NSArray<CVDMBaseCellViewModel *> *)arrayViewModels{
    _arrayViewModels = arrayViewModels;
    UICollectionView *collectionView = self.collectionView;
    for (NSInteger i = 0; i < arrayViewModels.count; i++){
        CVDMBaseCellViewModel *viewModel = arrayViewModels[i];
        [collectionView registerClass:viewModel.classCell forCellWithReuseIdentifier:[viewModel cellIdentifier]];
    }
}

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
}

@end
