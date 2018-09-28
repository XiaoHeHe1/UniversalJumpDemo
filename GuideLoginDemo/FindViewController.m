//
//  FindViewController.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/15.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "FindViewController.h"
#import "config.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"find";
    //随机生成三个按钮
    int width = SCREEN_WIDTH_NEW - BALL_WIDTH;
    int height = SCREEN_HEIGHT_NEW - BALL_WIDTH;
    NSArray *titleArray = @[@"账单",@"广告"];
    for (int i = 0; i < titleArray.count; i++) {
        int cx = 0;
        int cy = 0;
        cx = arc4random() % width;
        cy = arc4random() % height;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%ddog",i]] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        btn.tag = i;
        btn.centerY = cy;
        btn.centerX = cx;
        btn.width = 70;
        btn.height = 70;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
}
- (void)btnClicked:(UIButton *)btnn{
    
    if (btnn.tag == 0) {
        MyModel *moel = [[MyModel alloc]init];
        moel.detailUrl = @"native://JieKuanViewController";
        [JumpManager jumpToControllerWithModel:moel OriginalController:self];
    }else if(btnn.tag == 1){
        MyModel *moel = [[MyModel alloc]init];
        moel.detailUrl = @"http://blog.csdn.net/qq_15509071/article/details/70379690";
        [JumpManager jumpToControllerWithModel:moel OriginalController:self];
    }else{
        
    }
}


@end
