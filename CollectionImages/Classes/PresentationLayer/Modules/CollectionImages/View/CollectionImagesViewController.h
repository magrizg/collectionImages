//
//  CollectionImagesViewController.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionImagesViewInput.h"

@protocol CollectionImagesViewOutput;

@interface CollectionImagesViewController : UIViewController <CollectionImagesViewInput>

@property (nonatomic, strong) id<CollectionImagesViewOutput> output;

@end
