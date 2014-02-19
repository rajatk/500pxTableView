//
//  ViewController.m
//  PicTableView
//
//  Created by Rajat on 2/17/14.
//  Copyright (c) 2014 Codetastic. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "ImageDetailViewController.h"

#import <PXAPI/PXAPI.h>
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ImageDetailViewController *detailViewController;

@end

@implementation ViewController

static NSString *CellIdentifier = @"CellIdentifier";
NSMutableArray *picUrl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	NSArray *searchTerms = [[NSArray alloc] initWithObjects:@"cars", @"clouds", @"sky", @"flowers", nil];
	
	[PXRequest requestForSearchTerm:[searchTerms objectAtIndex:arc4random() % 4] page:1 resultsPerPage:25 completion:^(NSDictionary *results, NSError *error) {
		if(results)
		{
			picUrl = [[NSMutableArray alloc] init];
			
			NSArray *photos = [results valueForKey:@"photos"];
			
			for(NSArray *photo in photos)
			{
				NSLog(@"PXR Results: %@", [[photo valueForKey:@"image_url"] objectAtIndex:0]);
				[picUrl addObject:[photo valueForKey:@"image_url"]];
			}
			[self.tableView reloadData];
		}
		if(error)
		{
			NSLog(@"PXRequest Error: %@", error);
		}
	}];
	
	
	/*
	[PXRequest requestForSearchTag:@"clouds" page:1 resultsPerPage:3 completion:^(NSDictionary *results, NSError *error) {
		if(results)
		{
			NSArray *photos = [results valueForKey:@"photos"];
			
			for(NSArray *photo in photos)
			{
				NSLog(@"new");
				NSLog(@"PXR Results: %@", photo);
			}
		}
		if(error)
		{
			NSLog(@"PXRequest Error: %@", error);
		}
	}];
	
	
	[PXRequest requestForSearchTerm:@"street"
                          searchTag:@"urban"
                          searchGeo:@"40.7144,-74.006,50000km"
                               page:1
                     resultsPerPage:60
                         photoSizes:PXPhotoModelSizeLarge
                             except:PXPhotoModelCategoryUncategorized
                         completion:^(NSDictionary *results, NSError *error) {
							 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
							 if (results) {
								 [self setNewObjects:[results valueForKey:@"photos"]];
								 self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log in" style:UIBarButtonItemStyleBordered target:self action:@selector(login)];
							 }
						 }];
	 */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
//	cell.customLabel.text = [NSString stringWithFormat:@"%i",indexPath.row];
	NSURL *tempUrl;
	
	if(picUrl){
		tempUrl = [[picUrl objectAtIndex:indexPath.row] objectAtIndex:0];
		[cell.thumbPic setImageWithURL:tempUrl];
	}
	
	cell.thumbPic.contentMode = UIViewContentModeScaleAspectFill;
	cell.thumbPic.layer.masksToBounds = YES;
	
	[cell setDidTapButtonBlock:^(id sender) {
//        NSLog(@"Cell Tapped: %@", [NSString stringWithFormat:@"%i",indexPath.row]);
		
		ImageDetailViewController *idvc = [[ImageDetailViewController alloc] init];
		[idvc.view setBackgroundColor:[UIColor whiteColor]];
		idvc.picURL = tempUrl;
		[self.navigationController pushViewController:idvc animated:YES];
    }];

    return cell;
}


@end
