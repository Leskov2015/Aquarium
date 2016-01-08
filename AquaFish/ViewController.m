//
//  ViewController.m
//  AquaFish
//
//  Created by Mykola Denysyuk on 12/16/15.
//  Copyright (c) 2015 InfoService. All rights reserved.
//


#import <AVFoundation/AVAudioPlayer.h>
#import "ViewController.h"
#import "AppDelegate.h"
#import "Fish.h"
#import "BadFish.h"
#import "GoodFish.h"
#import "GoldFish.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UIImageView *aquarium;
@property (strong, nonatomic) NSMutableArray *arrayForFish;
@property (strong, nonatomic) NSMutableArray *goodFish;
@property (strong, nonatomic) NSMutableArray *badFish;
@property (strong, nonatomic) NSMutableArray *goldFish;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, retain) IBOutlet UISwitch *mySwitch;
@property (nonatomic, strong) IBOutlet UISwitch *mySwitchSound;

@end

@implementation ViewController
static ViewController *theViewController = nil;
/*+ (ViewController *) theViewController
{
    if (!theViewController) {
        theViewController = [[super allocWithZone:nil]init];
    }
    return theViewController;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self theViewController];
}

- (instancetype)init
{
    self = [super init];
    
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *sound = [[NSBundle mainBundle] pathForResource:@"Sound Aqua" ofType:@"mp3"];
    self.player =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:sound] error:NULL];
    [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(aquaRun) userInfo:nil repeats:YES];
    _arrayForFish = [NSMutableArray new];
    _goodFish = [NSMutableArray new];
    _badFish = [NSMutableArray new];
    _goldFish = [NSMutableArray new];
}

- (void) aquaRun
{
    for (Fish* fish in _arrayForFish) {
        [fish move];
    }
    for (GoodFish *fish in _goodFish.copy) {
        if (!fish.stillAlive) {
            GoodFish *newFish = [fish copy];
            [self addGoodFish:newFish];
        }
    }
    for (GoldFish *gold in _goldFish.copy) {
        if (!gold.stillAlive) {
            [_arrayForFish removeObject:gold];
            [_goldFish removeObject:gold];
            [gold removeFromSuperview];
        }else{
            for (BadFish *bad in _badFish.copy) {
                CGRect intersectGold = (CGRectIntersection(bad.frame, gold.frame));
                if (!CGSizeEqualToSize(CGSizeZero, intersectGold.size)) {
                    [_arrayForFish removeObject:bad];
                    [_badFish removeObject:bad];
                    [bad removeFromSuperview];
                    [gold bonusHP];
                }
            }
        }
    }
    for (BadFish *bad in _badFish.copy) {
        if (!bad.stillAlive) {
            [_arrayForFish removeObject:bad];
            [_badFish removeObject:bad];
            [bad removeFromSuperview];
        }else{
            for (GoodFish *good in _goodFish.copy) {
                CGRect intersect = (CGRectIntersection(good.frame, bad.frame));
                if (!CGSizeEqualToSize(CGSizeZero, intersect.size)) {
                    [_arrayForFish removeObject:good];
                    [_goodFish removeObject:good];
                    [good removeFromSuperview];
                    [bad eat];
                }
            }
        }
    }
}

- (IBAction)addGoodFish
{
    [self addGoodFish:[GoodFish new]];
}

- (void) addGoodFish:(GoodFish *)good
{
    [self.aquarium addSubview:good];
    [_arrayForFish addObject:good];
    [_goodFish addObject:good];
}

- (IBAction)addBadFish
{
    [self addBadFish:[BadFish new]];
}

- (void)addBadFish:(BadFish *)bad
{
    [self.aquarium addSubview:bad];
    [_arrayForFish addObject:bad];
    [_badFish addObject:bad];
}

- (IBAction)addGoldFish;
{
    [self addGoldFish:[GoldFish new]];
}

- (void) addGoldFish:(GoldFish *)gold
{
    [self.aquarium addSubview:gold];
    [_arrayForFish addObject:gold];
    [_goldFish addObject:gold];
}

- (IBAction)switchHealth:(id)sender
{
    if (_mySwitch.on) {
        for (Fish *fish in _arrayForFish) {
            [fish test];
        }
    }else{
        for (Fish *fish in _arrayForFish) {
            [fish test1];
        }
    }
}
- (IBAction)switchSound:(id)sender {
    if (_mySwitchSound.on) {
        [_player play];
    }else{
        [_player stop];
    }
}

-(IBAction)check
{
    [_arrayForFish removeAllObjects];
    [_badFish removeAllObjects];
    [_goldFish removeAllObjects];
    [_goodFish removeAllObjects];
    NSArray *viewsToRemove = [self.aquarium subviews];
    for (UIImageView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
}
@end