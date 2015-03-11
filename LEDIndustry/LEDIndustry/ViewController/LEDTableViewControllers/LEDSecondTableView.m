//
//  LEDSecondTableView.m
//  LEDIndustry
//
//  Created by guotianji on 15/3/11.
//  Copyright (c) 2015年 hsh. All rights reserved.
//

#import "LEDSecondTableView.h"

@implementation LEDSecondTableView

- (void)awakeFromNib {
    // Initialization code
    self.delegate = self;
    self.dataSource = self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIndenlity = @"LEDSecondTableViewCell";
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"LEDTableViews" owner:self options:nil];
    //    LEDFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndenlity forIndexPath:indexPath];
    LEDSecondTableViewCell *cell = [nibs objectAtIndex:3];
    if (!cell) {
        cell = [[LEDSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndenlity];
    }
    
    return cell;
}

@end



@implementation LEDSecondTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
