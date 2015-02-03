//
//  NodeFactory.h
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import <JKGameKit/JKGameKit.h>


@interface NodeFactory : JKNodeFactory

- (JKGameNode*) createGameNodeWithXMLObject:(JKObjectXML*)xmlObject;
- (JKGameNode*) createHero;

@end
