//
//  TTViewController.h
//  Drawings
//
//  Created by sergey on 3/10/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTDrawStar;

@interface TTViewController : UIViewController

@property (weak,nonatomic) IBOutlet TTDrawStar *star;

- (IBAction)drawStar:(id)sender;
- (IBAction)paintMode:(id)sender;
- (IBAction)clearSpace:(id)sender;
- (IBAction)randomRGB:(id)sender;

@end
