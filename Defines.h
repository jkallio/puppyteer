//
//  Defines.h
//  MegaChallenge
//
//  Created by Jussi Kallio on 4.11.2014.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#ifndef MegaChallenge_Defines_h
#define MegaChallenge_Defines_h

#define OBJ_TYPE_NONE               0
#define OBJ_TYPE_DYNAMIC_BASE       OBJ_TYPE_NONE
#define OBJ_TYPE_HERO               OBJ_TYPE_DYNAMIC_BASE + 1
#define OBJ_TYPE_DYNAMIC_END        OBJ_TYPE_DYNAMIC_BASE + 2

#define OBJ_TYPE_STATIC_BASE        OBJ_TYPE_DYNAMIC_END
#define OBJ_TYPE_STATIC_END         OBJ_TYPE_STATIC_BASE + 1

#define OBJ_TYPE_SPECIAL_BASE       OBJ_TYPE_STATIC_END
#define OBJ_TYPE_SPECIAL_END        OBJ_TYPE_SPECIAL_BASE + 1

#define IS_DYNAMIC_NODE(x) (x > OBJ_TYPE_DYNAMIC_BASE && x < OBJ_TYPE_DYNAMIC_END)
#define IS_STATIC_NODE(x) (x > OBJ_TYPE_STATIC_BASE && x < OBJ_TYPE_STATIC_END)
#define IS_SPECIAL_NODE(x) (x > OBJ_TYPE_SPECIAL_BASE && x < OBJ_TYPE_SPECIAL_END)

#define NODE_NAME_HUD           @"NameHud"
#define NODE_NAME_HUD_BUTTON    @"NameButton"
#define NODE_NAME_HUD_SCORE     @"NameScore"
#define NODE_NAME_HUD_HISCORE   @"NameHiScore"

#define SENSOR_NAME_JUMP        @"SensorJump"

#define NODE_NAME_HUD_BUTTON_SAVE   @"btn_hud_save"

#define Z_POS_HUD           100
#define Z_POS_HERO          10
#define Z_POS_DYNAMIC       9
#define Z_POS_STATIC        8

#define HERO_ANIM_KEY_STAND     [NSNumber numberWithInteger:1]
#define HERO_ANIM_KEY_MOVE      [NSNumber numberWithInteger:2]
#define HERO_ANIM_KEY_JUMP      [NSNumber numberWithInteger:3]
#define HERO_ANIM_KEY_WAIT      [NSNumber numberWithInteger:4]


#endif
