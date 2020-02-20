//
//  CollectionImagesViewController.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesViewController.h"
#import "CollectionImagesViewOutput.h"
#import "Masonry.h"
#import "CollectionViewDataManager.h"
#import <ProgressHUD/ProgressHUD.h>

@class CVDMBaseCellViewModel;

@interface CollectionImagesViewController()

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) CollectionViewDataManager *collectionViewDataManager;

@end

@implementation CollectionImagesViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    
    UIView *view = self.view;
    view.backgroundColor = [UIColor whiteColor];
    
    UICollectionView *collectionView = self.collectionView;
    [view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
    }];
    
    UIButton *buttonReload = [self buttonReload];
    [view addSubview:buttonReload];
    [buttonReload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(collectionView.mas_bottom);
        make.centerX.equalTo(view.mas_centerX);
        make.bottom.equalTo(view.mas_bottom);
        make.height.equalTo(@50);
    }];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы CollectionImagesViewInput

- (void)showError:(NSString *)errorMessage{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:errorMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                            handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showLoading{
    [ProgressHUD show:@"Please wait..."];
}

- (void)hideLoading{
    [ProgressHUD dismiss];
}

- (void)setViewModels:(NSArray<CVDMBaseCellViewModel *> *)viewModels{
    self.collectionViewDataManager.arrayViewModels = viewModels;
    [self.collectionView reloadData];
}

#pragma mark - Handlers

- (void)buttonReloadPressed{
    [self.output buttonReloadPressed];
}

#pragma mark - Getters views

- (UICollectionView *)collectionView{
    UICollectionView *collectionView = _collectionView;
    if(!collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        CGFloat itemSize = [UIScreen mainScreen].bounds.size.width / 2 - 5;
        layout.itemSize = CGSizeMake(itemSize, itemSize);
        layout.minimumLineSpacing = 5;
    
        collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView = collectionView;
    }
    return collectionView;
}

- (CollectionViewDataManager *)collectionViewDataManager{
    CollectionViewDataManager *collectionViewDataManager = _collectionViewDataManager;
    if (!collectionViewDataManager){
        collectionViewDataManager = [CollectionViewDataManager new];
        collectionViewDataManager.collectionView = self.collectionView;
        _collectionViewDataManager = collectionViewDataManager;
    }
    return collectionViewDataManager;
}

- (UIButton *)buttonReload{
    UIButton *button = [UIButton new];
    [button setTitle:@"Reload" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonReloadPressed) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
