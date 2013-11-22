//
//  DetailViewController.m
//  SearchMe
//
//  Created by Josh Bruce on 06/06/2013.
//  Copyright (c) 2013 SurfTrack. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Set the label text
	self.detailLabel.text = self.detailLabelContents;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
