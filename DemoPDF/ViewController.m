//
//  ViewController.m
//  DemoPDF
//
//  Created by Mayur on 23/09/19.
//  Copyright © 2019 SmartServ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = @"https://xxxxxxxxxxxxxxx.s3.amazonaws.com/Authorization_Form m a y u r.pdf";
    
    // If URL contains whitespace characters you have to replace it by %20 to avoid URL Not Support Error.
    // iOS devices does not support auto replacement of whitespace chars into %20
    NSString *strUrl=[str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSArray *parts = [strUrl componentsSeparatedByString:@"/"];
    NSString *filename = [parts lastObject];
    
    NSString *extn =[filename pathExtension];
    
    NSLog(@"file extn is %@",extn);
    
    NSURL *url = [NSURL URLWithString:strUrl];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.webView loadRequest:request];  
        
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
