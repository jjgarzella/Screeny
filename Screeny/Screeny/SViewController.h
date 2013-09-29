//
//  SViewController.h
//  Screeny
//
//  Created by JJ Garzella on 9/28/13.
//  Copyright (c) 2013 JJ Garzella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unirest.h"

@interface SViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *webScreenshotImageView;
- (IBAction)updateScreenshot:(UITextField *)sender;

@end
