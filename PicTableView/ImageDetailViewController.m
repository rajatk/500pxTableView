//
//  ImageDetailViewController.m
//  PicTableView
//
//  Created by Rajat on 2/17/14.
//  Copyright (c) 2014 Codetastic. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "UIImageView+WebCache.h"

@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController

UIImageView *imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.layer.masksToBounds = YES;
	[self.view addSubview:imageView];
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[imageView setImageWithURL:self.picURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
