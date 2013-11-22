//
//  MasterTableViewController.h
//  SearchMe
//
//  Created by Josh Bruce on 06/06/2013.
//  Copyright (c) 2013 SurfTrack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic, strong) NSMutableArray *results;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;

@end