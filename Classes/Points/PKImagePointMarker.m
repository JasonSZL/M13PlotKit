//
//  PKImagePointMarker.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/17/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKImagePointMarker.h"

@interface PKImagePointMarker ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PKImagePointMarker

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = _image;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
}

@end
