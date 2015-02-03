//
//  ActionWait.h
//  Puppyteer
//
//  Created by Jussi Kallio on 31.1.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import "ActionBase.h"

@interface ActionWait : ActionBase
{
    
}
@property (nonatomic) NSTimeInterval timeWaited;
@property (nonatomic) NSTimeInterval waitTime;
@end
