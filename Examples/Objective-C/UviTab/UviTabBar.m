//
//  UviTabBar.m
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import "UviTabBar.h"

@implementation UviTabBar

-(CGSize) sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height = 70;
    return sizeThatFits;
}

@end
