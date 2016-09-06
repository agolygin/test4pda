//
//  UIView+Constraint.m
//  test4pda
//
//  Created by Alexey Golygin on 06/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (DocdocConstraints)

- (void)setConstrItem:(UIView *)item attr:(NSLayoutAttribute)attr to:(UIView *)toItem attr:(NSLayoutAttribute)toAttr mul:(CGFloat)multiplier
{
    NSLayoutConstraint *cnstr = [NSLayoutConstraint constraintWithItem:item attribute:attr relatedBy:NSLayoutRelationEqual toItem:toItem attribute:toAttr multiplier:multiplier constant:0];
    [self addConstraint:cnstr];
}

- (void)setConstrItem:(UIView *)item attr:(NSLayoutAttribute)attr to:(UIView *)toItem attr:(NSLayoutAttribute)toAttr consta:(CGFloat)consta
{
    NSLayoutConstraint *cnstr = [NSLayoutConstraint constraintWithItem:item attribute:attr relatedBy:NSLayoutRelationEqual toItem:toItem attribute:toAttr multiplier:1 constant:consta];
    [self addConstraint:cnstr];
}

@end