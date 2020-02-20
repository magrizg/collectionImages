//
//  ImageCellViewModel.h
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CVDMBaseCellViewModel.h"

@interface ImageCellViewModel : CVDMBaseCellViewModel

@property(nonatomic, strong) NSString *linkImage;

- (instancetype)initWithLinkImage:(NSString *)linkImage;

@end
