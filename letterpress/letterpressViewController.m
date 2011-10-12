//
//  letterpressViewController.m
//  letterpress
//
//  Created by Ryan Panchadsaram on 9/11/11.
//  Copyright 2011 None. All rights reserved.
//

#import "letterpressViewController.h"

@implementation letterpressViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize variables
    pageWidth = 1024;
    pageHeight = 748;
    int thumbWidth = 205;
    int counter=0;
    toc = NO;
    
    // Set view size
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
    
    // Adding background image
    UIImage *backgroundImage = [UIImage imageNamed:@"background-letterpress.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
    backgroundImageView.image = backgroundImage;
    [self.view addSubview:backgroundImageView];
    
    // Add TOC UIScrollView and set it's content size
    CGRect tocFrame = CGRectMake(0, 598+150, 1024, 150);
    tocView = [[UIScrollView alloc] initWithFrame:tocFrame];
    [self.view addSubview:tocView];
    
    // Add "container" UIScrollView and set it's content size
    CGRect containerFrame = self.view.frame;
    containerView = [[UIScrollView alloc] initWithFrame:containerFrame];
    [self.view addSubview:containerView];
    
    // Put all images paths into an array
    NSBundle *main = [NSBundle mainBundle];
    NSArray *all = [main pathsForResourcesOfType:@"jpg" inDirectory:@"Images"];
    
    // Set the scroll content size    
    CGSize scrollViewContentSize = CGSizeMake(pageWidth * all.count, pageHeight);
    [containerView setContentSize:scrollViewContentSize];
    
    // Set the scroll content size for TOC
    CGSize tocViewContentSize = CGSizeMake(205 * all.count, 150);
    [tocView setContentSize:tocViewContentSize];
    
    
    
    NSArray *sortedArray = [NSArray alloc];
    sortedArray = [all sortedArrayUsingSelector:@selector(localizedStandardCompare:)];
    
    // Cycle through array
    for (NSString *path in sortedArray){
        
        // Create image
        UIImage *pageImage = [[UIImage alloc] initWithContentsOfFile:path];
        
        // Create a scroll view, set content size, and add it to "container"
        CGRect scrollViewFrameN = CGRectMake(pageWidth*counter, 0, pageWidth, pageHeight);
        UIScrollView *scrollViewN = [[UIScrollView alloc] initWithFrame:scrollViewFrameN];
        [containerView addSubview:scrollViewN];
        
        CGSize scrollViewContentSize = CGSizeMake(pageImage.size.width, pageImage.size.height);
        [scrollViewN setContentSize:scrollViewContentSize];
        
        // Add image to scroll view
        UIImageView *imageN = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, pageImage.size.width, pageImage.size.height)];
        imageN.image = pageImage;
        [scrollViewN addSubview:imageN];
        
        // Add images to table of contents
        UIButton *buttonTOC = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonTOC setFrame:CGRectMake(thumbWidth*counter, 0, thumbWidth, 150)];
        [buttonTOC setBackgroundImage:pageImage forState:UIControlStateNormal];
        [buttonTOC addTarget:self action:@selector(tocTouched:) forControlEvents:UIControlEventTouchUpInside];
        buttonTOC.tag = counter;
        [tocView addSubview:buttonTOC];
        
        
        //UIImageView *imageTOC = [[UIImageView alloc] initWithFrame:CGRectMake(thumbWidth*counter, 0, thumbWidth, 150)];
        //imageTOC.image = pageImage;
        //imageTOC.contentMode = UIViewContentModeScaleToFill;
        
        // Increment the counter
        counter++;
        
    }
    
    
    /*
     UIImage *testImage = [[UIImage alloc] initWithContentsOfFile:[main pathForResource:@"1" ofType:@"jpg" inDirectory:@"Images"]];
     
     testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, testImage.size.width, testImage.size.height)];
     testImageView.image = testImage;
     [tocView addSubview:testImageView];
     */
    
    // Recognizing Double Tap
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    [containerView addGestureRecognizer:doubleTap];
    
    // Settings for "container"
    [containerView setPagingEnabled:YES];
    [containerView setShowsHorizontalScrollIndicator:NO];
    [containerView setShowsVerticalScrollIndicator:NO];
    
}

- (void)handleDoubleTap
{
    NSLog(@"Tap Happened");
    
    if (toc) {
        NSLog(@"No");
        toc = NO;
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            containerView.transform = CGAffineTransformMakeTranslation(0, 0);
        }completion:NULL];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            tocView.transform = CGAffineTransformMakeTranslation(0, 0);
        }completion:NULL];
        
    }else{
        NSLog(@"Yes");
        toc = YES;
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            containerView.transform = CGAffineTransformMakeTranslation(0, -150);
        }completion:NULL];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            tocView.transform = CGAffineTransformMakeTranslation(0, -150);
        }completion:NULL];
    }
    
}

- (void)tocTouched:(UIButton*)button
{
    int pageTapped = button.tag;
    [containerView setContentOffset:CGPointMake(pageTapped*pageWidth, 0) animated:YES];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
