//
//  PKErrorBarGroup.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/14/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKErrorBar.h"

/**Defines what error bars to edit for different parameters.*/
typedef NS_OPTIONS(NSInteger, PKErrorBarLocation) {
    PKErrorBarLocationNone = 0,
    PKErrorBarLocationAll = 1 << 0,
    PKErrorBarLocationPositiveX = 1 << 1,
    PKErrorBarLocationNegativeX = 1 << 2,
    PKErrorBarLocationPositiveY = 1 << 3,
    PKErrorBarLocationNegativeY = 1 << 4,
};

/**Displays a group of error bars. Controls the layout of ± /xy error bars.*/
IB_DESIGNABLE
@interface PKErrorBarGroup : UIView <NSCopying>

/**Defines what error bars should be shown.*/
@property (nonatomic, assign) IBInspectable PKErrorBarLocation visibleBars;
/**The shape of the end caps to display on the error bars.*/
@property (nonatomic, assign) IBInspectable PKErrorBarEndCapType endCapType;
/**The width of the lines in the error bars.*/
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
/**The width of the error bars.*/
@property (nonatomic, assign) IBInspectable CGFloat barWidth;
/**The color of the error bar.*/
@property (nonatomic, strong) IBInspectable UIColor *errorBarColor;
/**The location of the center in the error bar group. (In points.)*/
@property (nonatomic, assign) IBInspectable CGPoint centerPoint;
/**The size of the space to put between all error bars in the center.
 @note This property is usually {0,0}, it should be set to a non-zero size for hollow point markers so that the error bars do not show in the center of the point.*/
@property (nonatomic, assign) IBInspectable CGSize centerGapSize;

@end
