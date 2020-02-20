//
//  CollectionImagesInteractor.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesInteractorInput.h"
#import "GetListServiceDelegate.h"

@protocol CollectionImagesInteractorOutput;
@protocol GetListService;

@interface CollectionImagesInteractor : NSObject <CollectionImagesInteractorInput, GetListServiceDelegate>

@property (nonatomic, weak) id<CollectionImagesInteractorOutput> output;
@property (nonatomic, strong) id<GetListService> getListService;

@end
