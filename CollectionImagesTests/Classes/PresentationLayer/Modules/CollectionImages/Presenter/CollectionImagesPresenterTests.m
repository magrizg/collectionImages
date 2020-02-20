//
//  CollectionImagesPresenterTests.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CollectionImagesPresenter.h"

#import "CollectionImagesViewInput.h"
#import "CollectionImagesInteractorInput.h"
#import "CollectionImagesRouterInput.h"
#import "ImageCellViewModel.h"

@interface CollectionImagesPresenterTests : XCTestCase

@property (nonatomic, strong) CollectionImagesPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation CollectionImagesPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[CollectionImagesPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(CollectionImagesInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(CollectionImagesRouterInput));
    self.mockView = OCMProtocolMock(@protocol(CollectionImagesViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов CollectionImagesViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    [self.presenter didTriggerViewReadyEvent];
    OCMVerify([self.mockView showLoading]);
    OCMVerify([self.mockInteractor getUrls]);
}

- (void)testThatPresenterHandlesButtonReloadPressedEvent {
    [self.presenter buttonReloadPressed];
    OCMVerify([self.mockView showLoading]);
    OCMVerify([self.mockInteractor getUrls]);
}

#pragma mark - Тестирование методов CollectionImagesInteractorOutput

- (void)testThatPresenterHandlesUrlsReceivedEvent {
    NSArray<NSString *> *arrayLinks = @[@"link1", @"link2"];
    NSArray<ImageCellViewModel *> *arrayModels = @[[[ImageCellViewModel alloc] initWithLinkImage:@"link1"], [[ImageCellViewModel alloc] initWithLinkImage:@"link2"]];
    
    [self.presenter urlsReceived:arrayLinks];
    OCMVerify([self.mockView hideLoading]);
    OCMVerify([self.mockView setViewModels:arrayModels]);
}

- (void)testThatPresenterHandlesErrorUrlLoadEvent {
    [self.presenter errorUrlLoad:@"error"];;
    OCMVerify([self.mockView hideLoading]);
    OCMVerify([self.mockView showError:@"error"]);
}

@end
