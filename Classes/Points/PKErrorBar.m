//
//  PKErrorBar.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKErrorBar.h"
#import <CoreGraphics/CoreGraphics.h>

@interface PKErrorBar ()

//Use CALayers instead of drawRect:, it can cashe.
@property (nonatomic, strong) CALayer *barLayer;
@property (nonatomic, strong) CAShapeLayer *capLayer;

@end


@implementation PKErrorBar
{
    CGFloat previousWidth;
}

- (instancetype)init
{
    self = [super init];
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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    PKErrorBar *bar = [[PKErrorBar alloc] init];
    bar.endCapType = _endCapType;
    bar.lineWidth = _lineWidth;
    bar.errorBarColor = _errorBarColor;
    return bar;
}

- (void)setup
{
    _barLayer = [CALayer layer];
    [self.layer addSublayer:_barLayer];
    _capLayer = [CAShapeLayer layer];
    [self.layer addSublayer:_capLayer];
    
    //Disable automatic animations
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
                                nil];
    _barLayer.actions = newActions;
    _capLayer.actions = newActions;
    self.layer.actions = newActions;
    
    //Use self calls to help finish setting up.
    _errorBarColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
    
    _lineWidth = 2.0;
    _endCapType = PKErrorBarEndCapTypeLine;
    
    [self setNeedsLayout];
}

- (void)setErrorBarColor:(UIColor *)errorBarColor
{
    _errorBarColor = errorBarColor;
    _barLayer.backgroundColor = errorBarColor.CGColor;
    _capLayer.fillColor = errorBarColor.CGColor;
}

- (CGFloat)capHeight
{
    CGFloat capHeight = 0.0;
    if (_endCapType == PKErrorBarEndCapTypeLine) {
        capHeight = _lineWidth;
    } else if (_endCapType == PKErrorBarEndCapTypeTriangle) {
        capHeight = (sqrtf(3.0) / 2.0) * self.frame.size.width;
    } else if (_endCapType == PKErrorBarEndCapTypeSquare) {
        capHeight = self.frame.size.width;
    } else if (_endCapType == PKErrorBarEndCapTypeSemiCircle) {
        capHeight = self.frame.size.width / 2.0;
    } else if (_endCapType == PKErrorBarEndCapTypeCircle) {
        capHeight = self.frame.size.width;
    }
    return capHeight;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    if (_endCapType == PKErrorBarEndCapTypeLine) {
        [self updateCap];
    }
    
    [self setNeedsLayout];
}

- (void)setEndCapType:(PKErrorBarEndCapType)endCapType
{
    _endCapType = endCapType;
    [self updateCap];
    [self setNeedsLayout];
}

- (void)updateCap
{
    //Are we displaying a cap?
    if (_endCapType == PKErrorBarEndCapTypeNone) {
        _capLayer.path = nil;
    }
    
    UIBezierPath *cap = [[UIBezierPath alloc] init];
    
    //Run through each of the types and create the path.
    if (_endCapType == PKErrorBarEndCapTypeLine) {
        cap = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.frame.size.width, _lineWidth)];
    } else if (_endCapType == PKErrorBarEndCapTypeTriangle) {
        CGFloat capHeight = [self capHeight];
        [cap moveToPoint:CGPointMake(self.frame.size.width / 2.0, 0)];
        [cap addLineToPoint:CGPointMake(self.frame.size.width, capHeight)];
        [cap addLineToPoint:CGPointMake(0, capHeight)];
        [cap closePath];
    } else if (_endCapType == PKErrorBarEndCapTypeSquare) {
        cap = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    } else if (_endCapType == PKErrorBarEndCapTypeSemiCircle) {
        CGFloat capHeight = [self capHeight];
        cap = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.0, capHeight) radius:(self.frame.size.width / 2.0) startAngle:0 endAngle:M_PI clockwise:false];
        [cap closePath];
    } else if (_endCapType == PKErrorBarEndCapTypeCircle) {
        cap = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    }
    
    //Set the path
    _capLayer.path = cap.CGPath;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //Update the cap if need be.
    if (previousWidth != self.frame.size.width) {
        [self updateCap];
        previousWidth = self.frame.size.width;
    }
    
    CGFloat capHeight = [self capHeight];
    _capLayer.frame = CGRectMake(0, 0, self.frame.size.width, capHeight);
    
    //Adjust the bar for the cap
    CGFloat barAdjustment = - (capHeight / 2.0);
    _barLayer.frame = CGRectMake((self.frame.size.width - _lineWidth) / 2.0, capHeight + barAdjustment, _lineWidth, self.frame.size.height - capHeight - barAdjustment);
    
}

@end
