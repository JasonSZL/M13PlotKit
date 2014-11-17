//
//  ShapePointMarkerSample.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/17/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKShapePointMarker.h"

@interface ShapePointMarkerSample : UIViewController

@property (nonatomic, weak) IBOutlet PKShapePointMarker *circle;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *triangle;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *square;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *pentagon;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *hexagon;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *octogon;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *regularDiamond;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *diamond;
@property (nonatomic, weak) IBOutlet PKShapePointMarker *fivePointStar;


- (IBAction)changeFill:(id)sender;

@end
