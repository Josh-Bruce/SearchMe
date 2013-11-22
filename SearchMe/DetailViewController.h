//
//  DetailViewController.h
//  SearchMe
//
//  Created by Josh Bruce on 06/06/2013.
//  Copyright (c) 2013 SurfTrack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *detailLabelContents;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end