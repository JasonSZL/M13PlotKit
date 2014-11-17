//
//  Polygon.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/15/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Polygon)

/**Create a polygon with the given number of sides in the given rect.
 @param rect The rect to draw the polygon in.
 @param numberOfSides The number of sides the polygon has.
 @return A UIBezierPath representing a polygon with the given parameters.*/
+ (UIBezierPath*)bezierPathWithPolygonInRect:(CGRect)rect numberOfSides:(NSUInteger)numberOfSides;

@end
