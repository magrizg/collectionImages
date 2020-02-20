//
//  NetworkService.h
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GetListService.h"

@protocol GetListServiceDelegate;

@interface NetworkService : NSObject <GetListService>

@property(nonatomic, weak) id<GetListServiceDelegate> delegate;

@end
