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

#import "CastInstructionsViewController.h"
#import "SemiModalAnimatedTransition.h"

@implementation CastInstructionsViewController

NSString *const kHasSeenChromecastOverlay = @"hasSeenChromecastOverlay";

+ (CastInstructionsViewController *) instantiateOverViewController:(UIViewController *) viewController {
  // Only show this overlay to the user once
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  bool hasSeenChromecastOverlay = [defaults boolForKey:kHasSeenChromecastOverlay];

  hasSeenChromecastOverlay = false; // TODO remove before release, this is for debugging only
  if(!hasSeenChromecastOverlay) {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:
                        [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"]
                                                 bundle:[NSBundle mainBundle]];
    CastInstructionsViewController *overlay = [sb instantiateViewControllerWithIdentifier:@"CastInstructions"];
    overlay.modalPresentationStyle = UIModalPresentationCustom;
    overlay.transitioningDelegate = overlay;
    [viewController presentViewController:overlay animated:YES completion:nil];

    [defaults setBool:true forKey:kHasSeenChromecastOverlay];
    [defaults synchronize];
    return overlay;
  }
  return nil;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

-(IBAction)dismissOverlay:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
  SemiModalAnimatedTransition *semiModalAnimatedTransition = [[SemiModalAnimatedTransition alloc] init];
  semiModalAnimatedTransition.presenting = YES;
  return semiModalAnimatedTransition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  SemiModalAnimatedTransition *semiModalAnimatedTransition = [[SemiModalAnimatedTransition alloc] init];
  return semiModalAnimatedTransition;
}

@end
