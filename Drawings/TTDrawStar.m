//
//  TTDrawStar.m
//  Drawings
//
//  Created by sergey on 3/18/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTDrawStar.h"

@implementation TTDrawStar {
    CGPoint lastPoint;
    BOOL swipeState;
    CGFloat r;
    CGFloat g;
    CGFloat b;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)randomRGBColor {
    
    r = (CGFloat)(arc4random() % 256) / 255;
    g = (CGFloat)(arc4random() % 256) / 255;
    b = (CGFloat)(arc4random() % 256) / 255;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    swipeState = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    swipeState = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.canvas.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    CGContextMoveToPoint(context, lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 10.0 );
    CGContextSetRGBStrokeColor(context, r, g, b, 1.0);
    CGContextSetBlendMode(context,kCGBlendModeNormal);
    CGContextStrokePath(context);
    
    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (!swipeState) {
        
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [self.canvas.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        CGContextMoveToPoint(context, lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 10.0 );
        CGContextSetRGBStrokeColor(context, r, g, b, 1.0);
        CGContextSetBlendMode(context,kCGBlendModeNormal);
        CGContextStrokePath(context);
        
        self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    
}

- (void)drowStar {
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextFillRect(context, self.frame);
    
    for (int i = 0; i < 5; i++) {
        CGPoint point = CGPointMake(arc4random_uniform(500), arc4random_uniform(500));
        
        [self drowStarWithSize:arc4random_uniform(200) circleSize:arc4random_uniform(40) inPoint:point];
    }
    
    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

}

- (void)drowStarWithSize:(int)size circleSize:(int)csize inPoint:(CGPoint)point {

    int eSize = csize;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int aSize = 1.0;
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = point.x;
    CGFloat yCenter = point.y;
    
    float  w = size;
    double rt = w / 2.0;
    float flip = -1.0;
    
    double theta = 2.0 * M_PI * (2.0 / 5.0);
    
    double thetas = 72 * M_PI / 180;
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, xCenter, rt*flip+yCenter);
    
    for (NSUInteger k=1; k<6; k++)
    {
        float x = rt * sin(k * thetas);
        float y = rt * cos(k * thetas);
        
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, xCenter, rt*flip+yCenter);
    for (NSUInteger k=1; k<6; k++)
    {
        float x = rt * sin(k * theta);
        float y = rt * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    for (NSUInteger k=1; k<6; k++)
    {
        float x = rt * sin(k * theta);
        float y = rt * cos(k * theta);
        
        CGContextAddEllipseInRect(context, CGRectMake(x+xCenter - eSize/2, y*flip+yCenter - eSize/2, eSize, eSize));
        
    }
    
    CGContextFillPath(context);
}

@end
