//
//  CollectionImagesInteractorTests.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CollectionImagesInteractor.h"

#import "CollectionImagesInteractorOutput.h"
#import "GetListService.h"

@interface CollectionImagesInteractorTests : XCTestCase

@property (nonatomic, strong) CollectionImagesInteractor *interactor;

@property (nonatomic, strong) id mockOutput;
@property (nonatomic, strong) id mockGetListService;

@end

@implementation CollectionImagesInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[CollectionImagesInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(CollectionImagesInteractorOutput));
    self.mockGetListService = OCMProtocolMock(@protocol(GetListService));

    self.interactor.output = self.mockOutput;
    self.interactor.getListService = self.mockGetListService;
}

- (void)tearDown {
    self.interactor = nil;
    self.mockGetListService = nil;
    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов CollectionImagesInteractorInput

- (void)testThatInteractorHandlesGetUrlsEvent {
    [self.interactor getUrls];
    OCMVerify([self.mockGetListService getUrls]);
}

#pragma mark - Тестирование методов GetListServiceDelegate

- (void)testThatInteractorHandlesUrlsReceivedEvent {
    NSArray *array = @[@"link"];
    [self.interactor urlsReceived:array];
    OCMVerify([self.mockOutput urlsReceived:array]);
}

- (void)testThatInteractorHandlesErrorUrlLoadEvent {
    NSString *errorMessage = @"error";
    [self.interactor errorUrlLoad: errorMessage];
    OCMVerify([self.mockOutput errorUrlLoad:errorMessage]);
}

@end
