//
//  ImageCellViewModel.m
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ImageCellViewModel.h"
#import "ImageCell.h"

@implementation ImageCellViewModel

- (instancetype)init{
    self = [super init];
    if (self){
        self.classCell = [ImageCell class];
    }
    return self;
}

- (instancetype)initWithLinkImage:(NSString *)linkImage{
    self = [self init];
    if (self){
        self.linkImage = linkImage;
    }
    return self;
}

- (BOOL)isEqual:(ImageCellViewModel *)object{
    if (!object){
        return false;
    }
    if (![object isKindOfClass: [ImageCellViewModel class]]){
        return false;
    }
    NSString *linkImage = object.linkImage;
    NSString *selfLinkImage = self.linkImage;
    if(linkImage){
        if (![linkImage isEqual:selfLinkImage]){
            return false;
        }
    }else if (selfLinkImage){
        return false;
    }
    return true;
}

@end
