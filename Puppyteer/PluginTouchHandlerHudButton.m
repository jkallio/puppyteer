//
//  PluginTouchHandlerHudButton.m
//  MegaChallenge
//
//  Created by Jussi Kallio on 11.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import "Defines.h"
#import "HudNode.h"
#import "PluginCtrlHero.h"
#import "PluginTouchHandlerHudButton.h"

#define _heroCtrl ((PluginCtrlHero*)self.world.hero.controller)

@implementation PluginTouchHandlerHudButton

- (void)handleTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.node setScale:1.2];
}

- (void)handleTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)handleTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.node.name isEqualToString:NODE_NAME_HUD_BUTTON_SAVE])
    {
        if ([self.world saveLevel])
        {
            JKDebugLog(@"Level saved!");
        }
    }
}

- (void)handleTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouchesEnded:touches withEvent:event];
}


@end
