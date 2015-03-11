//
//  ViewController.m
//  LEDIndustry
//
//  Created by guotianji on 15/3/11.
//  Copyright (c) 2015年 hsh. All rights reserved.
//

#import "ViewController.h"

#import "SVTopScrollView.h"
#import "SVRootScrollView.h"

@interface ViewController ()

@property (nonatomic, retain) SVTopScrollView *topScrollView;
@property (nonatomic, retain) SVRootScrollView *rootScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIImageView *topShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
    [topShadowImageView setImage:[UIImage imageNamed:@"top_background_shadow.png"]];
    [self.view addSubview:topShadowImageView];
    
    _topScrollView = [SVTopScrollView shareInstance];
    _rootScrollView = [SVRootScrollView shareInstance];
    
    _topScrollView.nameArray = @[@"网易新闻", @"新浪微博新闻", @"搜狐", @"头条新闻", @"本地动态", @"精美图片集"];
    _rootScrollView.indexArray = @[@"网易新闻", @"新浪微博新闻", @"搜狐", @"头条新闻", @"本地动态", @"精美图片集"];
    
    [self.view addSubview:_topScrollView];
    [self.view addSubview:_rootScrollView];
    
    [_topScrollView initWithNameButtons];
    [_rootScrollView initWithViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu {
    return NO;
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

@end
