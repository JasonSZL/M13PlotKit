//
//  ErrorBarSample.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/13/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKErrorBar.h"

@interface ErrorBarSample : UIViewController

@property (nonatomic, weak) IBOutlet PKErrorBar *errorBar;

- (IBAction)randomColor:(id)sender;
- (IBAction)cycleEndCap:(id)sender;
- (IBAction)updateWidth:(id)sender;
- (IBAction)updateLineWidth:(id)sender;
- (IBAction)updateLength:(id)sender;

@end
