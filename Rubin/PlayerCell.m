//
//  PlayerCell.m
//  Rubin
//
//  Created by user on 23.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell

@synthesize player;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
