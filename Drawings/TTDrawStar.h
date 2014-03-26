//
//  TTDrawStar.h
//  Drawings
//
//  Created by sergey on 3/18/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTDrawStar : UIView

@property (assign,nonatomic) BOOL clearState;

@property (weak,nonatomic) IBOutlet UIImageView *canvas;

- (void)drowStar;
- (void)randomRGBColor;

@end

