//
//  ErrorBarGroupSample.m
//  M13PlotKit
//
//  Created by Brandon McQuilkin on 11/14/14.
//  Copyright (c) 2014 BrandonMcQuilkin. All rights reserved.
//

#import "ErrorBarGroupSample.h"

@implementation ErrorBarGroupSample

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _errorBarGroup.frame = CGRectMake((self.view.frame.size.width - _errorBarGroup.frame.size.width) / 2.0, 72, _errorBarGroup.frame.size.width, _errorBarGroup.frame.size.height);
    _errorBarGroup.centerPoint = CGPointMake(45.0, 45.0);
}

- (void)randomColor:(id)sender
{
    _errorBarGroup.errorBarColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1.0];
}

- (void)cycleEndCap:(id)sender
{
    NSUInteger capType = _errorBarGroup.endCapType;
    capType += 1;
    if (capType > PKErrorBarEndCapTypeCircle) {
        capType = 0;
    }
    _errorBarGroup.endCapType = capType;
}

- (void)updateWidth:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBarGroup.frame = CGRectMake((self.view.frame.size.width - slider.value) / 2.0, 72, slider.value, _errorBarGroup.frame.size.height);
}

- (void)updateLength:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBarGroup.frame = CGRectMake((self.view.frame.size.width - _errorBarGroup.frame.size.width) / 2.0, 72, _errorBarGroup.frame.size.width, slider.value);
}

- (void)updateLineWidth:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBarGroup.lineWidth = slider.value;
}

- (void)updateBarWidth:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _errorBarGroup.barWidth = slider.value;
}

- (void)toggleBars:(id)sender
{
    if (!_lSwitch.on && !_rSwitch.on && !_tSwitch.on && !_bSwitch.on) {
        _errorBarGroup.visibleBars = PKErrorBarLocationNone;
        return;
    } else if (_lSwitch.on && _rSwitch.on && _tSwitch.on && _bSwitch.on) {
        _errorBarGroup.visibleBars = PKErrorBarLocationAll;
        return;
    }
    
    //I don't think this is the right way to do this. I am a bit too lazy to code > 16 if statements for the four options.
    
    PKErrorBarLocation loc = PKErrorBarLocationNone;
    if (_tSwitch.on) {
        loc = PKErrorBarLocationPositiveY;
    }
    
    if (_bSwitch.on) {
        if (loc & PKErrorBarLocationPositiveY) {
            loc = loc | PKErrorBarLocationNegativeY;
        } else {
            loc = PKErrorBarLocationNegativeY;
        }
    }
    
    if (_rSwitch.on) {
        if (loc & PKErrorBarLocationPositiveY || loc & PKErrorBarLocationNegativeY) {
            loc = loc | PKErrorBarLocationPositiveX;
        } else {
            loc = PKErrorBarLocationPositiveX;
        }
    }
    
    if (_lSwitch.on) {
        if (loc & PKErrorBarLocationPositiveY || loc & PKErrorBarLocationNegativeY || loc & PKErrorBarLocationNegativeX) {
            loc = loc | PKErrorBarLocationNegativeX;
        } else {
            loc = PKErrorBarLocationNegativeX;
        }
    }
    
    _errorBarGroup.visibleBars = loc;
}

@end
