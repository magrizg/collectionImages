//
//  CollectionImagesInteractorOutput.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CollectionImagesInteractorOutput <NSObject>

- (void)urlsReceived:(NSArray<NSString *> *)arrayUrls;
- (void)errorUrlLoad:(NSString *)errorMessage;

@end
