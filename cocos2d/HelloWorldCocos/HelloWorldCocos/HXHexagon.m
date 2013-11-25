//
//  HXHexagon.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import "HXHexagon.h"
#import "HXMath.h"


@implementation HXHexagon{
    NSArray *vertices;
    float x;
    float y;
    float sideLength;
}

+ (instancetype)HexagonWithSideLength:(float)sideLength withOriginX:(float)x withOriginY:(float)y
{
    return [[self alloc]initWithOriginAndSide:sideLength withOriginX:x withOriginY:y];
}

- (instancetype)initWithOriginAndSide:(float)theSideLength withOriginX:(float)originX withOriginY:(float)originY
{
    self = [super init];
    if (self) {
        sideLength = theSideLength;
        x = originX;
        y = originY;
        [self buildVertices];
    }
    return self;

}

-(void) buildVertices
{
    float h = [HXMath calculateHfromSideLength:sideLength];
    float r = [HXMath calculateRfromSideLength:sideLength];

    NSMutableArray *workingArray = [NSMutableArray arrayWithCapacity:6];

    [workingArray insertObject:[self nsPointValueFor:x y:y]  atIndex:0];
    [workingArray insertObject:[self nsPointValueFor:(x + h) y:(y-r)] atIndex:1];
    [workingArray insertObject:[self nsPointValueFor:(x + sideLength + h) y:(y-r)] atIndex:2];
    [workingArray insertObject:[self nsPointValueFor:(x + sideLength + h + h) y:y] atIndex:3];
    [workingArray insertObject:[self nsPointValueFor:(x + h + sideLength)  y:(y+r)] atIndex:4];
    [workingArray insertObject:[self nsPointValueFor:(x + h) y:(y+r)] atIndex:5];

    vertices = [workingArray copy];
}

- (void) draw
{
    CGPoint pointsArray[] = {[self middleLeftPoint], [self lowerLeftPoint], [self lowerRightPoint], [self middleRightPoint], [self upperRightPoint], [self upperLeftPoint]};
    ccDrawColor4F(.5, .3, .6, .8);
    ccDrawPoly (pointsArray, 6, YES);
    [self drawPointOnOrigin];
}

- (void) drawPointOnOrigin
{
    ccDrawSolidRect(CGPointMake(x-1, y-1), CGPointMake(x+1, y+1), ccc4f(0.0f, 0.6f, 1.0f, 0.7f));
}

- (CGPoint) middleLeftPoint
{
    return [self pointAtIndex:0];
}

- (CGPoint) lowerLeftPoint
{
    return [self pointAtIndex:1];
}

- (CGPoint) lowerRightPoint
{
    return [self pointAtIndex:2];
}

- (CGPoint) middleRightPoint
{
    return [self pointAtIndex:3];
}

- (CGPoint) upperRightPoint
{
    return [self pointAtIndex:4];
}

- (CGPoint) upperLeftPoint
{
    return [self pointAtIndex:5];
}

- (CGPoint) centerPoint
{
    float centerX = ([self middleRightPoint].x + [self middleLeftPoint].x)/2;
    return CGPointMake(centerX, [self middleRightPoint].y);
}

- (CGPoint) pointAtIndex:(int)index
{
    return [[vertices objectAtIndex:index] CGPointValue];
}

- (NSValue *) nsPointValueFor:(float)theX y:(float)theY {
    return [NSValue valueWithCGPoint:CGPointMake(theX, theY)];
}
@end
