//
//  JumpManager.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/15.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "JumpManager.h"
#import "config.h"
#import "WebViewController.h"
#import "JumpModel.h"
@implementation JumpManager
+(void)jumpToViewController:(NSString *)controller OriginalController:(id)originalController;
{
    
    
}
+(void)jumpToControllerWithModel:(id)model OriginalController:(id)originalController;
{
    JumpModel *jumpModel = [JumpManager changeModel:model];
    UIViewController *localOriginalController = originalController;
    
    if ([jumpModel.jumpUrl hasPrefix:@"http:"]) {
        WebViewController *controller = [[WebViewController alloc]initWithURL:jumpModel.jumpUrl];
        [localOriginalController.navigationController pushViewController:controller animated:YES];
    }else if([jumpModel.jumpUrl hasPrefix:@"native:"]){
        NSString *controllerString = [jumpModel.jumpUrl stringByReplacingOccurrencesOfString:@"native://" withString:@""];
        UIViewController *vc = [[NSClassFromString(controllerString) alloc]init];
        [localOriginalController.navigationController pushViewController:vc animated:YES];
        
    }
}

+(JumpModel *)changeModel:(id)model{
    
    JumpModel *jumpModel = [[JumpModel alloc]init];
    
    if ([model isKindOfClass:[SuKoModel class]]) {
        jumpModel.jumpUrl = ((SuKoModel*)model).url;
    }else if([model isKindOfClass:[MyModel class]]){
        jumpModel.jumpUrl = ((MyModel*)model).detailUrl;
    }
    
    return jumpModel;
}

@end
