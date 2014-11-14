//
//  PKErrorBar.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/12/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**The types of end caps available for error bars.*/
typedef NS_ENUM(NSInteger, PKErrorBarEndCapType) {
    PKErrorBarEndCapTypeNone, //No end caps
    PKErrorBarEndCapTypeLine, //Line end caps
    PKErrorBarEndCapTypeTriangle, //Triangular / arrow end caps
    PKErrorBarEndCapTypeSquare, //Square end caps
    PKErrorBarEndCapTypeSemiCircle, //Semi circle end caps
    PKErrorBarEndCapTypeCircle, //Circle end caps.
};


/**An error bar that is displaied in conjunction with data points on a plot.*/
IB_DESIGNABLE
@interface PKErrorBar : UIView <NSCoding, NSCopying>

/**@name Appearance*/

/**The shape of the end cap to display on the error bar.*/
/**Enums should be supported in IB, for some reason they are not.*/
@property (nonatomic, assign) IBInspectable PKErrorBarEndCapType endCapType;

/**The width of the lines in the error bar.*/
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

/**The color of the positive error bar.*/
@property (nonatomic, strong) IBInspectable UIColor *errorBarColor;

@end
