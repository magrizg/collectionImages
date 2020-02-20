//
//  CVDMBaseCellViewModel.m
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CVDMBaseCellViewModel.h"

@interface CVDMBaseCellViewModel()

@property(nonatomic, strong) NSString *cellIdentifier;

@end

@implementation CVDMBaseCellViewModel

- (NSString *)cellIdentifier{
    NSString *cellIdentifier = _cellIdentifier;
    if (!cellIdentifier){
        cellIdentifier = NSStringFromClass(self.class);
        _cellIdentifier = cellIdentifier;
    }
    return cellIdentifier;
}

@end
