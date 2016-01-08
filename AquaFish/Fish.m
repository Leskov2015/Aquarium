//  self.rotate = self.rotate == 0.0f ? 1.0f : 0.0f;
//  Fish.m
//  AquaFish
//
//  Created by Mykola Denysyuk on 12/18/15.
//  Copyright (c) 2015 InfoService. All rights reserved.
//

#import "Fish.h"

@implementation Fish

-(void) style{
}

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(arc4random()%500, arc4random()%240, 47, 37)];
    if (self) {
        [self style];
        self.rotate = 1.0f;
        health = fishHealth;
        hpProgres = [[UIProgressView alloc]initWithFrame:CGRectMake(8, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame), 4)];
        hpProgres.tintColor = [UIColor redColor];
        [self addSubview:hpProgres];
    }
    return self;
}

-(void)move
{
    CGFloat const limit = 10;
    UIImageView *fishTexture = self;
    fishTexture.center = CGPointMake(fishTexture.center.x + fishSpeed.x, fishTexture.center.y + fishSpeed.y);
    if(fishTexture.center.x >=(CGRectGetWidth(self.superview.frame)-limit) || fishTexture.center.x <= limit){
        fishSpeed.x = -fishSpeed.x;
        fishTexture.layer.transform = CATransform3DMakeRotation(M_PI, 0.0f, self.rotate , 0.0f);
        if (self.rotate == 0.0f) {
            self.rotate = 1.0f;
        }else{
            self.rotate = 0.0f;
        }
    }
    if (fishTexture.center.y >= (CGRectGetHeight(self.superview.frame)-limit -35) || fishTexture.center.y <= limit) {
        fishSpeed.y = -fishSpeed.y;
    }
    hpProgres.progress = health * 1.0f/fishHealth;
    health --;
}

-(BOOL)stillAlive
{
    return health > 0;
}

-(void)test
{
    [self addSubview:hpProgres];
}

-(void)test1
{
    [hpProgres removeFromSuperview];
}


@end