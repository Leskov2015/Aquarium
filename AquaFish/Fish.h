//
//  Fish.h
//  AquaFish
//
//  Created by Mykola Denysyuk on 12/18/15.
//  Copyright (c) 2015 InfoService. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#define fishHealth 450

@interface Fish : UIImageView
{
    CGPoint fishSpeed;
    NSInteger health;
    UIProgressView *hpProgres;
}
@property (nonatomic) CGFloat rotate;
- (void) test;
- (void) test1;
- (void) move;
- (void) style;
- (BOOL) stillAlive;


@end