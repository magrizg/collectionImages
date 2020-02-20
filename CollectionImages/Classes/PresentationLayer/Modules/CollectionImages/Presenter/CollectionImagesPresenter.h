//
//  CollectionImagesPresenter.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesViewOutput.h"
#import "CollectionImagesInteractorOutput.h"
#import "CollectionImagesModuleInput.h"

@protocol CollectionImagesViewInput;
@protocol CollectionImagesInteractorInput;
@protocol CollectionImagesRouterInput;

@interface CollectionImagesPresenter : NSObject <CollectionImagesModuleInput, CollectionImagesViewOutput, CollectionImagesInteractorOutput>

@property (nonatomic, weak) id<CollectionImagesViewInput> view;
@property (nonatomic, strong) id<CollectionImagesInteractorInput> interactor;
@property (nonatomic, strong) id<CollectionImagesRouterInput> router;

@end
