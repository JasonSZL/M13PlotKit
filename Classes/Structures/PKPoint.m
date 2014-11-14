//
//  PKPoint.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKPoint.h"
#import "PKNumber.h"

#define kXPosKey @"X"
#define kYPosKey @"Y"

@implementation PKPoint


- (instancetype)initWithX:(PKNumber *)x Y:(PKNumber *)y
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

+ (instancetype)pointWithX:(PKNumber *)x Y:(PKNumber *)y
{
    return [[PKPoint alloc] initWithX:x Y:y];
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _x = [aDecoder valueForKey:kXPosKey];
        _y = [aDecoder valueForKey:kYPosKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_x forKey:kXPosKey];
    [aCoder encodeObject:_y forKey:kYPosKey];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    PKPoint *point = [PKPoint pointWithX:_x.copy Y:_y.copy];
    return point;
}

@end
