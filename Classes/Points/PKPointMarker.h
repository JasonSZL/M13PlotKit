//
//  PKPointMarker.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/11/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKPoint.h"

/**The base class that all data points are based off of.*/
@interface PKPointMarker : UIView <NSCoding, NSCopying>

/**@name Initalization*/

/**Initalize a new data point with a new point.
 @param location The location of the marker.
 @return A new point marker.*/
- (instancetype)initWithPoint:(PKPoint *)location;

/**Initalize a new data point with a new point.
 @param location The location of the marker.
 @return A new point marker.*/
+ (instancetype)markerWithPoint:(PKPoint *)location;

/**@name Data*/
/**The location of the point and its error.*/
@property (nonatomic, assign) PKPoint *location;

/**@name Appearance*/
/**Wether or not the data point is selected.*/
@property (nonatomic, assign) BOOL selected;

@end
