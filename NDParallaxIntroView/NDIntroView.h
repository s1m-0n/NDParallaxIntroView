//
//  NDIntroPageView.h
//  NDParallaxIntroView
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NDIntroViewDelegate <NSObject>

-(void)onDoneButtonPressed;

@end

@interface NDIntroView : UIView
@property id<NDIntroViewDelegate> delegate;

@end
