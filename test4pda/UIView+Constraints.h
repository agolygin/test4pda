//
//  UIView+Constraints.h
//  test4pda
//
//  Created by Alexey Golygin on 06/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (DocdocConstraints)

- (void)setConstrItem:(UIView *)item attr:(NSLayoutAttribute)attr to:(UIView *)toItem attr:(NSLayoutAttribute)toAttr mul:(CGFloat)multiplier;
- (void)setConstrItem:(UIView *)item attr:(NSLayoutAttribute)attr to:(UIView *)toItem attr:(NSLayoutAttribute)toAttr consta:(CGFloat)consta;

@end
