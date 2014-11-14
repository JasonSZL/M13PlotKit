//
//  PKPoint.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/11/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKPointMarker.h"

#define kLocation @"location"

@implementation PKPointMarker

- (instancetype)initWithPoint:(PKPoint *)location
{
    self = [super init];
    if (self) {
        self.location = location;
    }
    return self;
}

+ (instancetype)markerWithPoint:(PKPoint *)location
{
    return [[PKPointMarker alloc] initWithPoint:location.copy];
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _location = [aDecoder decodeObjectForKey:kLocation];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_location forKey:kLocation];
}


@end
