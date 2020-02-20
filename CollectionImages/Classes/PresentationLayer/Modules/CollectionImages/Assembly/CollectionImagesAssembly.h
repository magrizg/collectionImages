//
//  CollectionImagesAssembly.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

/**
 @author Mikhail G.

 CollectionImages module
 */
@interface CollectionImagesAssembly : TyphoonAssembly <RamblerInitialAssembly>

- (UIViewController *)viewCollectionImages;

@end
