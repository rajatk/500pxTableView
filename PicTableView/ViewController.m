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

@end

@implementation ViewController

static NSString *CellIdentifier = @"CellIdentifier";
NSMutableArray *picUrlsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	NSArray *searchTerms = [[NSArray alloc] initWithObjects:@"cars", @"clouds", @"sky", @"flowers", nil];
	
	[PXRequest requestForSearchTerm:[searchTerms objectAtIndex:arc4random() % 4] page:1 resultsPerPage:25 completion:^(NSDictionary *results, NSError *error) {
		if(results)
		{
			picUrlsArray = [[NSMutableArray alloc] init];
			
			NSArray *photos = [results valueForKey:@"photos"];
			
			for(NSArray *photo in photos)
			{
				NSLog(@"PXR Results: %@", [[photo valueForKey:@"image_url"] objectAtIndex:0]);
				[picUrlsArray addObject:[photo valueForKey:@"image_url"]];
			}
			[self.tableView reloadData];
		}
		if(error)
		{
			NSLog(@"PXRequest Error: %@", error);
		}
	}];
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
	
	NSURL *tempUrl;
	if(picUrlsArray){
		tempUrl = [[picUrlsArray objectAtIndex:indexPath.row] objectAtIndex:0];
		[cell.thumbPic setImageWithURL:tempUrl];
	}
	
	cell.thumbPic.contentMode = UIViewContentModeScaleAspectFill;
	cell.thumbPic.layer.masksToBounds = YES;
	
	[cell setDidTapButtonBlock:^(id sender) {
		ImageDetailViewController *idvc = [[ImageDetailViewController alloc] init];
		[idvc.view setBackgroundColor:[UIColor whiteColor]];
		idvc.picURL = tempUrl;
		[self.navigationController pushViewController:idvc animated:YES];
    }];

    return cell;
}


@end
