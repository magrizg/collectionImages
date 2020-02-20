//
//  CollectionImagesAssembly.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesAssembly.h"

#import "CollectionImagesViewController.h"
#import "CollectionImagesInteractor.h"
#import "CollectionImagesPresenter.h"
#import "CollectionImagesRouter.h"
#import "NetworkService.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation CollectionImagesAssembly

- (CollectionImagesViewController *)viewCollectionImages {
    return [TyphoonDefinition withClass:[CollectionImagesViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCollectionImages]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterCollectionImages]];
                          }];
}

- (CollectionImagesInteractor *)interactorCollectionImages {
    return [TyphoonDefinition withClass:[CollectionImagesInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCollectionImages]];
                              [definition injectProperty:@selector(getListService)
                                                    with:[self getListService]];
                          }];
}

- (CollectionImagesPresenter *)presenterCollectionImages{
    return [TyphoonDefinition withClass:[CollectionImagesPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewCollectionImages]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorCollectionImages]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerCollectionImages]];
                          }];
}

- (CollectionImagesRouter *)routerCollectionImages{
    return [TyphoonDefinition withClass:[CollectionImagesRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewCollectionImages]];
                          }];
}


- (NetworkService *)getListService{
    return [TyphoonDefinition withClass:[NetworkService class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(delegate)
                              with:[self interactorCollectionImages]];
    }];
}

@end
