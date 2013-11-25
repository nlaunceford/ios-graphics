//
//  HelloWorldLayer.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/21/13.
//  Copyright Nic Launceford 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "HexMapLayer.h"
#import "CCTouchDispatcher.h"

CCSprite *seeker1;
CCSprite *cocosGuy;

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];

	// add layer as a child to scene
	//[scene addChild: [HelloWorldLayer node]];

    [scene addChild:[HexMapLayer node]];
	
	// return the scene
	return scene;
}

-(void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {

        // create and initialize our seeker sprite, and add it to this layer
        seeker1 = [CCSprite spriteWithFile: @"seeker.png"];
        seeker1.position = ccp( 50, 100 );
        [self addChild:seeker1];

        // do the same for our cocos2d guy, reusing the app icon as its image
        cocosGuy = [CCSprite spriteWithFile: @"Icon.png"];
        cocosGuy.position = ccp( 200, 300 );
        [self addChild:cocosGuy];

        // schedule a repeating callback on every frame
        [self schedule:@selector(nextFrame:)];

        self.touchEnabled = YES;
	}
	return self;
}

- (void) nextFrame:(ccTime)dt {
    seeker1.position = ccp( seeker1.position.x + 100*dt, seeker1.position.y );
    if (seeker1.position.x > 480+32) {
        seeker1.position = ccp( -32, seeker1.position.y );
    }
}


- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    [cocosGuy stopAllActions];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [self convertTouchToNodeSpace: touch];
	[cocosGuy stopAllActions];
	[cocosGuy runAction: [CCMoveTo actionWithDuration:10 position:location]];
    return YES;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
