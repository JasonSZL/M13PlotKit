//
//  Polygon.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/15/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "UIBezierPath+Polygon.h"

@implementation UIBezierPath (Polygon)

+ (UIBezierPath *)bezierPathWithPolygonInRect:(CGRect)rect numberOfSides:(NSUInteger)numberOfSides
{
    if (numberOfSides < 3) {
        [NSException raise:NSInvalidArgumentException format:@"UIBezierPath bezierPathWithPolygon... requires numberOfSides to be 3 or greater"];
    }
    
    CGFloat xRadius = CGRectGetWidth(rect) / 2;
    CGFloat yRadius = CGRectGetHeight(rect) / 2;
    CGFloat centerX = CGRectGetMidX(rect);
    CGFloat centerY = CGRectGetMidY(rect);
    CGFloat thetaOffset = (numberOfSides % 2) == 0 ? 0 : -M_PI_2; //For odd numbers of sides, we want it to "point up".
    thetaOffset = (numberOfSides % 4) != 0 ? thetaOffset : ((2 * M_PI) / (CGFloat)numberOfSides) / 2.0; //For multiples of four, we want a flat side on the top, bottom, left and right.
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(centerX + xRadius * cosf(thetaOffset), centerY + yRadius * sinf(thetaOffset))];
    
    for (NSUInteger i = 0; i < numberOfSides; i++) {
        CGFloat theta = 2 * M_PI / numberOfSides * i;
        CGFloat xCoordinate = centerX + xRadius * cosf(theta + thetaOffset);
        CGFloat yCoordinate = centerY + yRadius * sinf(theta + thetaOffset);
        [bezierPath addLineToPoint:CGPointMake(xCoordinate, yCoordinate)];
    }
    
    [bezierPath closePath];
    
    return bezierPath;
}

@end
