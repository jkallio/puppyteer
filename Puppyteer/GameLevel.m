//
//  StageBase.m
//  Puppyteer
//
//  Created by Jussi Kallio on 1.2.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import "HudNode.h"
#import "GameLevel.h"

@implementation GameLevel

- (instancetype) initWithLevelName:(NSString*)levelName
{
    if (self = [super initWithLevelName:levelName])
    {
        
    }
    return self;
}

- (BOOL) loadLevel
{
    return [super loadLevel];
}


- (JKHudNode*) loadHUD
{
    HudNode* hudNode = [HudNode node];
    return hudNode;
}

@end
