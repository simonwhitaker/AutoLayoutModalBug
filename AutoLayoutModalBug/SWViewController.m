//
//  SWViewController.m
//  AutoLayoutModalBug
//
//  Created by Simon Whitaker on 19/09/2013.
//  Copyright (c) 2013 Simon Whitaker. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@property (nonatomic, weak) UIView *additionalView;

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _addAdditionalView];
}

- (void)handleButton:(id)sender {
    
    SWModalViewController *vc = [[SWModalViewController alloc] initWithNibName:nil bundle:nil];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:^{
        // Once the modal view is presented, remove additionalView from our view hierarchy
        
        BOOL shouldPreventCrash = NO; // Set to YES to explicitly remove constraints when removing view from superview. This fixes the crasher.
        if (shouldPreventCrash) {
            for (NSLayoutConstraint *constraint in [[self view] constraints]) {
                if ([constraint firstItem] == [self additionalView] || [constraint secondItem] == [self additionalView]) {
                    [[self view] removeConstraint:constraint];
                }
            }
        }
        
        [[self additionalView] removeFromSuperview];
    }];
    
}

#pragma mark - SWModalViewControllerDelegate methods

- (void)viewControllerShouldDismiss:(SWModalViewController *)viewController {

    [self dismissViewControllerAnimated:YES completion:^{
        [self _addAdditionalView];
    }];
    
}

#pragma mark - Private methods

- (void)_addAdditionalView {
    // Add an additional view
    UIView *additionalView = [[UIView alloc] init];
    additionalView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [additionalView addConstraint:[NSLayoutConstraint constraintWithItem:additionalView
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:100]];
    
    [additionalView addConstraint:[NSLayoutConstraint constraintWithItem:additionalView
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:120]];
    [additionalView setBackgroundColor:[UIColor redColor]];
    [[self view] addSubview:additionalView];
    
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:additionalView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:[self button]
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:20.0]];
    [[self view] addConstraint:[NSLayoutConstraint constraintWithItem:additionalView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:[self button]
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self setAdditionalView:additionalView];
    
}

@end
