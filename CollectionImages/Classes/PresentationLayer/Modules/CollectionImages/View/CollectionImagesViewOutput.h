//
//  CollectionImagesViewOutput.h
//  CollectionImages
//
//  Created by Mikhail G. on 17/02/2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CollectionImagesViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;
- (void)buttonReloadPressed;

@end
