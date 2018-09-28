//
//  ChatViewController.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/15.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "ChatViewController.h"
#import "config.h"

@implementation ChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"chat";
    //随机生成三个按钮
    int width = SCREEN_WIDTH_NEW - BALL_WIDTH;
    int height = SCREEN_HEIGHT_NEW - BALL_WIDTH;
    NSArray *titleArray = @[@"转账",@"汇款",@"借款"];
    for (int i = 0; i < 3; i++) {
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
        //
        //每个按钮对应的model
        //
        SuKoModel *model = [[SuKoModel alloc]init];
        model.url = @"http://blog.csdn.net/qq_15509071/article/details/71123323";
        model.name = @"";
        [JumpManager jumpToControllerWithModel:model OriginalController:self];
    }else if(btnn.tag == 1){
        SuKoModel *model = [[SuKoModel alloc]init];
        model.url = @"native://ZhuanZhangViewController";
        model.name = @"";
        [JumpManager jumpToControllerWithModel:model OriginalController:self];
    }else{
        SuKoModel *model = [[SuKoModel alloc]init];
        model.url = @"native://HuiKuanViewController";
        model.name = @"";
        [JumpManager jumpToControllerWithModel:model OriginalController:self];
    }
}
@end
