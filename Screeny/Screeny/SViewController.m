//
//  SViewController.m
//  Screeny
//
//  Created by JJ Garzella on 9/28/13.
//  Copyright (c) 2013 JJ Garzella. All rights reserved.
//

#import "SViewController.h"

@interface SViewController ()

@end

@implementation SViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateScreenshot:(UITextField *)sender {
    NSDictionary* headers = [NSDictionary dictionaryWithObjectsAndKeys:@"p9qYKW3aCdguDb0wICdEfLEfEwwd8LrA", @"X-Mashape-Authorization", nil];
//    NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys:nil];
    
    HttpJsonResponse* response = [[Unirest get:^(SimpleRequest* request) {
        [request setUrl:@"https://shepik-web-screenshot.p.mashape.com/screenshot.php?url=http%3A%2F%2Fgoogle.com%2F%3Fhl%3Den&h=1000&w=1024"];
        [request setHeaders:headers];
//        [request setParameters:parameters];
    }] asJson];
    
    if (![response.body isArray]) {
        NSLog(@"%@", response.body.JSONObject);
    }
}
@end
