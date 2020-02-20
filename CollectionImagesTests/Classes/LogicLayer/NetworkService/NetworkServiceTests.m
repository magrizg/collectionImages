//
//  NetworkServiceTests.m
//  CollectionImagesTests
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NetworkService_Testable.h"
#import "NetworkService.h"
#import "GetListServiceDelegate.h"
#import <AFNetworking/AFNetworking.h>

@interface NetworkServiceTests : XCTestCase

@property (nonatomic, strong) NetworkService *networkServiceSuccess;
@property (nonatomic, strong) NetworkService *networkServiceFailure;

@property (nonatomic, strong) id mockManagerSuccess;
@property (nonatomic, strong) id mockManagerFailure;

@property (nonatomic, strong) id mockDelegate;

@end

@implementation NetworkServiceTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];
    
    self.networkServiceSuccess = [NetworkService new];
    self.networkServiceFailure = [NetworkService new];
    
    self.mockManagerSuccess = OCMStrictClassMock([AFHTTPSessionManager class]);
    self.mockManagerFailure = OCMStrictClassMock([AFHTTPSessionManager class]);
    self.mockDelegate = OCMProtocolMock(@protocol(GetListServiceDelegate));
    
    self.networkServiceSuccess.manager = self.mockManagerSuccess;
    self.networkServiceSuccess.delegate = self.mockDelegate;
    
    self.networkServiceFailure.manager = self.mockManagerFailure;
    self.networkServiceFailure.delegate = self.mockDelegate;
}

- (void)tearDown {
    self.networkServiceSuccess = nil;
    self.mockManagerSuccess = nil;
    
    self.networkServiceFailure = nil;
    self.mockManagerFailure = nil;
    
    self.mockDelegate = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов GetListService

- (void)testNetworkServiceHandlesGetUrlsEvent {
    NSString *url = @"https://picsum.photos/v2/list";
    NSURLSessionDataTask *task = [NSURLSessionDataTask new];
    
    NSArray *jsonArray = @[@{@"download_url" : @"link1"}, @{@"download_url" : @"link2"}];
    NSArray *urlsArray = @[@"link1", @"link2"];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary: @{@"limit": @20}];
    NSInteger page = self.networkServiceSuccess.page;
    params[@"page"] = @(page);
    OCMStub([self.mockManagerSuccess GET:url parameters:params progress:nil success:([OCMArg invokeBlockWithArgs:task, jsonArray, nil]) failure:[OCMArg any]]);
    [self.networkServiceSuccess getUrls];
    OCMVerify([self.mockDelegate urlsReceived:urlsArray]);
    NSInteger newPage = self.networkServiceSuccess.page;
    XCTAssert(newPage != page);
    
    NSError* error = [[NSError alloc] initWithDomain: @"anyDomain"
                                                code: 10 userInfo: @{NSLocalizedDescriptionKey: @"test error"}];
    page = self.networkServiceFailure.page;
    params[@"page"] = @(page);
    OCMStub([self.mockManagerFailure GET:url parameters:params progress:nil success:[OCMArg any] failure:([OCMArg invokeBlockWithArgs:task, error, nil])]);
    [self.networkServiceFailure getUrls];
    OCMVerify([self.mockDelegate errorUrlLoad:@"test error"]);
    newPage = self.networkServiceFailure.page;
    XCTAssert(newPage != page);
}

#pragma mark - Тестирование других методов

- (void)testNetworkServiceHandlesUpdatePageEvent{
    NSInteger page = self.networkServiceSuccess.page;
    XCTAssert(page >= 0 && page < 50);
    [self.networkServiceSuccess updatePage];
    NSInteger newPage = self.networkServiceSuccess.page;
    XCTAssert(newPage != page && newPage >= 0 && newPage < 50);
}

@end
