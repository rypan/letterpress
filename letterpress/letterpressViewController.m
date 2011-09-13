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
    int pageWidth = 1024;
    int pageHeight = 748;
    int numberOfPages;
    int counter;
    
    // Set number of pages
    // I need to find a way to do this automatically
    numberOfPages = 4;
    
    // Set view size
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
    
    // Add "container" UIScrollView and set it's content size
    CGRect containerFrame = self.view.frame;
    UIScrollView *containerView = [[UIScrollView alloc] initWithFrame:containerFrame];
    [self.view addSubview:containerView];
    
    CGSize scrollViewContentSize = CGSizeMake(pageWidth * numberOfPages, pageHeight);
    [containerView setContentSize:scrollViewContentSize];
    
    // Cycle through all pages
    for (counter = 0; counter < numberOfPages; counter++) {
        
        // Create image   
        UIImage *pageN = [UIImage imageNamed:[NSString stringWithFormat:@"page%d.jpg",counter+1]];
        
        // Create a scroll view, set content size, and add it to "container"
        CGRect scrollViewFrameN = CGRectMake(pageWidth*counter, 0, pageWidth, pageHeight);
        UIScrollView *scrollViewN = [[UIScrollView alloc] initWithFrame:scrollViewFrameN];
        [containerView addSubview:scrollViewN];
        
        CGSize scrollViewContentSize = CGSizeMake(pageN.size.width, pageN.size.height);
        [scrollViewN setContentSize:scrollViewContentSize];
        
        // Add image to scroll view
        UIImageView *imageN = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, pageN.size.width, pageN.size.height)];
        imageN.image = pageN;
        [scrollViewN addSubview:imageN];
        
    }
    
    // Settings for "container"
    [containerView setPagingEnabled:YES];
    [containerView setShowsHorizontalScrollIndicator:NO];
    [containerView setShowsVerticalScrollIndicator:NO];
    
    
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
