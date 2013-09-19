# AutoLayoutModalBug

This project demonstrates a bug with a common UI workflow, related to Autolayout on iOS 6.

## The essence of the bug

Your app will crash if you perform the following workflow:

1. Add a subview to your current main view, positioned using Autolayout
2. Present a modal view on top of the current main view
3. Remove the subview from the main view while the modal view is visible
4. Dismiss the modal view

You can see this bug in action by compiling this project with the iOS 6.1 SDK (Xcode 4.6.3) and running on an iOS 6 device or simulator.

## The fix

The fix is to explicitly remove any constraints referencing the subview when you remove it from its superview.

To see the fix in action, set `shouldPreventCrash` in `SWViewController.m` to YES.

## Where it happens

In my experience, this only happens on apps linked against the iOS 6 SDK and run on iOS 6 devices.

I cannot reproduce the bug in iOS 7. Interestingly, I also cannot reproduce the bug on code linked against the iOS 6 SDK but running on an iOS 7 device.
