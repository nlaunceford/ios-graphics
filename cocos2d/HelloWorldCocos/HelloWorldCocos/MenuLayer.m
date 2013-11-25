//
//  MenuLayer.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/21/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import "MenuLayer.h"
#import "HelloWorldLayer.h"

@implementation MenuLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];

	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];

	// add layer as a child to scene
	[scene addChild: layer];

	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        [self setUpMenus];
	}

	return self;
}

-(void) setUpMenus
{

	// Create some menu items
	CCMenuItemImage * menuItem1 = [CCMenuItemImage itemWithNormalImage:@"myfirstbutton.png"
                                                         selectedImage: @"myfirstbutton_selected.png"
                                                                target:self
                                                              selector:@selector(startGame:)];

	CCMenuItemImage * menuItem2 = [CCMenuItemImage itemWithNormalImage:@"mysecondbutton.png"
                                                         selectedImage: @"mysecondbutton_selected.png"
                                                                target:self
                                                              selector:@selector(startGame:)];


	CCMenuItemImage * menuItem3 = [CCMenuItemImage itemWithNormalImage:@"mythirdbutton.png"
                                                         selectedImage: @"mythirdbutton_selected.png"
                                                                target:self
                                                              selector:@selector(startGame:)];
    
    
	// Create a menu and add your menu items to it
	CCMenu * myMenu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, nil];
    
	// Arrange the menu items vertically
	[myMenu alignItemsVertically];
    
	// add the menu to your scene
	[self addChild:myMenu];
}


-(void) startGame: (CCMenuItem  *) menuItem
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1.0 scene:[HelloWorldLayer scene] ]];
}

@end
