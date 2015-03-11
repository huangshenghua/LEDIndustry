//
//  SVRootScrollView.m
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import "SVRootScrollView.h"

#import "SVGloble.h"
#import "SVTopScrollView.h"

#import "LEDFirstTableView.h"
#import "LEDSecondTableView.h"

#define POSITIONID (int)(scrollView.contentOffset.x/SCREEN_WIDTH)

@implementation SVRootScrollView

+ (SVRootScrollView *)shareInstance {
    static SVRootScrollView *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, [SVGloble shareInstance].globleHeight-44)];
    });
    return _instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.backgroundColor = [UIColor lightGrayColor];
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        userContentOffsetX = 0;
        _viewNameArray = [NSMutableArray array];
    }
    return self;
}

- (void)initWithViews
{
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"LEDTableViews" owner:self options:nil];
    for (int i = 0; i < [self.indexArray count]; i++) {
        switch (i) {
            case 0:
            {
                LEDFirstTableView *firstTableView = (LEDFirstTableView*)[nibs objectAtIndex:0];
                CGRect frame = firstTableView.frame;
                frame.size.width = SCREEN_WIDTH;
                frame.size.height = self.bounds.size.height;
                firstTableView.frame = frame;
                [firstTableView reloadData];
                [self addSubview:firstTableView];
            }
                break;
            case 1:
            {
                LEDSecondTableView *secondTableView = (LEDSecondTableView*)[nibs objectAtIndex:1];
                CGRect frame = secondTableView.frame;
                frame.origin.x = SCREEN_WIDTH;
                frame.size.width = SCREEN_WIDTH;
                frame.size.height = self.bounds.size.height;
                secondTableView.frame = frame;
                [secondTableView reloadData];
                [self addSubview:secondTableView];
            }
                break;
                
            default:
                break;
        }
        [_viewNameArray addObject:[self.indexArray objectAtIndex:i]];
    }
    self.contentSize = CGSizeMake(SCREEN_WIDTH*[self.viewNameArray count], [SVGloble shareInstance].globleHeight-44);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self adjustTopScrollViewButton:scrollView];
    
    [self loadData];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self loadData];
}

-(void)loadData
{
    CGFloat pagewidth = self.frame.size.width;
    int page = floor((self.contentOffset.x - pagewidth/self.viewNameArray.count)/pagewidth)+1;
    UILabel *label = (UILabel *)[self viewWithTag:page+200];
    label.text = [NSString stringWithFormat:@"%@",[self.viewNameArray objectAtIndex:page]];
}

//滚动后修改顶部滚动条
- (void)adjustTopScrollViewButton:(UIScrollView *)scrollView
{
    [[SVTopScrollView shareInstance] setButtonUnSelect];
    [SVTopScrollView shareInstance].scrollViewSelectedChannelID = (int)(scrollView.contentOffset.x/SCREEN_WIDTH)+100;
    [[SVTopScrollView shareInstance] setButtonSelect];
    [[SVTopScrollView shareInstance] setScrollViewContentOffset];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
