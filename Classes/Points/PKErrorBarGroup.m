//
//  PKErrorBarGroup.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/14/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKErrorBarGroup.h"

@interface PKErrorBarGroup ()

@property (nonatomic, strong) PKErrorBar *positiveXBar;
@property (nonatomic, strong) PKErrorBar *negativeXBar;
@property (nonatomic, strong) PKErrorBar *positiveYBar;
@property (nonatomic, strong) PKErrorBar *negativeYBar;

@end

@implementation PKErrorBarGroup

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
    PKErrorBarGroup *group = [[PKErrorBarGroup alloc] init];
    
    group.visibleBars = _visibleBars;
    group.endCapType = _endCapType;
    group.lineWidth = _lineWidth;
    group.barWidth = _barWidth;
    group.errorBarColor = _errorBarColor;
    group.centerGapSize = _centerGapSize;
    
    return group;
}

- (void)setup
{
    self.clipsToBounds = false;
    
    _errorBarColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
    _lineWidth = 2.0;
    _endCapType = PKErrorBarEndCapTypeLine;
    _barWidth = 10.0;
    _centerGapSize = CGSizeMake(0.0, 0.0);
    
    self.visibleBars = PKErrorBarLocationAll;
}

- (void)setEndCapType:(PKErrorBarEndCapType)endCapType
{
    _endCapType = endCapType;
    if (_positiveYBar) {
        _positiveYBar.endCapType = _endCapType;
    }
    if (_positiveXBar) {
        _positiveXBar.endCapType = _endCapType;
    }
    if (_negativeXBar) {
        _negativeXBar.endCapType = _endCapType;
    }
    if (_negativeYBar) {
        _negativeYBar.endCapType = _endCapType;
    }
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    if (_positiveYBar) {
        _positiveYBar.lineWidth = _lineWidth;
    }
    if (_positiveXBar) {
        _positiveXBar.lineWidth = _lineWidth;
    }
    if (_negativeXBar) {
        _negativeXBar.lineWidth = _lineWidth;
    }
    if (_negativeYBar) {
        _negativeYBar.lineWidth = _lineWidth;
    }
}

- (void)setBarWidth:(CGFloat)barWidth
{
    _barWidth = barWidth;
    [self setNeedsLayout];
}

- (void)setErrorBarColor:(UIColor *)errorBarColor
{
    _errorBarColor = errorBarColor;
    if (_positiveYBar) {
        _positiveYBar.errorBarColor = _errorBarColor;
    }
    if (_positiveXBar) {
        _positiveXBar.errorBarColor = _errorBarColor;
    }
    if (_negativeXBar) {
        _negativeXBar.errorBarColor = _errorBarColor;
    }
    if (_negativeYBar) {
        _negativeYBar.errorBarColor = _errorBarColor;
    }
}

- (void)setCenterGapSize:(CGSize)centerGapSize
{
    _centerGapSize = centerGapSize;
    [self setNeedsLayout];
}

- (void)setCenterPoint:(CGPoint)centerPoint
{
    _centerPoint = centerPoint;
    
    //Hide error bars as needed.
    if (_centerPoint.y == 0) {
        _positiveYBar.hidden = true;
    } else {
        _positiveYBar.hidden = false;
    }
    
    if (_centerPoint.y == self.bounds.size.height) {
        _negativeYBar.hidden = true;
    } else {
        _negativeYBar.hidden = false;
    }
    
    if (_centerPoint.x == 0) {
        _negativeXBar.hidden = true;
    } else {
        _negativeXBar.hidden = false;
    }
    
    if (_centerPoint.x == self.bounds.size.width) {
        _positiveXBar.hidden = true;
    } else {
        _positiveXBar.hidden = false;
    }
}

