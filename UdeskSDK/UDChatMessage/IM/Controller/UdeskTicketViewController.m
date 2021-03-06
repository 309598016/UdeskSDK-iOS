//
//  UdeskTicketViewController.m
//  UdeskSDK
//
//  Created by xuchen on 15/11/26.
//  Copyright (c) 2015年 xuchen. All rights reserved.
//

#import "UdeskTicketViewController.h"
#import "UDManager.h"
#import "UdeskUtils.h"
#import "UdeskTools.h"
#import "UdeskFoundationMacro.h"

@interface UdeskTicketViewController ()

@end

@implementation UdeskTicketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = getUDLocalizedString(@"提交问题");
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:Config.ticketTitleColor}];
    
    NSString *key = [UDManager key];
    NSString *domain = [UDManager domain];
    
    if (![UdeskTools isBlankString:key]||[UdeskTools isBlankString:domain]) {
        
        _ticketWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _ticketWebView.backgroundColor=[UIColor whiteColor];
        
        NSURL *ticketURL = [UDManager getSubmitTicketURL];
        
        [_ticketWebView loadRequest:[NSURLRequest requestWithURL:ticketURL]];
        
        [self.view addSubview:_ticketWebView];
        
        [_ticketWebView stringByEvaluatingJavaScriptFromString:@"ticketCallBack()"];

    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (ud_isIOS6) {
        self.navigationController.navigationBar.tintColor = Config.oneSelfNavcigtionColor;
    } else {
        self.navigationController.navigationBar.barTintColor = Config.oneSelfNavcigtionColor;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (ud_isIOS6) {
        self.navigationController.navigationBar.tintColor = Config.ticketNavigationColor;
    } else {
        self.navigationController.navigationBar.barTintColor = Config.ticketNavigationColor;
        self.navigationController.navigationBar.tintColor = Config.ticketBackButtonColor;
    }
    
}


@end
