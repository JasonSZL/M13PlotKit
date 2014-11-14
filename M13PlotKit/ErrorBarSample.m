//
//  ErrorBarSample.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/13/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "ErrorBarSample.h"

@implementation ErrorBarSample

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _errorBar.frame = CGRectMake((self.view.frame.size.width - _errorBar.frame.size.width) / 2.0, 72, _errorBar.frame.size.width, _errorBar.frame.size.height);
}

- (void)randomColor:(id)sender
{
    _errorBar.errorBarColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0];
}

- (void)cycleEndCap:(id)sender
{
    NSUInteger capType = _errorBar.endCapType;
    capType += 1;
    if (capType > PKErrorBarEndCapTypeCircle) {
        capType = 0;
    }
    _errorBar.endCapType = capType;
}

- (void)updateWidth:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBar.frame = CGRectMake((self.view.frame.size.width - slider.value) / 2.0, 72, slider.value, _errorBar.frame.size.height);
}

- (void)updateLength:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBar.frame = CGRectMake((self.view.frame.size.width - _errorBar.frame.size.width) / 2.0, 72, _errorBar.frame.size.width, slider.value);
}

- (void)updateLineWidth:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBar.lineWidth = slider.value;
}


@end
