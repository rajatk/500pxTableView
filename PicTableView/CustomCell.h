//
//  CustomCell.h
//  PicTableView
//
//  Created by Rajat on 2/17/14.
//  Copyright (c) 2014 Codetastic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *customLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbPic;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

- (void)setDidTapButtonBlock:(void (^)(id sender))didTapButtonBlock;

@end
