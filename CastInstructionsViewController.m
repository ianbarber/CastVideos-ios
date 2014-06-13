//
//  CastInstructions.m
//  CastVideos
//
//  Created by Ikai Lan on 6/9/14.
//  Copyright (c) 2014 Google inc. All rights reserved.
//

#import "CastInstructionsViewController.h"

@interface CastInstructionsViewController ()

@end

@implementation CastInstructionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

-(IBAction)dismissOverlay:(id)sender {
  NSLog(@"Dismissed called");
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
