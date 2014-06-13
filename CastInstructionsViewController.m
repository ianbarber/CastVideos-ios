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

  UIButton *transparencyButton = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
  transparencyButton.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
  transparencyButton.backgroundColor = [UIColor greenColor];
  [self.view insertSubview:transparencyButton aboveSubview:self.overlayView];
  [transparencyButton addTarget:self action:@selector(dismissOverlay:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)dismissOverlay:(id)sender {
  NSLog(@"Dismissed called");
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
