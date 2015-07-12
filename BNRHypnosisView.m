//
//  BNRHypnosisView.m
//  Hypnosister2
//
//  Created by chanakya mathi on 1/5/15.
//  Copyright (c) 2015 chanakya mathi. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"in init with method");
    NSLog(@"w=%f, h=%f, x=%f, y=%f ",frame.size.width,frame.size.height,frame.origin.x,frame.origin.y);
    self=[super initWithFrame:frame];
    return self;
    
}
- (void)drawRect:(CGRect)rect
{
    
    
    NSLog(@"w=%f, h=%f, x=%f, y=%f ",rect.size.width,rect.size.height,rect.origin.x,rect.origin.y);
    NSLog(@"in drawrect");
    CGRect bounds = rect;
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    //float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line!
    [path stroke];
}
@end
