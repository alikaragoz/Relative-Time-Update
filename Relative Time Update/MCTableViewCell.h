//
//  MCRelativeTimeCell.h
//  Relative Time Update
//
//  Created by Ali Karagoz on 07/02/13.
//  Copyright (c) 2013 Mad Castle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCTableViewCell : UITableViewCell

@property (nonatomic, strong) NSDate *date;

- (void)update;

@end
