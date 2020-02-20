//
//  CollectionImagesViewController_Testable.h
//  CollectionImages
//
//  Created by Mikhail G. on 20.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesViewController.h"
/**
 @author Mikhail G.
 Extension, который делает приватные @property и методы открытыми для тестирования.
 */
@class CollectionViewDataManager;

@interface CollectionImagesViewController ()

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) CollectionViewDataManager *collectionViewDataManager;

-(void)buttonReloadPressed;

@end
