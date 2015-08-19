//
//  GameViewController.m
//  SpriteKitSimpleGame
//
//  Created by amateur on 8/19/15.
//  Copyright (c) 2015 XA. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import <AVFoundation/AVFoundation.h>

@interface GameViewController ()
@property (nonatomic) AVAudioPlayer * backgroundMusicPlayer;

@end
@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [GameScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSError *error;
    NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"background-music-aac" withExtension:@"caf"];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    self.backgroundMusicPlayer.numberOfLoops = -1;
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    if (!skView.scene) {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        // Create and configure the scene.
        SKScene * scene = [GameScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
}
@end
