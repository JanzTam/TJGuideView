//
//  ViewController.m
//  TJGuideView
//
//  Created by ss on 15/6/3.
//  Copyright (c) 2015年 ss. All rights reserved.
//

#import "ViewController.h"

#define TJ_WidthOfScreen [[UIScreen mainScreen] bounds].size.width
#define TJ_HeightOfScreen [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray * arrImageName = @[@"1.jpeg",@"2.jpeg",@"3.jpeg"];
    for (int i = 0; i < 3; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        imageView.image         = [UIImage imageNamed:arrImageName[i]];
        imageView.tag           = 10+i;
        [self.view addSubview:imageView];
    }
    
    
    UIScrollView * scrollView  = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize     = CGSizeMake(TJ_WidthOfScreen*3, TJ_HeightOfScreen);
    scrollView.pagingEnabled   = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate        = self;
    scrollView.bounces         = NO;
    [self.view addSubview:scrollView];
    
    
    NSArray * arrLabelTitle = @[@"Memek",@"FBI Wanning",@"Japanese"];
    for (int j = 0; j < 3; j++)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:
                           CGRectMake(0+j*TJ_WidthOfScreen, TJ_HeightOfScreen/2-100, TJ_WidthOfScreen, 60)];
        label.text          = arrLabelTitle[j];
        label.textColor     = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font          = [UIFont boldSystemFontOfSize:30];
        [scrollView addSubview:label];
    }
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x                   = scrollView.contentOffset.x;
    int alphyZeroCount          = x/TJ_WidthOfScreen;
    
    UIImageView * imageVCurrent = (UIImageView *)[self.view viewWithTag:12-alphyZeroCount];
    imageVCurrent.alpha         = (TJ_WidthOfScreen-(x-(TJ_WidthOfScreen*alphyZeroCount)))/TJ_WidthOfScreen;
    
}



@end

