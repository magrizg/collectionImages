//
//  CollectionImagesAssemblyTests.m
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "CollectionImagesAssembly.h"
#import "CollectionImagesAssembly_Testable.h"

#import "CollectionImagesViewController.h"
#import "CollectionImagesPresenter.h"
#import "CollectionImagesInteractor.h"
#import "CollectionImagesRouter.h"
#import "NetworkService.h"

@interface CollectionImagesAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) CollectionImagesAssembly *assembly;

@end

@implementation CollectionImagesAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];
    
    self.assembly = [[CollectionImagesAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [CollectionImagesViewController class];
    NSArray *protocols = @[
        @protocol(CollectionImagesViewInput)
    ];
    NSArray *dependencies = @[
        RamblerSelector(output)
    ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly viewCollectionImages];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [CollectionImagesPresenter class];
    NSArray *protocols = @[
        @protocol(CollectionImagesModuleInput),
        @protocol(CollectionImagesViewOutput),
        @protocol(CollectionImagesInteractorOutput)
    ];
    NSArray *dependencies = @[
        RamblerSelector(interactor),
        RamblerSelector(view),
        RamblerSelector(router)
    ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly presenterCollectionImages];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [CollectionImagesInteractor class];
    NSArray *protocols = @[
        @protocol(CollectionImagesInteractorInput),
        @protocol(GetListServiceDelegate)
    ];
    NSArray *dependencies = @[
        RamblerSelector(output),
        RamblerSelector(getListService)
    ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly interactorCollectionImages];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [CollectionImagesRouter class];
    NSArray *protocols = @[
        @protocol(CollectionImagesRouterInput)
    ];
    NSArray *dependencies = @[
        RamblerSelector(transitionHandler)
    ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly routerCollectionImages];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesGetListService {
    // given
    Class targetClass = [NetworkService class];
    NSArray *protocols = @[
        @protocol(GetListService)
    ];
    NSArray *dependencies = @[
        RamblerSelector(delegate)
    ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly getListService];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