- (void)setVisibleBars:(PKErrorBarLocation)visibleBars
{
    _visibleBars = visibleBars;
    
    if ((_visibleBars & PKErrorBarLocationAll || _visibleBars & PKErrorBarLocationPositiveY) && !_positiveYBar) {
        //Create if needed
        _positiveYBar = [[PKErrorBar alloc] init];
        _positiveYBar.errorBarColor = _errorBarColor;
        _positiveYBar.lineWidth = _lineWidth;
        _positiveYBar.endCapType = _endCapType;
        [self addSubview:_positiveYBar];
    } else if ((!(_visibleBars & PKErrorBarLocationAll) && !(_visibleBars & PKErrorBarLocationPositiveY)) && _positiveYBar) {
        //Remove if necessary
        [_positiveYBar removeFromSuperview];
        _positiveYBar = nil;
    }
    
    if ((_visibleBars & PKErrorBarLocationAll || _visibleBars & PKErrorBarLocationNegativeY) && !_negativeYBar) {
        //Create if needed
        _negativeYBar = [[PKErrorBar alloc] init];
        _negativeYBar.errorBarColor = _errorBarColor;
        _negativeYBar.lineWidth = _lineWidth;
        _negativeYBar.endCapType = _endCapType;
        
        _negativeYBar.transform = CGAffineTransformMakeRotation(M_PI);
        
        [self addSubview:_negativeYBar];
    } else if ((!(_visibleBars & PKErrorBarLocationAll) && !(_visibleBars & PKErrorBarLocationNegativeY)) && _negativeYBar) {
        //Remove if necessary
        [_negativeYBar removeFromSuperview];
        _negativeYBar = nil;
    }
    
    if ((_visibleBars & PKErrorBarLocationAll || _visibleBars & PKErrorBarLocationPositiveX) && !_positiveXBar) {
        //Create if needed
        _positiveXBar = [[PKErrorBar alloc] init];
        _positiveXBar.errorBarColor = _errorBarColor;
        _positiveXBar.lineWidth = _lineWidth;
        _positiveXBar.endCapType = _endCapType;
        
        //Rotate around the origin for easier layout.
        _positiveXBar.layer.anchorPoint = CGPointMake(0.0, 0.0);
        _positiveXBar.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        [self addSubview:_positiveXBar];
    } else if ((!(_visibleBars & PKErrorBarLocationAll) && !(_visibleBars & PKErrorBarLocationPositiveX)) && _positiveXBar) {
        //Remove if necessary
        [_positiveXBar removeFromSuperview];
        _positiveXBar = nil;
    }
    
    if ((_visibleBars & PKErrorBarLocationAll || _visibleBars & PKErrorBarLocationNegativeX) && !_negativeXBar) {
        //Create if needed
        _negativeXBar = [[PKErrorBar alloc] init];
        _negativeXBar.errorBarColor = _errorBarColor;
        _negativeXBar.lineWidth = _lineWidth;
        _negativeXBar.endCapType = _endCapType;
        
        //Rotate around the origin for easier layout.
        _negativeXBar.layer.anchorPoint = CGPointMake(0.0, 0.0);
        _negativeXBar.transform = CGAffineTransformMakeRotation(-M_PI_2);
        
        [self addSubview:_negativeXBar];
    } else if ((!(_visibleBars & PKErrorBarLocationAll) && !(_visibleBars & PKErrorBarLocationNegativeX)) && _negativeXBar) {
        //Remove if necessary
        [_negativeXBar removeFromSuperview];
        _negativeXBar = nil;
    }
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _positiveYBar.frame = CGRectMake(_centerPoint.x - (_barWidth / 2.0), 0, _barWidth, _centerPoint.y - (_centerGapSize.height / 2.0));
    _negativeYBar.frame = CGRectMake(_centerPoint.x - (_barWidth / 2.0), _centerPoint.y + (_centerGapSize.height / 2.0), _barWidth, self.bounds.size.height - (_centerPoint.y + (_centerGapSize.height / 2.0)));
    _negativeXBar.frame = CGRectMake(0, _centerPoint.y + (_barWidth / 2.0), _centerPoint.x - (_centerGapSize.width / 2.0), _barWidth);
    _positiveXBar.frame = CGRectMake(self.bounds.size.width, _centerPoint.y - (_barWidth / 2.0), self.bounds.size.width - _centerPoint.x - (_centerGapSize.width / 2.0), _barWidth);
}

@end
