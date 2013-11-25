//
//  HXMath.h
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXMath : NSObject
+ (float) calculateHfromSideLength:(float) sideLength;
+ (float) calculateRfromSideLength:(float) sideLength;
+ (float) radiansFromDegrees:(float) theDegrees;

@end
