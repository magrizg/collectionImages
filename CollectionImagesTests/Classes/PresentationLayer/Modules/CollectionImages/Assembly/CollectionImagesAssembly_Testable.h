//
//  CollectionImagesAssembly_Testable.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesAssembly.h"

@class CollectionImagesViewController;
@class CollectionImagesInteractor;
@class CollectionImagesPresenter;
@class CollectionImagesRouter;
@class NetworkService;

/**
 @author Mikhail G.

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface CollectionImagesAssembly ()

- (CollectionImagesPresenter *)presenterCollectionImages;
- (CollectionImagesInteractor *)interactorCollectionImages;
- (CollectionImagesRouter *)routerCollectionImages;
- (NetworkService *)getListService;

@end
