//
//  WebViewController.m
//  UniversalJumpDemo
//
//  Created by yfc on 17/5/15.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "WebViewController.h"
#import "config.h"
@interface WebViewController ()
@property(nonatomic,retain)NSString *url;
@property(nonatomic,retain)UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:APPLICATION.window.bounds];
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

- (instancetype)initWithURL:(NSString *)url
{
    if (self = [self init])
        _url = url;
    
    return self;
}

@end
