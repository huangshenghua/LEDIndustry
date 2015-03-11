//
//  LEDFirstTableView.m
//  LEDIndustry
//
//  Created by guotianji on 15/3/11.
//  Copyright (c) 2015年 hsh. All rights reserved.
//

#import "LEDFirstTableView.h"

@implementation LEDFirstTableView

- (void)awakeFromNib {
    // Initialization code
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    view.backgroundColor = [UIColor redColor];
    [self setTableHeaderView:view];
    
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark - uploadImages

- (void)uploadImages {
    
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
    
    static NSString *reuseIndenlity = @"LEDFirstTableViewCell";
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"LEDTableViews" owner:self options:nil];
//    LEDFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndenlity forIndexPath:indexPath];
    LEDFirstTableViewCell *cell = [nibs objectAtIndex:2];
    if (!cell) {
        cell = [[LEDFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndenlity];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end




@implementation LEDFirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
