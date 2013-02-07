//
//  MCRelativeTimeCell.m
//  Relative Time Update
//
//  Created by Ali Karagoz on 07/02/13.
//  Copyright (c) 2013 Mad Castle. All rights reserved.
//

#import "MCTableViewCell.h"
#import "TTTTimeIntervalFormatter.h"

@implementation MCTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    [self update];
}

- (void)update
{
    TTTTimeIntervalFormatter *timeIntervalFormatter = [[TTTTimeIntervalFormatter alloc] init];
    NSTimeInterval interval = [_date timeIntervalSinceNow];
    [self.textLabel setText:[timeIntervalFormatter stringForTimeInterval:interval]];
}

@end
