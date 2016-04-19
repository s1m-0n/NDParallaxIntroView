//
//  ViewController.m
//  NDParallaxIntroViewExample
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import "ViewController.h"
#import "NDIntroView.h"

@interface ViewController () <NDIntroViewDelegate>

@property (strong, nonatomic) NDIntroView *introView;

@property (weak, nonatomic) IBOutlet UIButton *restartButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.restartButton setBackgroundColor:[UIColor colorWithRed:70.f/255.f green:130.f/255.f blue:180.f/255.f alpha:1.f]];
    self.restartButton.layer.cornerRadius = 5.f;
    
    [self startIntro];
}

- (IBAction)restartIntroViewButtonPressed:(id)sender {
    [self startIntro];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NDIntroView methods

-(void)startIntro {
    NSArray *pageContentArray = @[@{kNDIntroPageTitle : @"NDParallaxIntroView",
                                    kNDIntroPageDescription : @"Now you can easily add your beautiful intro into your app with no hassle.",
                                    kNDIntroPageImageName : @"parallax"
                                    },
                                  @{kNDIntroPageTitle : @"Work-It-Out",
                                    kNDIntroPageDescription : @"A great App to create your own personal workout and get instructed by your phone.",
                                    kNDIntroPageImageName : @"workitout"
                                    },
                                  @{kNDIntroPageTitle : @"ColorSkill",
                                    kNDIntroPageDescription : @"A small game while waiting for the bus. Easy, quick and addictive.",
                                    kNDIntroPageImageName : @"colorskill"
                                    },
                                  @{kNDIntroPageTitle : @"Appreciate",
                                    kNDIntroPageDescription : @"A little helper to make your life happier. Soon available on the AppStore",
                                    kNDIntroPageImageName : @"appreciate"
                                    },
                                  @{kNDIntroPageTitle : @"Do you like it?",
                                    kNDIntroPageImageName : @"firstImage",
                                    kNDIntroPageTitleLabelHeightConstraintValue : @0,
                                    kNDIntroPageImageHorizontalConstraintValue : @-40
                                    }
                                  ];
    self.introView = [[NDIntroView alloc] initWithFrame:self.view.frame parallaxImage:[UIImage imageNamed:@"parallaxBgImage"] andData:pageContentArray];
    self.introView.delegate = self;
    [self.view addSubview:self.introView];
}

-(void)launchAppButtonPressed {
    [UIView animateWithDuration:0.7f animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.introView removeFromSuperview];
    }];
}

@end
