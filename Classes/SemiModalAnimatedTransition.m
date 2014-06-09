//
//  SemiModalAnimatedTransition.m
//  CastVideos
//
//  Created by Ikai Lan on 6/9/14.
//  Copyright (c) 2014 Google inc. All rights reserved.
//

#import "SemiModalAnimatedTransition.h"

// This class taken from this StackOverflow answer: http://stackoverflow.com/a/23624073/257141
// The purpose this class services is to offer a custom transition. This is needed in iOS7+, because
// presenting a new iOS controller will set the background to black (the window's background). This
// code allows us to create a tinted overlay to produce a lightbox effect for showing instructions
// for Chromecast usage.
@implementation SemiModalAnimatedTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
  return self.presenting ? 0.6 : 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

  CGRect endFrame = fromViewController.view.bounds;

  if (self.presenting) {
    fromViewController.view.userInteractionEnabled = NO;

    [transitionContext.containerView addSubview:fromViewController.view];
    [transitionContext.containerView addSubview:toViewController.view];

    CGRect startFrame = endFrame;
    startFrame.origin.y = endFrame.size.height;

    toViewController.view.frame = startFrame;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
      toViewController.view.frame = endFrame;
    } completion:^(BOOL finished) {
      [transitionContext completeTransition:YES];
    }];
  }
  else {
    toViewController.view.userInteractionEnabled = YES;

    [transitionContext.containerView addSubview:toViewController.view];
    [transitionContext.containerView addSubview:fromViewController.view];

    endFrame.origin.y = endFrame.size.height;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
      fromViewController.view.frame = endFrame;
    } completion:^(BOOL finished) {
      [transitionContext completeTransition:YES];
    }];
  }
}

@end
