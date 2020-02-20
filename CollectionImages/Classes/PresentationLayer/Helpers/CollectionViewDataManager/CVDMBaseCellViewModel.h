//
//  CVDMBaseCellViewModel.h
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CVDMBaseCell;

@interface CVDMBaseCellViewModel : NSObject

@property(nonatomic, strong) Class classCell;
@property(nonatomic, weak) CVDMBaseCell *cell;
@property(nonatomic, copy) void (^didSelectBlock)(CVDMBaseCellViewModel *viewModel);

- (NSString *)cellIdentifier;

@end

