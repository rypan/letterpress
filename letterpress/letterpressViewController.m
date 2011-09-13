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
    
    int pageWidth;
    int pageHeight;
    int pageShift;
    int numberOfPages;
    int counter;
    
    numberOfPages = 4;
    
    pageWidth = 1024;
    pageHeight = 748;
    pageShift = 1025;
    
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
    
    
    CGRect scrollViewFrame = self.view.frame;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    [self.view addSubview:scrollView];
    
    CGSize scrollViewContentSize = CGSizeMake(pageWidth * numberOfPages, pageHeight);
    [scrollView setContentSize:scrollViewContentSize];
    
    for (counter = 0; counter<numberOfPages; counter++) {
        
        
        // Pull in the image    
        UIImage *pageN = [UIImage imageNamed:[NSString stringWithFormat:@"page%d.jpg",counter+1]];
        
        // Create a scroll view
        CGRect scrollViewFrameN = CGRectMake(pageWidth*counter, 0, pageWidth, pageHeight);
        UIScrollView *scrollViewN = [[UIScrollView alloc] initWithFrame:scrollViewFrameN];
        [scrollView addSubview:scrollViewN];
        
        CGSize scrollViewContentSize = CGSizeMake(pageN.size.width, pageN.size.height);
        [scrollViewN setContentSize:scrollViewContentSize];
        
        
        UIImageView *imageN = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, pageN.size.width, pageN.size.height)];
        
        NSLog(@"%@",[NSString stringWithFormat:@"page%d.jpg",counter+1]);
        
        imageN.image = pageN;
        [scrollViewN addSubview:imageN];
        
    }
    
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    
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
