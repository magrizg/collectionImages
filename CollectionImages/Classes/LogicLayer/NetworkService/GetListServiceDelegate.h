//
//  GetListServiceDelegate.h
//  CollectionImages
//
//  Created by Mikhail G. on 18.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

@protocol GetListServiceDelegate <NSObject>

- (void)urlsReceived:(NSArray<NSString *> *)arrayUrls;
- (void)errorUrlLoad:(NSString *)errorMessage;

@end
