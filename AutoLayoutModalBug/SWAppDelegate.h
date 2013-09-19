//
//  SWAppDelegate.h
//  AutoLayoutModalBug
//
//  Created by Simon Whitaker on 19/09/2013.
//  Copyright (c) 2013 Simon Whitaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWViewController;

@interface SWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SWViewController *viewController;

@end
