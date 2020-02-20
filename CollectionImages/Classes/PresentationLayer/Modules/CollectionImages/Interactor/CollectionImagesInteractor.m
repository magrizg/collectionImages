//
//  CollectionImagesInteractor.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesInteractor.h"
#import "CollectionImagesInteractorOutput.h"
#import "GetListService.h"

@implementation CollectionImagesInteractor

#pragma mark - Методы CollectionImagesInteractorInput

- (void)getUrls{
    [self.getListService getUrls];
}

#pragma mark - Методы GetListServiceDelegate

- (void)urlsReceived:(NSArray<NSString *> *)arrayUrls{
    [self.output urlsReceived:arrayUrls];
}

- (void)errorUrlLoad:(NSString *)errorMessage {
    [self.output errorUrlLoad:errorMessage];
}

@end
