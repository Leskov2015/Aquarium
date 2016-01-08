//
//  GoldFish.m
//  AquaFish
//
//  Created by Mykola Denysyuk on 1/5/16.
//  Copyright (c) 2016 InfoService. All rights reserved.
//

#import "GoldFish.h"
#define goldFishSpeed CGPointMake(1.2f, 0.6f)

@implementation GoldFish

-(void)style
{
    fishSpeed = goldFishSpeed;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"Gold Fish.png"];
    }
    return self;
}

-(void)bonusHP
{
    health += 150;
}

@end