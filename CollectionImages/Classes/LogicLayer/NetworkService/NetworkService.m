//
//  NetworkService.m
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "NetworkService.h"
#import <AFNetworking/AFNetworking.h>
#import "GetListServiceDelegate.h"

@interface NetworkService()

@property(nonatomic, strong) AFHTTPSessionManager *manager;
@property(nonatomic) NSInteger page;

@end

@implementation NetworkService

- (instancetype)init{
    self = [super init];
    if (self){
        self.manager = [AFHTTPSessionManager new];
        [self updatePage];
    }
    return self;
}

#pragma mark - Методы GetListService

- (void)getUrls{
    __weak typeof(self) weakSelf = self;
    [self.manager GET:@"https://picsum.photos/v2/list" parameters:@{@"limit": @20, @"page": @(self.page)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * _Nullable array) {
        id<GetListServiceDelegate> delegate = weakSelf.delegate;
        if (delegate){
            NSMutableArray<NSString *> *mArray = [NSMutableArray new];
            for (NSInteger i = 0; i < array.count; i++){
                NSDictionary *dict = array[i];
                [mArray addObject:dict[@"download_url"]];
            }
            [delegate urlsReceived:mArray];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        id<GetListServiceDelegate> delegate = weakSelf.delegate;
        if (delegate){
            [delegate errorUrlLoad:error.localizedDescription];
        }
    }];
    [self updatePage];
}

#pragma mark - Другие методы

-(void)updatePage{
    NSInteger page = arc4random_uniform(50);
    if (self.page == page){
        [self updatePage];
        return;
    }
    self.page = page;
}

@end
