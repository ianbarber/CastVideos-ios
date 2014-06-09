//
//  SemiModalAnimatedTransition.h
//  CastVideos
//
//  Created by Ikai Lan on 6/9/14.
//  Copyright (c) 2014 Google inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SemiModalAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL presenting;
@end