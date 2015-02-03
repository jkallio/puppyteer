//
//  PluginAnimationHero.m
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import "Defines.h"
#import "PluginCtrlHero.h"
#import "PluginAnimationHero.h"

#define _heroCtrl ((PluginCtrlHero*)((JKGameNode*)self.node.parent).controller)
#define _heroBody ((JKGameNode*)self.node.parent).physicsBody

static const float kFlipLimit = 50.0f;

@implementation PluginAnimationHero

- (instancetype) initWithNode:(SKNode<JKNodeProtocol> *)node
{
    if (self = [super initWithNode:node])
    {
        _facingLeft = NO;
    }
    return self;
}

- (void) onUpdate:(NSTimeInterval)dt
{
    // Flip-X
    if ((self.isFacingLeft && ((_heroBody.velocity.dx > kFlipLimit && self.spriteNode.xScale > 0) || (_heroBody.velocity.dx < -kFlipLimit && self.spriteNode.xScale < 0)))
        || (!self.isFacingLeft && ((_heroBody.velocity.dx > kFlipLimit && self.spriteNode.xScale < 0) || (_heroBody.velocity.dx < -kFlipLimit && self.spriteNode.xScale > 0))))
    {
        self.spriteNode.xScale *= -1;
    }
    
    // Rotate while jumping
    CGFloat dy = 0.0f;
    if (self.activeAnimID == HERO_ANIM_KEY_JUMP)
    {
        dy = ((self.node.xScale < 0 ? 1 : -1) * _heroBody.velocity.dy * 0.09 * M_PI)/215;
    }
    self.node.zRotation = dy > 0 ? MIN(45, dy) : MAX(-45, dy);
    
    // Change animation
    if (!_heroCtrl.isOnGround)
    {
        [self changeAnimation:HERO_ANIM_KEY_JUMP];
    }
    else if (_heroCtrl.isRunning)
    {
        [self changeAnimation:HERO_ANIM_KEY_MOVE];
    }
    else if (_heroCtrl.isWaiting)
    {
        [self changeAnimation:HERO_ANIM_KEY_WAIT];
    }
    else
    {
        [self changeAnimation:HERO_ANIM_KEY_STAND];
    }
}

@end
