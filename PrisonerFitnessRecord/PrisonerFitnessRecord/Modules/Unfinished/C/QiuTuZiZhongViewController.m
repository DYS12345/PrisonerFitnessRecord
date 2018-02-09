//
//  QiuTuZiZhongViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/2/9.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "QiuTuZiZhongViewController.h"

@interface QiuTuZiZhongViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation QiuTuZiZhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Calling -loadDocument:inView:
    [self loadDocument:@"1.xls" inView:self.webView];
}

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

@end
