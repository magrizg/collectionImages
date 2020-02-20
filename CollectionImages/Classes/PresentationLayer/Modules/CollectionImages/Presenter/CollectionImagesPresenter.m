//
//  CollectionImagesPresenter.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "CollectionImagesPresenter.h"

#import "CollectionImagesViewInput.h"
#import "CollectionImagesInteractorInput.h"
#import "CollectionImagesRouterInput.h"
#import "ImageCellViewModel.h"

@implementation CollectionImagesPresenter

#pragma mark - Методы CollectionImagesModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы CollectionImagesViewOutput

- (void)didTriggerViewReadyEvent {
    [self loadImages];
}

- (void)buttonReloadPressed{
    [self loadImages];
}

#pragma mark - Методы CollectionImagesInteractorOutput

- (void)urlsReceived:(NSArray<NSString *> *)arrayUrls{
    [self.view hideLoading];
    NSMutableArray<ImageCellViewModel *> *mArray = [NSMutableArray new];
    for (NSInteger i = 0; i < arrayUrls.count; i++){
        [mArray addObject:[[ImageCellViewModel alloc] initWithLinkImage:arrayUrls[i]]];
    }
    [self.view setViewModels:mArray];
}

- (void)errorUrlLoad:(NSString *)errorMessage {
    [self.view hideLoading];
    [self.view showError:errorMessage];
}

#pragma mark - Другие методы

- (void)loadImages{
    [self.view showLoading];
    [self.interactor getUrls];
}

@end
