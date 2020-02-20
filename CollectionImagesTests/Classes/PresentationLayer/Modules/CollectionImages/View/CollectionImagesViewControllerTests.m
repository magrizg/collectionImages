//
//  CollectionImagesViewControllerTests.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CollectionImagesViewController_Testable.h"
#import "CollectionImagesViewController.h"
#import "CollectionViewDataManager.h"
#import "CollectionImagesViewOutput.h"
#import "ImageCellViewModel.h"

@interface CollectionImagesViewControllerTests : XCTestCase

@property (nonatomic, strong) CollectionImagesViewController *controller;

@property (nonatomic, strong) id mockOutput;

@property (nonatomic, strong) id mockCollectionView;

@end

@implementation CollectionImagesViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[CollectionImagesViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(CollectionImagesViewOutput));
    self.mockCollectionView = OCMClassMock([UICollectionView class]);

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;
    self.mockCollectionView = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	[self.controller viewDidLoad];
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

- (void)testThatControllerButtonReloadPressed{
    [self.controller buttonReloadPressed];
    OCMVerify([self.mockOutput buttonReloadPressed]);
}

#pragma mark - Тестирование методов CollectionImagesViewInput

- (void)testThatControllerSetViewModels{
    self.controller.collectionView = self.mockCollectionView;
    NSArray<ImageCellViewModel *> *arrayModels = @[[[ImageCellViewModel alloc] initWithLinkImage:@"link1"], [[ImageCellViewModel alloc] initWithLinkImage:@"link2"]];

    [self.controller setViewModels:arrayModels];
    XCTAssert(self.controller.collectionViewDataManager.arrayViewModels == arrayModels);
    OCMVerify([self.mockCollectionView reloadData]);
}

@end
