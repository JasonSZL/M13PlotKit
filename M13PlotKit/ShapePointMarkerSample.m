//
//  ShapePointMarkerSample.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/17/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "ShapePointMarkerSample.h"

@interface ShapePointMarkerSample ()

@end

@implementation ShapePointMarkerSample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _circle.shape = PKShapePointMarkerShapeCircle;
    _triangle.shape = PKShapePointMarkerShapeTriangle;
    _square.shape = PKShapePointMarkerShapeSquare;
    _pentagon.shape = PKShapePointMarkerShapePentagon;
    _hexagon.shape = PKShapePointMarkerShapeHexagon;
    _octogon.shape = PKShapePointMarkerShapeOctogon;
    _diamond.shape = PKShapePointMarkerShapeDiamond;
    _regularDiamond.shape = PKShapePointMarkerShapeRegularDiamond;
    _fivePointStar.shape = PKShapePointMarkerShapeStar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeFill:(id)sender
{
    if (((UISwitch *)sender).on) {
        _circle.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _circle.lineWidth = 0.0;
        _triangle.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _triangle.lineWidth = 0.0;
        _square.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _square.lineWidth = 0.0;
        _pentagon.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _pentagon.lineWidth = 0.0;
        _hexagon.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _hexagon.lineWidth = 0.0;
        _octogon.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _octogon.lineWidth = 0.0;
        _diamond.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _diamond.lineWidth = 0.0;
        _regularDiamond.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _regularDiamond.lineWidth = 0.0;
        _fivePointStar.fillColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.9 alpha:1];
        _fivePointStar.lineWidth = 0.0;
    } else {
        _circle.fillColor = [UIColor clearColor];
        _circle.lineWidth = 2.0;
        _triangle.fillColor = [UIColor clearColor];
        _triangle.lineWidth = 2.0;
        _square.fillColor = [UIColor clearColor];
        _square.lineWidth = 2.0;
        _pentagon.fillColor = [UIColor clearColor];
        _pentagon.lineWidth = 2.0;
        _hexagon.fillColor = [UIColor clearColor];
        _hexagon.lineWidth = 2.0;
        _octogon.fillColor = [UIColor clearColor];
        _octogon.lineWidth = 2.0;
        _diamond.fillColor = [UIColor clearColor];
        _diamond.lineWidth = 2.0;
        _regularDiamond.fillColor = [UIColor clearColor];
        _regularDiamond.lineWidth = 2.0;
        _fivePointStar.fillColor = [UIColor clearColor];
        _fivePointStar.lineWidth = 2.0;
    }
}

@end
