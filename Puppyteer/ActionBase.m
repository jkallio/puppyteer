//
//  ActionBase.m
//  Puppyteer
//
//  Created by Jussi Kallio on 31.1.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import "ActionRun.h"
#import "ActionJump.h"
#import "ActionWait.h"
#import "ActionStand.h"
#import "ActionBase.h"

@implementation ActionBase

- (EActionType) type
{
    if ([self isKindOfClass:[ActionRun class]])
    {
        return ACTION_RUN;
    }
    else if ([self isKindOfClass:[ActionRun class]])
    {
        return ACTION_JUMP;
    }
    else if ([self isKindOfClass:[ActionRun class]])
    {
        return ACTION_WAIT;
    }
    else if ([self isKindOfClass:[ActionRun class]])
    {
        return ACTION_STAND;
    }
    else
    {
        return ACTION_INVALID;
    }
}

@end
