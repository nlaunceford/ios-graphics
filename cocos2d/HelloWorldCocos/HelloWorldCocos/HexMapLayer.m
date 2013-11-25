//
//  HexMapLayer.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import "HexMapLayer.h"


@implementation HexMapLayer{
    BOOL needsDraw;
}

-(id) init
{
	if( (self=[super init])) {
        needsDraw = YES;
	}

	return self;
}

-(void) draw
{
    [self drawMap];
}

-(void) drawMap
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    float y = winSize.height - 40;

    HxBoard* board = [HxBoard boardWithHexSideSize:15 withBoardWidth:20 withBoardHeight:10 withOffsetX:5 withOffsetY:y];
    [board draw];
}

@end
