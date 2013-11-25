//
//  HelloWorldLayer.h
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/21/13.
//  Copyright Nic Launceford 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
