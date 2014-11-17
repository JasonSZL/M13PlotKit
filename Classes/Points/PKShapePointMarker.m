//
//  PKShapePointMarker.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/15/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKShapePointMarker.h"
#import "UIBezierPath+Polygon.h"
#import "UIBezierPath+Shapes.h"

@interface PKShapePointMarker ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation PKShapePointMarker

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
    _shape = PKShapePointMarkerShapeCircle;
    _fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
    _strokeColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
    _lineWidth = 0.0;
    
    NSDictionary *newActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"onOrderIn",
                                [NSNull null], @"onOrderOut",
                                [NSNull null], @"sublayers",
                                [NSNull null], @"contents",
                                [NSNull null], @"bounds",
                                [NSNull null], @"frame",
                                [NSNull null], @"position",
                                [NSNull null], @"size",
                                [NSNull null], @"backgroundColor",
                                [NSNull null], @"fillColor",
                                [NSNull null], @"path",
                                [NSNull null], @"lineWidth",
                                nil];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = _fillColor.CGColor;
    _shapeLayer.strokeColor = _strokeColor.CGColor;
    _shapeLayer.lineWidth = 0.0;
    _shapeLayer.actions = newActions;
    
    [self.layer addSublayer:_shapeLayer];
}

- (void)setShape:(PKShapePointMarkerShape)shape
{
    _shape = shape;
    [self setNeedsLayout];
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    _shapeLayer.fillColor = _fillColor.CGColor;
}

- (UIBezierPath *)basePathForShape:(PKShapePointMarkerShape)shape inRect:(CGRect)rect
{
    if (_shape == PKShapePointMarkerShapeCircle) {
        return [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    } else if (_shape == PKShapePointMarkerShapeTriangle) {
        return [UIBezierPath bezierPathWithPolygonInRect:rect numberOfSides:3];
    } else if (_shape == PKShapePointMarkerShapeSquare) {
        return [UIBezierPath bezierPathWithPolygonInRect:rect numberOfSides:4];
    } else if (_shape == PKShapePointMarkerShapePentagon) {
        return [UIBezierPath bezierPathWithPolygonInRect:rect numberOfSides:5];
    } else if (_shape == PKShapePointMarkerShapeHexagon) {
        return [UIBezierPath bezierPathWithPolygonInRect:rect numberOfSides:6];
    } else if (_shape == PKShapePointMarkerShapeOctogon) {
        return [UIBezierPath bezierPathWithPolygonInRect:rect numberOfSides:8];
    } else if (_shape == PKShapePointMarkerShapeRegularDiamond) {
        return [UIBezierPath bezierPathWithRegularDiamondInRect:rect];
    } else if (_shape == PKShapePointMarkerShapeDiamond) {
        return [UIBezierPath bezierPathWithDiamondInRect:rect];
    } else if (_shape == PKShapePointMarkerShapeStar) {
        return [UIBezierPath bezierPathWithFivePointStarInRect:rect];
    }
    
    return nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _shapeLayer.path = [self basePathForShape:_shape inRect:self.bounds].CGPath;
}

@end
