//
//  ImageCell.m
//  CollectionImages
//
//  Created by Mikhail G. on 19.02.2020.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ImageCell.h"
#import "ImageCellViewModel.h"
#import "Masonry.h"
#import <SDWebImage/SDWebImage.h>

@interface ImageCell()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        UIView *contentView = self.contentView;
        UIImageView *imageView = self.imageView;
        [contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(contentView);
        }];
    }
    return self;
}

- (void)setViewModel:(ImageCellViewModel *)viewModel{
    [super setViewModel:viewModel];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:viewModel.linkImage] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

- (UIImageView *)imageView{
    UIImageView *imageView = _imageView;
    if (!imageView){
        imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView = imageView;
    }
    return imageView;
}

@end
