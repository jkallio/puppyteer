//
//  ActionBase.h
//  Puppyteer
//
//  Created by Jussi Kallio on 31.1.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import <JKGameKit/JKGameKit.h>

typedef enum _EActionType
{
    ACTION_INVALID,
    ACTION_RUN,
    ACTION_WAIT,
    ACTION_JUMP,
    ACTION_STAND
} EActionType;

@interface ActionBase : JKGameNode
{
    
}
- (EActionType) type;
@end
