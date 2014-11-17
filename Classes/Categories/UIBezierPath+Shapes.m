//
//  Shapes.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/16/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "UIBezierPath+Shapes.h"

@implementation UIBezierPath (Shapes)

+ (UIBezierPath *)bezierPathWithRegularDiamondInRect:(CGRect)rect
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect))];
    [path closePath];
    return path;
}

+ (UIBezierPath *)bezierPathWithFivePointStarInRect:(CGRect)rect
{
    UIBezierPath* path = UIBezierPath.bezierPath;
    [path moveToPoint: CGPointMake(rect.origin.x + (0.50 * rect.size.width), rect.origin.y + (0.03 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.625 * rect.size.width), rect.origin.y + (0.3851 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (1.0 * rect.size.width), rect.origin.y + (0.3851 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.7083 * rect.size.width), rect.origin.y + (0.6149 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.8125 * rect.size.width), rect.origin.y + (0.97 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.50 * rect.size.width), rect.origin.y + (0.7611 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.1875 * rect.size.width), rect.origin.y + (0.97 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.2917 * rect.size.width), rect.origin.y + (0.6149 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.0 * rect.size.width), rect.origin.y + (0.3851 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.375 * rect.size.width), rect.origin.y + (0.3851 * rect.size.height))];
    [path addLineToPoint: CGPointMake(rect.origin.x + (0.50 * rect.size.width), rect.origin.y + (0.03 * rect.size.height))];
    [path closePath];
    path.miterLimit = 4;
    return path;
}

+ (UIBezierPath *)bezierPathWithDiamondInRect:(CGRect)rect
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(CGRectGetMaxX(rect) - (rect.size.width / 4.0), CGRectGetMidY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) +  (rect.size.width / 4.0), CGRectGetMidY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect))];
    [path closePath];
    return path;
}

@end
