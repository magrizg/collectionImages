//
//  ApplicationAssembly.m
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "CollectionImagesAssembly.h"
#import "CollectionImagesViewController.h"

@implementation ApplicationAssembly


- (AppDelegate *)appDelegate{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
        [definition injectProperty:@selector(window) with:[self mainWindow]];
    }];
}

- (UIWindow *)mainWindow{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition)
            {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer)
         {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
        [definition injectProperty:@selector(rootViewController) with:[self.collectionImagesAssembly viewCollectionImages]];
    }];
}

@end
