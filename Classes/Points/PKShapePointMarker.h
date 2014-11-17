//
//  PKShapePointMarker.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/15/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKPointMarker.h"

/**The available shapes to display as a data point.*/
typedef NS_ENUM(NSUInteger, PKShapePointMarkerShape) {
    //Regular Shapes
    PKShapePointMarkerShapeCircle,
    PKShapePointMarkerShapeTriangle,
    PKShapePointMarkerShapeSquare,
    PKShapePointMarkerShapePentagon,
    PKShapePointMarkerShapeHexagon,
    PKShapePointMarkerShapeOctogon,
    //Other Shapes
    PKShapePointMarkerShapeRegularDiamond,
    PKShapePointMarkerShapeDiamond,
    PKShapePointMarkerShapeStar,
};

/**A shape marker to denote a data point.*/
IB_DESIGNABLE
@interface PKShapePointMarker : PKPointMarker

/**The shape of the marker.*/
@property (nonatomic, assign) IBInspectable PKShapePointMarkerShape shape;
/**The color of the marker's fill.*/
@property (nonatomic, strong) IBInspectable UIColor *fillColor;
/**The color of the stroke around the marker.*/
@property (nonatomic, strong) IBInspectable UIColor *strokeColor;
/**The width of the stroke around the marker.*/
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

@end
