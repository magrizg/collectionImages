//
//  CollectionImagesViewInput.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CVDMBaseCellViewModel;

@protocol CollectionImagesViewInput <NSObject>

- (void)showLoading;
- (void)hideLoading;
- (void)showError:(NSString *)errorMessage;
- (void)setViewModels:(NSArray<CVDMBaseCellViewModel *> *)viewModels;

@end
