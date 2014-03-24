//
//  TTDrawStar.m
//  Drawings
//
//  Created by sergey on 3/18/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTDrawStar.h"

@implementation TTDrawStar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextFillRect(context, rect);
    
    
    [self drowStarWithSize:150.f circleSize:20.f inPoint:CGPointMake(150, 500)];
    
}

- (void)drowStarWithSize:(int)size circleSize:(int)csize inPoint:(CGPoint)point {

    int eSize = csize;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int aSize = 1.0;
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = point.x;
    CGFloat yCenter = point.y;
    
    float  w = size;
    double r = w / 2.0;
    float flip = -1.0;
    
    double theta = 2.0 * M_PI * (2.0 / 5.0);
    
    double thetas = 72 * M_PI / 180;
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    for (NSUInteger k=1; k<6; k++)
    {
        float x = r * sin(k * thetas);
        float y = r * cos(k * thetas);
        
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    for (NSUInteger k=1; k<6; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    for (NSUInteger k=1; k<6; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        
        CGContextAddEllipseInRect(context, CGRectMake(x+xCenter - eSize/2, y*flip+yCenter - eSize/2, eSize, eSize));
        
    }
    
    CGContextFillPath(context);
}

@end
