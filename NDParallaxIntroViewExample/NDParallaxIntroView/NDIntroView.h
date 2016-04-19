//
//  NDIntroPageView.h
//  NDParallaxIntroView
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kNDIntroPageTitle = @"title";
static NSString *const kNDIntroPageDescription = @"description";
static NSString *const kNDIntroPageImageName = @"imageName";
static NSString *const kNDIntroPageTitleLabelHeightConstraintValue = @"titleLabelHeightConstraint";
static NSString *const kNDIntroPageImageHorizontalConstraintValue = @"imageHorizontalConstraint";

@protocol NDIntroViewDelegate <NSObject>

@required

-(void)launchAppButtonPressed;

@end

@interface NDIntroView : UIView

@property (assign, nonatomic) id<NDIntroViewDelegate> delegate;
@property (strong, nonatomic) UIButton *lastPageButton;
@property (strong, nonatomic) UIPageControl *pageControl;

- (id)initWithFrame:(CGRect)frame parallaxImage:(UIImage *)parallaxImage andData:(NSArray *)data;

@end
