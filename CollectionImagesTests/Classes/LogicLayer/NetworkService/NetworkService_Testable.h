//
//  NetworkService_Testable.h
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "NetworkService.h"

@class AFHTTPSessionManager;

/**
 @author Mikhail G.
 Extension, который делает приватные property открытыми для тестирования.
 */
@interface NetworkService ()

@property(nonatomic, strong) AFHTTPSessionManager *manager;
@property(nonatomic) NSInteger page;

-(void)updatePage;

@end
