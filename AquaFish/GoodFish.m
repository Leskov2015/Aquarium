//
//  GoodFish.m
//  AquaFish
//
//  Created by Mykola Denysyuk on 12/17/15.
//  Copyright (c) 2015 InfoService. All rights reserved.
//

#import "GoodFish.h"
#define goodFishSpeed CGPointMake(1.2f, 1.1f)

@implementation GoodFish

-(void)style
{
    fishSpeed = goodFishSpeed;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"Good Fish.png"];
    }
    return self;
}

-(id)copy
{
    health = fishHealth;
    return [GoodFish new];
}

@end