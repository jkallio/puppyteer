//
//  GameViewController.m
//  Puppyteer
//
//  Created by Jussi Kallio on 31.1.2015.
//  Copyright (c) 2015 Kallio. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "GameLevel.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    //skView.showsPhysics = YES;
    skView.ignoresSiblingOrder = YES; // Sprite Kit applies additional optimizations to improve rendering performance
    
    // Create and configure the scene.
    GameScene *scene = [GameScene sceneWithSize:skView.bounds.size Level:[[GameLevel alloc] initWithLevelName:@"level1_1"]];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
