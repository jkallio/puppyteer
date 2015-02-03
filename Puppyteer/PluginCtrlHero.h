//
//  PluginControllerHero.h
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import <JKGameKit/JKGameKit.h>

@class ActionBase;

@interface PluginCtrlHero : JKPluginCtrlBase

#pragma mark -- State
@property (nonatomic, getter=isOnGround) BOOL onGround;
@property (nonatomic, getter=isRunning) BOOL running;
@property (nonatomic, getter=isWaiting) BOOL waiting;
@property (nonatomic) NSMutableArray* actionQueue;

#pragma mark -- Physical limits
@property (nonatomic) CGFloat runSpeed;
@property (nonatomic) CGFloat jumpForce;
@property (nonatomic) CGVector maxVelocity;

#pragma mark -- Contacting Nodes
@property (nonatomic, weak) JKGameNode* jumpSensor;

#pragma mark -- 
- (void) queueAction:(ActionBase*) action;

@end
