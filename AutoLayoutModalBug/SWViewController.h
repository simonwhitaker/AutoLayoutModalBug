//
//  SWViewController.h
//  AutoLayoutModalBug
//
//  Created by Simon Whitaker on 19/09/2013.
//  Copyright (c) 2013 Simon Whitaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWModalViewController.h"

@interface SWViewController : UIViewController <SWMovalViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIButton *button;

- (IBAction)handleButton:(id)sender;

@end
