//
//  PluginContactHandlerHeroJumpSensor.m
//  MegaRun
//
//  Created by Jussi Kallio on 22.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import "Defines.h"
#import "PluginCtrlHero.h"
#import "PluginContactHandlerHeroJumpSensor.h"

#define _heroCtrl ((PluginCtrlHero*)((JKGameNode*)self.node.parent).controller)
#define _heroNode ((JKGameNode*)self.node.parent)

static const float kSwitchDelay = 0.75f;

@implementation PluginContactHandlerHeroJumpSensor

- (void) contactBeganWith:(JKGameNode*)nodeB
{
    switch (nodeB.objType)
    {
        default:
            break;
    }
}

- (void) contactEndedWith:(JKGameNode*)nodeB
{
}

@end
