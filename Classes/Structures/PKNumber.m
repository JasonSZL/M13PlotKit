//
//  PKNumber.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "PKNumber.h"

#define kValueKey @"valueInformation"
#define kPositiveErrorKey @"PositiveError"
#define kNegativeErrorKey @"NegativeError"

@implementation PKNumber

- (instancetype)initWithValue:(CGFloat)value positiveError:(CGFloat)positiveError negativeError:(CGFloat)negativeError
{
    self = [super init];
    if (self) {
        _value = value;
        _positiveError = positiveError;
        _negativeError = negativeError;
    }
    return self;
}

+ (instancetype)numberWithValue:(CGFloat)value positiveError:(CGFloat)positiveError negativeError:(CGFloat)negativeError
{
    return [[PKNumber alloc] initWithValue:value positiveError:positiveError negativeError:negativeError];
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        if ([aDecoder valueForKey:kValueKey] != nil) {
            [((NSValue *)[aDecoder valueForKey:kValueKey]) getValue:&_value];
        }
        if ([aDecoder valueForKey:kPositiveErrorKey] != nil) {
            [((NSValue *)[aDecoder valueForKey:kPositiveErrorKey]) getValue:&_positiveError];
        }
        if ([aDecoder valueForKey:kNegativeErrorKey] != nil) {
            [((NSValue *)[aDecoder valueForKey:kNegativeErrorKey]) getValue:&_negativeError];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:[NSValue valueWithBytes:&_value objCType:@encode(CGFloat)] forKey:kValueKey];
    [coder encodeObject:[NSValue valueWithBytes:&_positiveError objCType:@encode(CGFloat)] forKey:kPositiveErrorKey];
    [coder encodeObject:[NSValue valueWithBytes:&_negativeError objCType:@encode(CGFloat)] forKey:kNegativeErrorKey];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    PKNumber *number = [PKNumber numberWithValue:_value positiveError:_positiveError negativeError:_negativeError];
    return number;
}

@end
