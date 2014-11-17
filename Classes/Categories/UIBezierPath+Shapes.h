//
//  Shapes.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/16/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Shapes)

/**@name Regular Shapes*/
/**Creates a regular diamond in the given rect.
 @param rect The rectangle to create the diamond in.
 @return A new UIBezierPath.*/
+ (UIBezierPath *)bezierPathWithRegularDiamondInRect:(CGRect)rect;
/**Creates a five point star in the given rect.
 @param rect The rectangle to create the star in.
 @return A new UIBezierPath.*/
+ (UIBezierPath *)bezierPathWithFivePointStarInRect:(CGRect)rect;
/**Creates a diamond in the given rect.
 @param rect The rect to create the diamond in.
 @return A new UIBezierPath.*/
+ (UIBezierPath *)bezierPathWithDiamondInRect:(CGRect)rect;

@end
