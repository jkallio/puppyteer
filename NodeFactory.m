//
//  NodeFactory.m
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2014 Kallio. All rights reserved.
//

#import "Defines.h"
#import "PluginCtrlHero.h"
#import "PluginAnimationHero.h"
#import "PluginContactHandlerHero.h"
#import "PluginContactHandlerHeroJumpSensor.h"
#import "NodeFactory.h"

@implementation NodeFactory

- (JKGameNode*) createGameNodeWithXMLObject:(JKObjectXML*)xmlObject
{
    JKGameNode* gameNode = nil;
    switch (xmlObject.objType)
    {
        case OBJ_TYPE_HERO:
        {
            gameNode = [self createHero];
            gameNode.position = xmlObject.position;
            gameNode.zPosition = xmlObject.zPosition;
        } break;
            
        default:
            JKAssert(NO, @"TODO: unknown object type %d", (int)xmlObject.objType);
            break;
    }
    return gameNode;
}

- (JKGameNode*) createHero;
{
    JKGameNode* hero = [JKGameNode node];
    hero.objID = OBJ_TYPE_HERO;
    hero.objType = OBJ_TYPE_HERO;
    hero.name = NODE_NAME_HERO;
    
    [hero setSpriteTexture:[__sharedTextureCache getTextureNamed:@"toby_sit0"]];
    hero.spriteNode.anchorPoint = CGPointMake(0.5f, 0.4f);
    
    hero.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:hero.spriteNode.size.height/3];
    hero.physicsBody.allowsRotation = NO;
    hero.physicsBody.mass = 10.0f;
    hero.physicsBody.friction = 0.7f;
    hero.physicsBody.linearDamping = 0.0f;
    hero.physicsBody.restitution = 0.0f;
    hero.physicsBody.categoryBitMask = kCatHero;
    hero.physicsBody.collisionBitMask = kCollisionMaskHero;
    hero.physicsBody.contactTestBitMask = kContactMaskHero;
    
    PluginAnimationHero* anim = [PluginAnimationHero createAndAttachToNode:hero.spriteNode];
    [anim.actions setObject:[PluginAnimationHero createAnimationWithFrames:[__sharedTextureCache getTexturesWithNameBase:@"toby_stand" Count:5] Freq:0.08 Revert:YES] forKey:HERO_ANIM_KEY_STAND];
    [anim.actions setObject:[PluginAnimationHero createAnimationWithFrames:[__sharedTextureCache getTexturesWithNameBase:@"toby_run" Count:8] Freq:0.08 Revert:NO] forKey:HERO_ANIM_KEY_JUMP];
    [anim.actions setObject:[PluginAnimationHero createAnimationWithFrames:[__sharedTextureCache getTexturesWithNameBase:@"toby_jump" Count:2] Freq:0.08 Revert:NO] forKey:HERO_ANIM_KEY_JUMP];
    [anim.actions setObject:[PluginAnimationHero createAnimationWithFrames:[__sharedTextureCache getTexturesWithNameBase:@"toby_sit" Count:1] Freq:0.01 Revert:NO] forKey:HERO_ANIM_KEY_WAIT];
    anim.idleAnimID = HERO_ANIM_KEY_STAND;
    
    [PluginCtrlHero createAndAttachToNode:hero];
    [PluginContactHandlerHero createAndAttachToNode:hero];
    
    JKGameNode* jumpSensor = [JKGameNode node];
    jumpSensor.spriteNode = [JKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(hero.spriteNode.size.width/2.0f, hero.spriteNode.size.height/4.0f)];
    jumpSensor.position = CGPointMake(0.0f, -hero.spriteNode.size.height/2.0f + jumpSensor.spriteNode.size.height/2.0f);
    [PluginContactHandlerHeroJumpSensor createAndAttachToNode:jumpSensor];
    [hero setSensor:jumpSensor Name:SENSOR_NAME_JUMP];
    
    return hero;
}

@end
