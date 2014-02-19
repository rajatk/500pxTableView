//
//  CustomCell.m
//  PicTableView
//
//  Created by Rajat on 2/17/14.
//  Copyright (c) 2014 Codetastic. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()

@property (copy, nonatomic) void (^didTapButtonBlock)(id sender);

@end

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.actionButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapButton:(id)sender {
//	NSLog(@"Custom didTapButton");
	
    if (self.didTapButtonBlock) {
        self.didTapButtonBlock(sender);
    }
}


@end
