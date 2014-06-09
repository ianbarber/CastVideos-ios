//
//  CastInstructions.h
//  CastVideos
//
//  Created by Ikai Lan on 6/9/14.
//  Copyright (c) 2014 Google inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CastInstructionsViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIView *overlayView;
- (IBAction)dismissOverlay:(id)sender;

@end
