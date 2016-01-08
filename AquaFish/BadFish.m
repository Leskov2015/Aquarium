//
//  BadFish.m
//  AquaFish
//
//  Created by Mykola Denysyuk on 12/17/15.
//  Copyright (c) 2015 InfoService. All rights reserved.
//

#import "BadFish.h"
#define badFishSpeed CGPointMake(1.0f, 0.5f)

@implementation BadFish

-(void)style
{
    fishSpeed = badFishSpeed;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"Bad Fish.png"];
    }
    return self;
}

-(void)eat
{
    health = fishHealth;
}

@end