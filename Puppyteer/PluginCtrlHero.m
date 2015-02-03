//
//  PluginControllerHero.m
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import "Defines.h"
#import "ActionRun.h"
#import "ActionJump.h"
#import "ActionWait.h"
#import "PluginCtrlHero.h"

@interface PluginCtrlHero()
@property (nonatomic) NSTimeInterval timeSincePrevJump;
@property (nonatomic) NSTimeInterval timeInAir;
@property (nonatomic) NSTimeInterval jumpTimeout;
@property (nonatomic) BOOL canJump;
@property (nonatomic) BOOL shouldJump;

- (CGVector) addForcesToCurrentVelocity:(CGVector)curVelocity Timestep:(NSTimeInterval)dt;
@end

@implementation PluginCtrlHero

- (instancetype) initWithNode:(SKNode<JKNodeProtocol> *)node
{
    if (self = [super initWithNode:node])
    {
        _runSpeed = 180.0f;
        _jumpForce = 60.0f;
        _timeInAir = 0.0f;
        _maxVelocity = CGVectorMake(250.0f, 400.0f);

        _onGround = NO;
        _canJump = NO;
        _shouldJump = NO;
    }
    return self;
}

- (void) onGameBegin
{
    [super onGameBegin];
    self.shouldJump = NO;
}

- (void) onUpdate:(NSTimeInterval)dt
{
    self.timeSincePrevJump += dt;
    if (!self.onGround)
    {
        self.timeInAir += dt;
    }
    if (self.isWaiting)
    {
        [ActionWait cast:self.actionQueue.firstObject].waitTime += dt;
    }
    //self.node.physicsBody.velocity = [self addForcesToCurrentVelocity:self.node.physicsBody.velocity Timestep:dt];
}

- (void) queueAction:(ActionBase*) action
{
    [self.actionQueue addObject:action];
}

/*
#pragma mark --
- (CGVector) addForcesToCurrentVelocity:(CGVector)curVelocity Timestep:(NSTimeInterval)dt
{
    if (self.isRunning)
    {
        curVelocity.dx = self.propDirectionLeft ? MAX(-self.runSpeed, curVelocity.dx - self.runSpeed/5.0f) : MIN(self.runSpeed, curVelocity.dx + self.runSpeed/5.0f);
    }
    else if (ABS(curVelocity.dx) > 0)
    {
        CGFloat factor = self.onGround ? 20 : 2;
        CGVector inertiaStep = CGVectorScalarMultiply(CGVectorMake(-factor * curVelocity.dx, 0.0f), dt);
        curVelocity = CGVectorAdd(curVelocity, inertiaStep);
    }

    if (self.shouldJump)
    {
        if (self.jumpTimeout > 0.1f || self.timeInAir > 0.25)
        {
            self.shouldJump = NO;
            self.canJump = NO;
        }
        
        if (self.canJump)
        {
            curVelocity = CGVectorAdd(curVelocity, CGVectorMake(0.0f, self.jumpForce));
            
            if (curVelocity.dy >= self.maxVelocity.dy)
            {
                self.jumpTimeout += dt;
                curVelocity.dy = self.maxVelocity.dy;
            }
        }
    }
    return curVelocity;
}
*/

#pragma mark -- Getters/Setters
- (BOOL) isWaiting
{
    return [self.actionQueue.firstObject isKindOfClass:[ActionWait class]];
}

- (JKGameNode*) jumpSensor
{
    if (!_jumpSensor)
    {
        _jumpSensor = [self.gameNode sensorNamed:SENSOR_NAME_JUMP];
    }
    return _jumpSensor;
}

- (void) setOnGround:(BOOL)onGround
{
    if (onGround && !_onGround)
    {
        self.jumpTimeout = 0.0f;
        self.timeInAir = 0.0f;
        self.canJump = YES;
    }
    _onGround = onGround;
}

- (void) updateContactFlags
{
    for (SKPhysicsBody* body in self.jumpSensor.physicsBody.allContactedBodies)
    {
        if (body.collisionBitMask & self.node.physicsBody.collisionBitMask)
        {
            _onGround = YES;
            break;
        }
    }
}

@end
