//
//  HxBoard.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import "HxBoard.h"
#import "HXMath.h"
#import "HXHexagon.h"

@implementation HxBoard{
    float sideSize;
    int boardWidth;
    int boardHeight;
    int xOffset;
    int yOffset;
    float hexH;
    float hexR;
    float hexWidth;
    float hexHeight;
    NSMutableDictionary* hexes;
}

+ (instancetype) boardWithHexSideSize:(float)hexSideSize
                       withBoardWidth:(int)boardWidth
                      withBoardHeight:(int)boardHeight
                          withOffsetX:(int)xOffset
                          withOffsetY:(int)yOffset
{
    return [[self alloc] initWithHexSideSize:hexSideSize withBoardWidth:boardWidth withBoardHeight:boardHeight withOffsetX:xOffset withOffsetY:yOffset];
}

- (instancetype) initWithHexSideSize:(float)theHexSideSize
                            withBoardWidth:(int)theBoardWidth
                            withBoardHeight:(int)theBoardHeight
                            withOffsetX:(int)theXOffset
                            withOffsetY:(int)theYOffset
{

    self = [super init];
    if(self){
        sideSize = theHexSideSize;
        boardHeight = theBoardHeight;
        boardWidth = theBoardWidth;
        xOffset = theXOffset;
        yOffset = theYOffset;
        hexWidth = sideSize + hexH;
        hexHeight = hexR + hexR;
        hexH = [HXMath calculateHfromSideLength:sideSize];
        hexR = [HXMath calculateRfromSideLength:sideSize];
        [self buildBoard];
    }
    return self;

}

- (void)buildBoard
{
    hexes = [[NSMutableDictionary alloc] init];

    for (int x = 0; x<boardWidth; x++) {
        for (int y = 0; y <boardHeight; y++) {
            HXHexagon* hex =  [self buildHexAtIndex:x yIndex:y];
            [hexes setObject:hex forKey:[self keyForIndex:x y:y]];
        }
    }
}

- (HXHexagon*) buildHexAtIndex:(int)xIndex yIndex:(int)yIndex
{
    CGPoint origin;

    if (xIndex == 0 && yIndex == 0) {
        //First Hex
        origin = CGPointMake(xOffset + hexH, yOffset);
    } else if( xIndex == 0) {
        //First hex on a new row
        //Get origin from neighbor above
        HXHexagon* upperNeighbor = [self hexAtIndex:xIndex y:(yIndex - 1)];
        CGPoint upperNeighborOrigin = [upperNeighbor middleLeftPoint];
        origin = CGPointMake(upperNeighborOrigin.x, (upperNeighborOrigin.y - hexR - hexR));
    } else {
        //Build to the right
        //Get hex that will be to the left of the new hex:
        HXHexagon* leftNeighbor = [self hexAtIndex:(xIndex-1) y:yIndex];

        //stagger even/odds up and down:
        if(xIndex % 2 == 0) {
            origin = [leftNeighbor lowerRightPoint];
        } else {
            origin = [leftNeighbor upperRightPoint];
        }
    }

    return [HXHexagon HexagonWithSideLength:sideSize withOriginX:origin.x withOriginY:origin.y];
}

- (void) draw {
    for(HXHexagon* hex in [hexes allValues]) {
        [hex draw];
    }
}

- (NSString * ) keyForIndex:(int)x y:(int)y
{
    return [NSString stringWithFormat: @"%d %d", x, y];
}

- (HXHexagon* ) hexAtIndex:(int)x y:(int)y
{
    NSString* key = [self keyForIndex:x y:y];
    return [hexes objectForKey:key];
}

@end
