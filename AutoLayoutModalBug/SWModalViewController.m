//
//  SWModalViewController.m
//  AutoLayoutModalBug
//
//  Created by Simon Whitaker on 19/09/2013.
//  Copyright (c) 2013 Simon Whitaker. All rights reserved.
//

#import "SWModalViewController.h"

@interface SWModalViewController ()

@end

@implementation SWModalViewController

- (void)handleButton:(id)sender {
    
    [self.delegate viewControllerShouldDismiss:self];
    
}

@end
