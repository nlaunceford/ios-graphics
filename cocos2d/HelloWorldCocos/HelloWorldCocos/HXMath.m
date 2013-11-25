//
//  HXMath.m
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//
// http://www.codeproject.com/Articles/14948/Hexagonal-grid-for-games-and-other-projects-Part-1

#import "HXMath.h"

@implementation HXMath

+ (float) calculateHfromSideLength:(float) sideLength
{
    return sin([HXMath radiansFromDegrees:30]) * sideLength;
}

+ (float) calculateRfromSideLength:(float) sideLength
{
    return cos([HXMath radiansFromDegrees:30]) * sideLength;
}

+ (float) radiansFromDegrees:(float) theDegrees
{
    return theDegrees * M_PI / 180.0;
}
@end
