//
//  SViewController.m
//  Screeny
//
//  Created by JJ Garzella on 9/28/13.
//  Copyright (c) 2013 JJ Garzella. All rights reserved.
//

#import "SViewController.h"

@interface SViewController ()  <UITextFieldDelegate>

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
    
    // Appropriate screen size
    NSNumber *heightOfImageView = [NSNumber numberWithFloat:self.view.bounds.size.height*self.view.contentScaleFactor];
    NSNumber *widthOfImageView = [NSNumber numberWithFloat:self.view.bounds.size.width*self.view.contentScaleFactor];
    
    // User-entered URL
    NSURL *userEnteredURL =[NSURL URLWithString:sender.text];
    NSLog(@"%@", userEnteredURL.absoluteString);
    
    NSString *startingQueryURL = @"https://shepik-web-screenshot.p.mashape.com/screenshot.php?url=";
    NSString *queryURL = [NSString stringWithFormat:@"%@%@&h=%@&w=%@", startingQueryURL, userEnteredURL.absoluteString, heightOfImageView, widthOfImageView];
    
    [[Unirest get:^(SimpleRequest* request) {
        [request setUrl:queryURL];
        [request setHeaders:headers];
    }] asJsonAsync:^(HttpJsonResponse* response) {
        if (![response.body isArray]) {
            
            NSDictionary *responseDictionary = response.body.JSONObject;
            NSLog(@"%@", responseDictionary);
            
            NSURL *screenshotURL = [NSURL URLWithString:responseDictionary[@"image"]];
            
            NSData *screenshotData = [NSData dataWithContentsOfURL:screenshotURL];
            
            UIImage *screenshot = [UIImage imageWithData:screenshotData];
            
            self.webScreenshotImageView.image = screenshot;
            
        }
    }];
    
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
