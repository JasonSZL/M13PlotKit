//
//  PKPoint.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PKNumber;

/**The base point object for PlotKit.*/
@interface PKPoint : NSObject <NSCoding, NSCopying>

/**@name Initalization*/
/**Initalize a new point.
 @param x The number representing the x position.
 @param y The number representing the y position.
 @return A new PKPoint.*/
- (instancetype)initWithX:(PKNumber *)x Y:(PKNumber *)y;
/**Initalize a new point.
 @param x The number representing the x position.
 @param y The number representing the y position.
 @return A new PKPoint.*/
+ (instancetype)pointWithX:(PKNumber *)x Y:(PKNumber *)y;

/**@name Properties*/

/**The x value of the point.*/
@property (nonatomic, strong) PKNumber *x;
/**The x value of the point.*/
@property (nonatomic, strong) PKNumber *y;

@end
