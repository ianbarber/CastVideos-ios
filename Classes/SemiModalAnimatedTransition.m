// Copyright 2014 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "SemiModalAnimatedTransition.h"

// This class taken from this StackOverflow answer: http://stackoverflow.com/a/23624073/257141
// The purpose this class services is to offer a custom transition. This is needed in iOS7+, because
// presenting a new iOS controller will set the background to black (the window's background). This
// code allows us to create a tinted overlay to produce a lightbox effect for showing instructions
// for Chromecast usage.
@implementation SemiModalAnimatedTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
  return self.presenting ? 0.4 : 0.2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

  if (self.presenting) {
    fromViewController.view.userInteractionEnabled = NO;

    [transitionContext.containerView addSubview:fromViewController.view];
    [transitionContext.containerView addSubview:toViewController.view];

    toViewController.view.alpha = 0.0;
    toViewController.view.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    toViewController.view.bounds = fromViewController.view.bounds;
    toViewController.view.center = fromViewController.view.center;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
      toViewController.view.alpha = 1.0;

    } completion:^(BOOL finished) {
      [transitionContext completeTransition:YES];
    }];
  }
  else {
    toViewController.view.userInteractionEnabled = YES;

    [transitionContext.containerView addSubview:toViewController.view];
    [transitionContext.containerView addSubview:fromViewController.view];

    fromViewController.view.alpha = 1.0;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    fromViewController.view.alpha = 0.0;
    } completion:^(BOOL finished) {
      [transitionContext completeTransition:YES];
    }];
  }
}

@end
