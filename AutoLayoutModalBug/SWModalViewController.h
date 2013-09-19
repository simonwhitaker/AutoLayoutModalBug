//
//  SWModalViewController.h
//  AutoLayoutModalBug
//
//  Created by Simon Whitaker on 19/09/2013.
//  Copyright (c) 2013 Simon Whitaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SWMovalViewControllerDelegate;

@interface SWModalViewController : UIViewController

@property (nonatomic, weak) id<SWMovalViewControllerDelegate> delegate;
- (IBAction)handleButton:(id)sender;

@end

@protocol SWMovalViewControllerDelegate <NSObject>

- (void)viewControllerShouldDismiss:(SWModalViewController*)viewController;

@end