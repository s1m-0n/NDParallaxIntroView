//
//  NDIntroPageView.m
//  NDParallaxIntroView
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import "NDIntroPageView.h"

@implementation NDIntroPageView

- (void)initialize{
    self.backgroundColor = [UIColor clearColor];
}

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect]){
        [self initialize];
    }
    return self;
}

@end
