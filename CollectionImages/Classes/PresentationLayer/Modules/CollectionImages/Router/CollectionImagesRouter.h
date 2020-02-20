//
//  CollectionImagesRouter.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface CollectionImagesRouter : NSObject <CollectionImagesRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
