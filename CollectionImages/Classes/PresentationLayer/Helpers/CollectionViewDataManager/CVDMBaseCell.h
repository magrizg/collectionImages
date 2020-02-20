//
//  CVDMBaseCell.h
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CVDMBaseCellViewModel;

@interface CVDMBaseCell : UICollectionViewCell

@property(nonatomic, strong) CVDMBaseCellViewModel *viewModel;

@end
