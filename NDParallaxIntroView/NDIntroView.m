//
//  NDIntroPageView.m
//  NDParallaxIntroView
//
//  Created by Simon Wicha on 17/04/2016.
//  Copyright © 2016 Simon Wicha. All rights reserved.
//

#import "NDIntroView.h"
#import "NDIntroPageView.h"

@interface NDIntroView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIScrollView *scrollViewBackgroundImage;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *doneButton;

@property (strong, nonatomic) IBOutlet NDIntroPageView *viewOne;
@property (strong, nonatomic) IBOutlet NDIntroPageView *viewTwo;
@property (strong, nonatomic) IBOutlet NDIntroPageView *viewThree;
@property (strong, nonatomic) IBOutlet NDIntroPageView *viewFour;


@end

@implementation NDIntroView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width * 4, self.frame.size.height)];
        [imageView setImage:[UIImage imageNamed:@"introBackgroundImage"]];
        imageView.contentMode = UIViewContentModeLeft;
        [self.scrollViewBackgroundImage addSubview:imageView];
        
        [self addSubview:self.scrollViewBackgroundImage];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        
        [self.scrollView addSubview:self.viewOne];
        [self.scrollView addSubview:self.viewTwo];
        [self.scrollView addSubview:self.viewThree];
        [self.scrollView addSubview:self.viewFour];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    [self.scrollViewBackgroundImage setContentOffset:CGPointMake(self.scrollView.contentOffset.x  * 0.5f, self.scrollView.contentOffset.y) animated:NO];
}

- (NSBundle *)podBundle {
    return [NSBundle bundleForClass:[self classForCoder]];;
}

-(UIView *)viewOne {
    _viewOne = [[[self podBundle] loadNibNamed:@"NDIntroPageView" owner:nil options:nil] lastObject];
    _viewOne.frame = self.frame;
    _viewOne.imageView.image = [[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _viewOne.titlelabel.text = @"Want to live happier?";
    _viewOne.descriptionLabel.text = @"Ready for a new life hack backed up by science? Learn to appreciate the good things around you with this beautiful app!";
    return _viewOne;
    
}

-(UIView *)viewTwo {
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = self.frame.size.height;
    _viewTwo = [[[self podBundle] loadNibNamed:@"NDIntroPageView" owner:nil options:nil] lastObject];
    _viewTwo.frame = CGRectMake(originWidth, 0, originWidth, originHeight);
    _viewTwo.imageView.image = [[UIImage imageNamed:@"science"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _viewTwo.titlelabel.text = @"Backed up by science";
    _viewTwo.descriptionLabel.text = @"Researchers suggest that one of the most contributing factors to overall happiness is expressed gratitude.";
    return _viewTwo;
    
}

-(UIView *)viewThree{
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = self.frame.size.height;
    _viewThree = [[[self podBundle] loadNibNamed:@"NDIntroPageView" owner:nil options:nil] lastObject];
    _viewThree.frame = CGRectMake(originWidth*2, 0, originWidth, originHeight);
    _viewThree.imageView.image = [[UIImage imageNamed:@"what"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _viewThree.titlelabel.text = @"How does this App help?";
    _viewThree.descriptionLabel.text = @"The App encourages you to think about anything you felt grateful for (e.g. things, people, relationships, experiences, talents, circumstances, nature, cultural aspects like art or music, ...) and to write it down on a daily basis.";
    return _viewThree;
    
}

-(UIView *)viewFour {
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = self.frame.size.height;
    _viewFour = [[[self podBundle] loadNibNamed:@"NDIntroPageView" owner:nil options:nil] lastObject];
    _viewFour.frame = CGRectMake(originWidth*3, 0, originWidth, originHeight);
    _viewFour.imageView.image = [[UIImage imageNamed:@"titleWhite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _viewFour.imageHorizontalConstraint.constant = -40.f;
    _viewFour.titleLabelHeightConstraint.constant = 0.f;
    _viewFour.titlelabel.text = @"";
    _viewFour.descriptionLabel.text = @"So let's start your happier life!";
    [_viewFour addSubview:self.doneButton];
    return _viewFour;
    
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake(self.frame.size.width*4, self.scrollView.frame.size.height)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return _scrollView;
}

-(UIScrollView *)scrollViewBackgroundImage {
    if (!_scrollViewBackgroundImage) {
        _scrollViewBackgroundImage = [[UIScrollView alloc] initWithFrame:self.frame];
        [_scrollViewBackgroundImage setDelegate:self];
        [_scrollViewBackgroundImage setPagingEnabled:YES];
        _scrollViewBackgroundImage.userInteractionEnabled = NO;
        [_scrollViewBackgroundImage setContentSize:CGSizeMake(self.frame.size.width*4, self.scrollView.frame.size.height)];
        _scrollViewBackgroundImage.showsHorizontalScrollIndicator = NO;
        [self.scrollViewBackgroundImage setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return _scrollViewBackgroundImage;
}

-(UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-80, self.frame.size.width, 10)];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
        [_pageControl setNumberOfPages:4];
    }
    return _pageControl;
}

-(UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.frame.size.height-60, self.frame.size.width - 40, 40)];
        _doneButton.layer.cornerRadius = 5.f;
        [_doneButton setTintColor:[UIColor whiteColor]];
        [_doneButton setTitle:@"Let's Go!" forState:UIControlStateNormal];
        [_doneButton.titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS" size:18.0]];
        [_doneButton setBackgroundColor:[UIColor lightGrayColor]];
        [_doneButton addTarget:self.delegate action:@selector(onDoneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end