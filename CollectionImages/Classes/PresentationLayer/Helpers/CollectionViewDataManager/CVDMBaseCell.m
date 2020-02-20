//
//  CVDMBaseCell.m
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CVDMBaseCell.h"
#import "CVDMBaseCellViewModel.h"

@implementation CVDMBaseCell

- (void)setViewModel:(CVDMBaseCellViewModel *)viewModel{
    CVDMBaseCellViewModel *currentViewModel = _viewModel;
    if (currentViewModel.cell == self){
        currentViewModel.cell = nil;
    }
    _viewModel = viewModel;
    viewModel.cell = self;
}

@end
