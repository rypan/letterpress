//
//  letterpressViewController.h
//  letterpress
//
//  Created by Ryan Panchadsaram on 9/11/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface letterpressViewController : UIViewController{
    UIImageView *testImageView;
    UIScrollView *containerView;
    UIScrollView *tocView;
    int pageWidth;
    int pageHeight;
    BOOL toc;
}

@end
