//
//  MasterTableViewController.m
//  SearchMe
//
//  Created by Josh Bruce on 06/06/2013.
//  Copyright (c) 2013 SurfTrack. All rights reserved.
//

#import "MasterTableViewController.h"
#import "DetailViewController.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

- (NSMutableArray *)objects
{
	if (!_objects) {
		_objects = [[NSMutableArray alloc] init];
	}
	
	return _objects;
}

- (NSMutableArray *)results
{
	if (!_results) {
		_results = [[NSMutableArray alloc] init];
	}
	
	return _results;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Add some objects to our array
	[self.objects addObject:@"YouTube"];
	[self.objects addObject:@"Google"];
	[self.objects addObject:@"Yahoo"];
	[self.objects addObject:@"Apple"];
	[self.objects addObject:@"Amazon"];
	[self.objects addObject:@"Bing"];
	[self.objects addObject:@"Udemy"];
	[self.objects addObject:@"Flickr"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchThroughData
{
	self.results = nil;
	
	NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", self.searchBar.text];
	self.results = [[self.objects filteredArrayUsingPredicate:resultsPredicate] mutableCopy];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[self searchThroughData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (tableView == self.tableView) {
		return self.objects.count;
	} else {
		[self searchThroughData];
		return self.results.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
	if (tableView == self.tableView) {
		cell.textLabel.text = self.objects[indexPath.row];
	} else {
		cell.textLabel.text = self.results[indexPath.row];
	}
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchDisplayController.isActive) {
		[self performSegueWithIdentifier:@"ShowDetail" sender:self];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
		NSString *object = nil;
		NSIndexPath *indexPath = nil;
		
		if (self.searchDisplayController.isActive) {
			indexPath = [[self.searchDisplayController searchResultsTableView] indexPathForSelectedRow];
			object = self.results[indexPath.row];
		} else {
			indexPath = [self.tableView indexPathForSelectedRow];
			object = self.objects[indexPath.row];
		}
		
		[[segue destinationViewController] setDetailLabelContents:object];
	}
}

@end