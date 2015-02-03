//
//  GameScene.m
//  Puppyteer
//
//  Created by Jussi Kallio on 31.1.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import "Defines.h"
#import "NodeFactory.h"
#import "GameScene.h"

@implementation GameScene

- (instancetype) initWithSize:(CGSize)size Level:(JKWorldNode*)level
{
    if (self = [super initWithSize:size Level:level])
    {
        self.nodeFactory = [NodeFactory new];
    }
    return self;
}

@end
