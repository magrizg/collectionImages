//
//  CollectionImagesRouterTests.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CollectionImagesRouter.h"

@interface CollectionImagesRouterTests : XCTestCase

@property (nonatomic, strong) CollectionImagesRouter *router;

@end

@implementation CollectionImagesRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[CollectionImagesRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
