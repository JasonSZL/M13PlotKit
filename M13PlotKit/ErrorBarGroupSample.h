//
//  ErrorBarGroupSample.h
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/14/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKErrorBarGroup.h"

@interface ErrorBarGroupSample : UIViewController

@property (nonatomic, weak) IBOutlet PKErrorBarGroup *errorBarGroup;

@property (nonatomic, weak) IBOutlet UISwitch *lSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *rSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *tSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *bSwitch;

- (IBAction)randomColor:(id)sender;
- (IBAction)cycleEndCap:(id)sender;
- (IBAction)updateWidth:(id)sender;
- (IBAction)updateLineWidth:(id)sender;
- (IBAction)updateBarWidth:(id)sender;
- (IBAction)updateLength:(id)sender;
- (IBAction)toggleBars:(id)sender;

@end
