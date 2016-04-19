//
//  NDIntroPageView.h
//  NDParallaxIntroView
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDIntroPageView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titlelabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHorizontalConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelHeightConstraint;

@end
