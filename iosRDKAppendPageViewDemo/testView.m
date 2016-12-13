//
//  testView.m
//  iosRDKAppendPageViewDemo
//
//  Created by Hong Zhang on 12/6/16.
//  Copyright © 2016 Foxit. All rights reserved.
//

#import "testView.h"

@interface TestView ()

@end


@implementation TestView

-(BOOL)onTap:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"TestView: onTap");
    CGPoint touchPoint = [gestureRecognizer locationInView:self];
    NSLog(@"view rect: %f %f %f %f, touchPoint: %f %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height, touchPoint.x, touchPoint.y);
    
    for(UIView* view in self.subviews)
    {
        CGRect subViewFrame = view.frame;
        if(CGRectContainsPoint(subViewFrame, touchPoint)&&[view isKindOfClass:[UISwitch class]]){
            BOOL currentState = [(UISwitch*)view isOn];
            [(UISwitch*) view setOn:!currentState];
        }
    }
    
    return true;
}

@end