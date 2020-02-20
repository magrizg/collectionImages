//
//  ApplicationAssembly.h
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "TyphoonAssembly.h"

@class AppDelegate;
@class CollectionImagesAssembly;

@interface ApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) CollectionImagesAssembly *collectionImagesAssembly;

- (AppDelegate *)appDelegate;

@end
