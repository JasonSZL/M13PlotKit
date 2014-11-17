//
//  PKImagePointMarker.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/17/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKPointMarker.h"

/**Marks a point with an image.*/
IB_DESIGNABLE
@interface PKImagePointMarker : PKPointMarker

/**The image for the marker.*/
@property (nonatomic, strong) IBInspectable UIImage *image;

@end
