//
//  JumpManager.h
//  GuideLoginDemo
//
//  Created by yfc on 17/5/15.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JumpManager : NSObject
+(void)jumpToViewController:(NSString *)controller OriginalController:(id)originalController;
+(void)jumpToControllerWithModel:(id)model OriginalController:(id)originalController;
@end
