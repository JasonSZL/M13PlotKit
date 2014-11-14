//
//  PKNumber.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**The base number object for PlotKit.*/
@interface PKNumber : NSObject <NSCoding, NSCopying>

/**@name Initalization*/

/**Inialize the number with a value and an error.
 @param value The value to give the number.
 @param positiveError The positive error in the value.
 @param negativeError The negative error in the value.
 @return A new PKNumber object.*/
- (instancetype)initWithValue:(CGFloat)value positiveError:(CGFloat)positiveError negativeError:(CGFloat)negativeError;
/**Inialize the number with a value and an error.
 @param value The value to give the number.
 @param positiveError The positive error in the value.
 @param negativeError The negative error in the value.
 @return A new PKNumber object.*/
+ (instancetype)numberWithValue:(CGFloat)value positiveError:(CGFloat)positiveError negativeError:(CGFloat)negativeError;

/**@name Properties*/

/**The number's value.*/
@property (nonatomic, assign) CGFloat value;
/**The positive error in the value. (Relative to the value)*/
@property (nonatomic, assign) CGFloat positiveError;
/**The negative error in the value. (Relative to the value)*/
@property (nonatomic, assign) CGFloat negativeError;

@end
