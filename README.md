# NDParallaxIntroView

A very easy to use and beautiful parallax IntroView for your App to onboard user.

## Installation

Just copy the NDParallaxIntroView folder into your project. A cocoapod is planned and will be available soon.

## Usage

Create a strong property of NDParallaxIntroView in your class from which you want to trigger your intro.
``` objective-c
#import "NDParallaxIntroView.h"

@property (strong, nonatomic) NDParallaxIntroView *introView;

@interface ViewController : UIViewController <NDParallaxIntroViewDelegate>
```
Usage:
``` objective-c
self.introView = [[NDIntroView alloc] initWithFrame:self.view.frame parallaxImage:[UIImage imageNamed:@"parallaxBgImage"] andData:pageContentArray];
self.introView.delegate = self;
[self.view addSubview:self.introView];
```
Important - You need to create the pageContentArray first which follows an easy structure (see example below). All values are optional so don't worry about the app crashing when you forget something ;)
``` objective-c
NSArray *pageContentArray = @[@{kNDIntroPageTitle : @"Work-It-Out",
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
```
Delegate method implementation is required
``` objective-c
-(void)launchAppButtonPressed
```

## Screenshot

Animated gif of NDParallaxIntroView comign soon ;)



## Author

Simon Wicha | simon.wicha@nomis-development.net

## License

NDParallaxIntroView is available under the MIT license. See the LICENSE file for more info.

